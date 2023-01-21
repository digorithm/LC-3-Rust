// Opcodes are fundamental operations to the CPU, LC-3 only has 16 opcodes.
// Each instruction is 16 bits long, with first 4 bits storing the Opcode,
// the rest is reserved for the parameter.
use super::vm::VM;

use std::io;
use std::io::Read;
use std::io::Write;
use std::process;

#[derive(Debug)]
pub enum OpCode {
    BR = 0, // branch
    ADD,    // add
    LD,     // load
    ST,     // store
    JSR,    // jump register
    AND,    // bitwise and
    LDR,    // load register
    STR,    // store register
    RTI,    // unused
    NOT,    // bitwise not
    LDI,    // load indirect
    STI,    // store indirect
    JMP,    // jump
    RES,    // reserved (unused)
    LEA,    // load effective address
    TRAP,   // execute trap
}

// TRAP Codes
pub enum TrapCode {
    /// get character from keyboard
    Getc = 0x20,
    /// output a character
    Out = 0x21,
    /// output a word string
    Puts = 0x22,
    /// input a string
    In = 0x23,
    /// output a byte string
    Putsp = 0x24,
    /// halt the program
    Halt = 0x25,
}

pub fn execute_instruction(instr: u16, vm: &mut VM) {
    // Extract OPCode from the instruction
    let op_code = get_op_code(&instr);

    // Match OPCode and execute instruction
    match op_code {
        Some(OpCode::ADD) => add(instr, vm),
        Some(OpCode::AND) => and(instr, vm),
        Some(OpCode::NOT) => not(instr, vm),
        Some(OpCode::BR) => br(instr, vm),
        Some(OpCode::JMP) => jmp(instr, vm),
        Some(OpCode::JSR) => jsr(instr, vm),
        Some(OpCode::LD) => ld(instr, vm),
        Some(OpCode::LDI) => ldi(instr, vm),
        Some(OpCode::LDR) => ldr(instr, vm),
        Some(OpCode::LEA) => lea(instr, vm),
        Some(OpCode::ST) => st(instr, vm),
        Some(OpCode::STI) => sti(instr, vm),
        Some(OpCode::STR) => str(instr, vm),
        Some(OpCode::TRAP) => trap(instr, vm),
        _ => {}
    }
}

// Each instruction is 16 bits long, with the left 4 bits storing the opcode.
// The rest of the bits are used to store the parameters.
// To extract left 4 bits out of the instruction, we'll use a right bit shift `>>`
// operator and shift to the right the first 4 bits 12 positions.
pub fn get_op_code(instruction: &u16) -> Option<OpCode> {
    match instruction >> 12 {
        0 => Some(OpCode::BR),
        1 => Some(OpCode::ADD),
        2 => Some(OpCode::LD),
        3 => Some(OpCode::ST),
        4 => Some(OpCode::JSR),
        5 => Some(OpCode::AND),
        6 => Some(OpCode::LDR),
        7 => Some(OpCode::STR),
        8 => Some(OpCode::RTI),
        9 => Some(OpCode::NOT),
        10 => Some(OpCode::LDI),
        11 => Some(OpCode::STI),
        12 => Some(OpCode::JMP),
        13 => Some(OpCode::RES),
        14 => Some(OpCode::LEA),
        15 => Some(OpCode::TRAP),
        _ => None,
    }
}

/// ADD takes two values and stores them in a register.
/// In register mode, the second value to add is found in a register.
/// In immediate mode, the second value is embedded in the right-most 5 bits of the instruction.
/// Values which are shorter than 16 bits need to be sign extended.
/// Any time an instruction modifies a register, the condition flags need to be updated
/// If bit [5] is 0, the second source operand is obtained from SR2.
/// If bit [5] is 1, the second source operand is obtained by sign-extending the imm5 field to 16 bits.
/// In both cases, the second source operand is added to the contents of SR1 and the result stored in DR.
/// The condition codes are set, based on whether the result is negative, zero, or positive.
/// Encoding:
///
/// 15           12 │11        9│8         6│ 5 │4     3│2         0
/// ┌───────────────┼───────────┼───────────┼───┼───────┼───────────┐
/// │      0001     │     DR    │  SR1      │ 0 │  00   │    SR2    │
/// └───────────────┴───────────┴───────────┴───┴───────┴───────────┘
///
///  15           12│11        9│8         6│ 5 │4                 0
/// ┌───────────────┼───────────┼───────────┼───┼───────────────────┐
/// │      0001     │     DR    │  SR1      │ 1 │       IMM5        │
/// └───────────────┴───────────┴───────────┴───┴───────────────────┘
pub fn add(instruction: u16, vm: &mut VM) {
    // Get destination address using bitwise operation tricks.
    // `instruction >> 9` will shift the binary from instruction it 9 times to the right
    // That means the last bit will be the end of the DR portion of the instruction
    // And the bitwise-and (`&`) `0x7` will grab only the length of `111` out of the
    // instruction, i.e the last 3 bits, which is exactly the length of the DR.
    let dr = (instruction >> 9) & 0x7;

    // First operand -- Same things as described above, but we move only 6 times to grab the sr1.
    let sr1 = (instruction >> 6) & 0x7;

    // Check if we're in immediate mode or register mode. Grab just the imm_flag portion of the
    // instruction
    let imm_flag = (instruction >> 5) & 0x1;

    if imm_flag == 1 {
        let imm5 = sign_extend(instruction & 0x1F, 5);

        // This is declared as u32 to prevent from overflow.
        let val: u32 = imm5 as u32 + vm.registers.get(sr1) as u32;

        // Set the result of the sum to the target register
        vm.registers.update(dr, val as u16);
    } else {
        // If not immediate mode, we need to extract the second register.
        let sr2 = instruction & 0x7;

        // Proceed as usual
        let val: u32 = vm.registers.get(sr1) as u32 + vm.registers.get(sr2) as u32;

        // Set the result of the sum to the target register
        vm.registers.update(dr, val as u16);
    }

    // Update the cond register. We pass `dr` here because this is the register that
    // has the result of the last operation. Remember that the cond register's idea
    // is to set positive/negative/zero based on the result of the last operation,
    // which in this case live in `dr`.
    vm.registers.update_r_cond_register(dr);
}

/// Load indirect
/// An address is computed by sign-extending bits [8:0] to 16 bits and adding this
/// value to the incremented PC. What is stored in memory at this address is the address
/// of the data to be loaded into DR. The condition codes are set, based on whether the
// value loaded is negative, zero, or positive.
///
/// Encoding:
///
///  15           12 11        9 8                                 0
/// ┌───────────────┬───────────┬───────────────────────────────────┐
/// │      1010     │     DR    │               PCOffset9           │
/// └───────────────┴───────────┴───────────────────────────────────┘
pub fn ldi(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;

    // Get the PC offset and sign extend it to be 16 bits
    let pc_offset = sign_extend(instruction & 0x1ff, 9);

    // This sum is an address to a location in memory, and that address contains
    //  another value which is the address of the value to load. That's why it's called "indirect".
    let first_read = vm.read_memory(vm.registers.pc + pc_offset);

    // Read the resulting address and update the DR.
    let resulting_address = vm.read_memory(first_read);
    vm.registers.update(dr, resulting_address);
    vm.registers.update_r_cond_register(dr);
}

/// Your good old logical `and` function. Two operation modes, immediate or passing a register.
///
/// 15           12 │11        9│8         6│ 5 │4     3│2         0
/// ┌───────────────┼───────────┼───────────┼───┼───────┼───────────┐
/// │      0101     │     DR    │  SR1      │ 0 │  00   │    SR2    │
/// └───────────────┴───────────┴───────────┴───┴───────┴───────────┘

///  15           12│11        9│8         6│ 5 │4                 0
/// ┌───────────────┼───────────┼───────────┼───┼───────────────────┐
/// │      0101     │     DR    │  SR1      │ 1 │       IMM5        │
/// └───────────────┴───────────┴───────────┴───┴───────────────────┘
pub fn and(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;

    // As seen in `add` fn, same tricks.
    let sr1 = (instruction >> 6) & 0x7;
    let imm_flag = (instruction >> 5) & 0x1;

    if imm_flag == 1 {
        let imm5 = sign_extend(instruction & 0x1F, 5);
        // Perform the bitwise and (`&`) and store its value in the DR.
        vm.registers.update(dr, vm.registers.get(sr1) & imm5);
    } else {
        let sr2 = instruction & 0x7;
        // Perform the bitwise and (`&`) and store its value in the DR.
        vm.registers
            .update(dr, vm.registers.get(sr1) & vm.registers.get(sr2));
    }

    vm.registers.update_r_cond_register(dr);
}

/// Simple binary negation.
/// 15           12 │11        9│8         6│ 5 │4                 0
/// ┌───────────────┼───────────┼───────────┼───┼───────────────────┐
/// │      1001     │     DR    │     SR    │ 1 │       1111        │
/// └───────────────┴───────────┴───────────┴───┴───────────────────┘
pub fn not(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;
    let sr1 = (instruction >> 6) & 0x7;
    vm.registers.update(dr, !vm.registers.get(sr1));

    vm.registers.update_r_cond_register(dr);
}

/// The branching operation; means to go somewhere else in the assembly code
/// depending on whether some conditions are met.
/// The condition codes specified by the state of bits [11:9] are tested.
/// If bit [11] is set, N is tested; if bit [11] is clear, N is not tested.
/// If bit [10] is set, Z is tested. If any of the condition codes tested is set,
/// the program branches to the location specified by
/// adding the sign-extended PCOffset9 field to the incremented PC.
///
/// 15           12 │11 │10 │ 9 │8                                 0
/// ┌───────────────┼───┼───┼───┼───────────────────────────────────┐
/// │      0000     │ N │ Z │ P │             PCOffset9             │
/// └───────────────┴───┴───┴───┴───────────────────────────────────┘
pub fn br(instruction: u16, vm: &mut VM) {
    // Grab the PCOffset of the instruction and sign extend it
    // You can read more sign extension inside the `sign_extend` fn.
    let pc_offset = sign_extend((instruction) & 0x1ff, 9);

    // Shift 9 and grab 3 bits (& 0x7 is doing that)
    // You can read more about this trick inside `lea` fn.
    let cond_flag = (instruction >> 9) & 0x7;

    // so we're taking the `001`, xor `010`, xor `100` that's stored in the condition register
    // and `&`ing it to the `001`, or `010`, or `100` coming from the instruction,
    // note that it can be `110`, `111` or any combination.
    if cond_flag & vm.registers.cond != 0 || cond_flag == 0 {
        let val: u32 = vm.registers.pc as u32 + pc_offset as u32;
        vm.registers.pc = val as u16;
    }

    // If the branch isn't taken (no condition met), PC isn't changed
    // and PC will just point to the next sequential instruction.
}

/// The program unconditionally jumps to the location specified by the contents of the base register.
/// Bits [8:6] identify the base register. `RET` is listed as a separate instruction
/// in the specification, since it is a different keyword in assembly.
/// However, it is actually a special case of JMP. RET happens whenever R1 is 7.
///
///  15           12│11        9│8         6│ 5                    0
/// ┌───────────────┼───────────┼───────────┼───────────────────────┐
/// │      1100     │    000    │   BaseR   │       00000           │
/// └───────────────┴───────────┴───────────┴───────────────────────┘
///  15           12│11        9│8         6│ 5                    0
/// ┌───────────────┼───────────┼───────────┼───────────────────────┐
/// │      1100     │    000    │    111    │       00000           │
/// └───────────────┴───────────┴───────────┴───────────────────────┘
pub fn jmp(instruction: u16, vm: &mut VM) {
    // base_reg will either be an arbitrary register or the register 7 (`111`) which in this
    // case it would be the `RET` operation.
    let base_reg = (instruction >> 6) & 0x7;
    vm.registers.pc = vm.registers.get(base_reg);
}

/// First, the incremented PC is saved in R7.
/// This is the linkage back to the calling routine.
/// Then the PC is loaded with the address of the first instruction of the subroutine,
/// causing an unconditional jump to that address.
/// The address of the subroutine is obtained from the base register (if bit [11] is 0),
/// or the address is computed by sign-extending bits [10:0] and adding this value to the incremented PC (if bit [11] is 1).

///  15           12│11 │10
/// ┌───────────────┼───┼───────────────────────────────────────────┐
/// │      0100     │ 1 │                PCOffset11                 │
/// └───────────────┴───┴───────────────────────────────────────────┘
///  15           12│11 │10    9│8     6│5                         0
/// ┌───────────────┼───┼───────┼───────┼───────────────────────────┐
/// │      0100     │ 0 │   00  │ BaseR │           00000           │
/// └───────────────┴───┴───────┴───────┴───────────────────────────┘
pub fn jsr(instruction: u16, vm: &mut VM) {
    // Grab the base register
    let base_reg = (instruction >> 6) & 0x7;

    // 0x7ff == 11111111111 (11 ones, exactly the length of PCOffset11)
    // Grab it and extend it to 16 bits.
    let long_pc_offset = sign_extend(instruction & 0x7ff, 11);

    // Grab the flag bit at [11] and test it
    let long_flag = (instruction >> 11) & 1;

    // Save the incremented PC in R7
    vm.registers.r7 = vm.registers.pc;

    if long_flag != 0 {
        // JSR case, the address to jump is computed from PCOffset11
        let val: u32 = vm.registers.pc as u32 + long_pc_offset as u32;
        vm.registers.pc = val as u16;
    } else {
        // JSRR case, address to jump to lives in the base register
        vm.registers.pc = vm.registers.get(base_reg);
    }
}

/// An address is computed by sign-extending bits [8:0] to 16 bits and
/// adding this value to the incremented PC.
/// The contents of memory at this address are loaded into DR.
/// The condition codes are set, based on whether the value loaded is negative, zero, or positive.
///
///  15           12│11        9│8                                 0
/// ┌───────────────┼───────────┼───────────────────────────────────┐
/// │      0010     │     DR    │            PCOffset9              │
/// └───────────────┴───────────┴───────────────────────────────────┘
pub fn ld(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;

    // Grab the PCOffset and sign extend it
    let pc_offset = sign_extend(instruction & 0x1ff, 9);

    let mem: u32 = pc_offset as u32 + vm.registers.pc as u32;

    // Read the value from the place where the memory above was computed
    let value = vm.read_memory(mem as u16);

    // Save that value to the direct register and update the condition register
    vm.registers.update(dr, value);
    vm.registers.update_r_cond_register(dr);
}

/// Load base + offset
/// An address is computed by sign-extending bits [5:0] to 16 bits
/// and adding this value to the contents of the register specified by bits [8:6].
/// The contents of memory at this address are loaded into DR.
/// The condition codes are set, based on whether the value loaded is negative, zero, or positive.
///
///  15           12│11        9│8             6│5                 0
/// ┌───────────────┼───────────┼───────────────┼───────────────────┐
/// │      1010     │     DR    │     BaseR     │     PCOffset6     │
/// └───────────────┴───────────┴───────────────┴───────────────────┘
pub fn ldr(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;

    // Grab the base register
    let base_reg = (instruction >> 6) & 0x7;

    // Grab the offset6 and sign extend it
    let offset = sign_extend(instruction & 0x3F, 6);

    // Compute the memory location to be loaded
    let val: u32 = vm.registers.get(base_reg) as u32 + offset as u32;

    // Read the value at that memory location
    let mem_value = vm.read_memory(val as u16).clone();

    // Update the register with the loaded value and update the condition register
    vm.registers.update(dr, mem_value);
    vm.registers.update_r_cond_register(dr);
}

/// An address is computed by sign-extending bits [8:0] to 16 bits and adding
/// this value to the incremented PC.
/// This address is loaded into DR. The condition codes are set, based on whether the
/// value loaded is negative, zero, or positive.
///
///  15           12│11        9│8                                 0
/// ┌───────────────┼───────────┼───────────────────────────────────┐
/// │      1110     │     DR    │            PCOffset9              │
/// └───────────────┴───────────┴───────────────────────────────────┘
pub fn lea(instruction: u16, vm: &mut VM) {
    // This (instruction >> 9) & 0x7 is trying to say: shift it so that the last three bits
    // are the direct register we're looking for, mask it with 0x7 (`0b0000000000000111`) so that
    // we clear _everything_ up to the last three bits, which is what we want.
    // The resulting 16 bits value will be _exactly_ the direct register!
    let dr = (instruction >> 9) & 0x7;

    // 0x1ff is `111111111`, 9 consecutive ones.
    let pc_offset = sign_extend(instruction & 0x1ff, 9);

    // Value that we want to store in the register (`dr`)
    // Which is the current program counter + the
    // calculated offset.
    let val: u32 = vm.registers.pc as u32 + pc_offset as u32;

    vm.registers.update(dr, val as u16);

    vm.registers.update_r_cond_register(dr);
}

/// The contents of the register specified by SR are stored in the memory location
/// whose address is computed by sign-extending bits [8:0] to 16 bits and adding
/// this value to the incremented PC.
///
///  15           12│11        9│8                                 0
/// ┌───────────────┼───────────┼───────────────────────────────────┐
/// │      0011     │     SR    │            PCOffset9              │
/// └───────────────┴───────────┴───────────────────────────────────┘
pub fn st(instruction: u16, vm: &mut VM) {
    // Get the direct register encoded in the instruction (see `add` fn for more in-depth details)
    let sr = (instruction >> 9) & 0x7;

    // Grab the PC offset and sign extend it
    let pc_offset = sign_extend(instruction & 0x1ff, 9);

    // Add the current PC to the PC offset
    // We're doing these conversions to avoid overflow
    let val: u32 = vm.registers.pc as u32 + pc_offset as u32;
    let val: u16 = val as u16;

    // Store the value in the register being passed in the instruction at
    // the address computed above
    vm.write_memory(val as usize, vm.registers.get(sr));
}

/// The contents of the register specified by SR are stored in the memory location
/// whose address is obtained as follows: Bits [8:0] are sign-extended to 16 bits and added to the incremented PC.
/// What is in memory at this address is the address of the location to which the data in SR is stored.
///
///  15           12│11        9│8                                 0
/// ┌───────────────┼───────────┼───────────────────────────────────┐
/// │      1011     │     SR    │            PCOffset9              │
/// └───────────────┴───────────┴───────────────────────────────────┘
pub fn sti(instruction: u16, vm: &mut VM) {
    // Get the register encoded in the instruction (see `add` fn for more in-depth details)
    let sr = (instruction >> 9) & 0x7;

    // Grab the PC offset and sign extend it
    let pc_offset = sign_extend(instruction & 0x1ff, 9);

    // Add the current PC to the PC offset
    // We're doing these conversions to avoid overflow
    let val: u32 = vm.registers.pc as u32 + pc_offset as u32;
    let val: u16 = val as u16;

    // This is the difference between STI and ST
    let address = vm.read_memory(val) as usize;

    vm.write_memory(address, vm.registers.get(sr));
}

/// The contents of the register specified by SR are stored in the memory location
/// whose address is computed by sign-extending bits [5:0] to 16 bits
/// and adding this value to the contents of the register specified by bits [8:6].
///
///  15           12│11        9│8         6│                      0
/// ┌───────────────┼───────────┼───────────┼───────────────────────┐
/// │      0111     │     SR    │   BaseR   │        PCOffset6      │
/// └───────────────┴───────────┴───────────┴───────────────────────┘
pub fn str(instruction: u16, vm: &mut VM) {
    // Get the register encoded in the instruction (see `add` fn for more in-depth details)
    let dr = (instruction >> 9) & 0x7;

    // Grab the base register
    let base_reg = (instruction >> 6) & 0x7;

    // Grab the offset and sign extend it
    let offset = sign_extend(instruction & 0x3F, 6);

    // Get the value in the base_register and sum it to the offset encoded in the instruction
    // Note that we're doing some conversions here to prevent overflow.
    let val: u32 = vm.registers.get(base_reg) as u32 + offset as u32;
    let val: u16 = val as u16;
    vm.write_memory(val as usize, vm.registers.get(dr));
}

/// `trap` fn allows interacting with I/O devices
/// First R7 is loaded with the incremented PC.
// (This enables a return to the instruction physically following the TRAP instruction in the original program
/// after the service routine has completed execution.)
/// Then the PC is loaded with the starting address of the system call specified by trap vector8.
/// The starting address is contained in the memory location whose address is obtained by zero-extending trap vector8 to 16 bits.
pub fn trap(instruction: u16, vm: &mut VM) {
    match instruction & 0xFF {
        0x20 => {
            // Get character
            let mut buffer = [0; 1];
            std::io::stdin().read_exact(&mut buffer).unwrap_or(());
            vm.registers.r0 = buffer[0] as u16;
        }
        0x21 => {
            // Write out character
            let c = vm.registers.r0 as u8;
            print!("{}", c as char);
            // println!("[*] OUT");
        }
        0x22 => {
            // Puts
            let mut index = vm.registers.r0;
            let mut c = vm.read_memory(index);
            while c != 0x0000 {
                print!("{}", (c as u8) as char);
                index += 1;
                c = vm.read_memory(index);
            }
            io::stdout().flush().expect("failed to flush");
        }
        0x23 => {
            // In, Print a prompt on the screen and read a single character from the keyboard. The character is echoed onto the console monitor, and its ASCII code is copied into R0.The high eight bits of R0 are cleared.
            print!("Enter a  character : ");
            io::stdout().flush().expect("failed to flush");
            let char = std::io::stdin()
                .bytes()
                .next()
                .and_then(|result| result.ok())
                .map(|byte| byte as u16)
                .unwrap();
            vm.registers.update(0, char);
        }
        0x24 => {
            // Putsp
            let mut index = vm.registers.r0;
            let mut c = vm.read_memory(index);
            while c != 0x0000 {
                let c1 = ((c & 0xFF) as u8) as char;
                print!("{}", c1);
                let c2 = ((c >> 8) as u8) as char;
                if c2 != '\0' {
                    print!("{}", c2);
                }
                index += 1;
                c = vm.read_memory(index);
            }
            io::stdout().flush().expect("failed to flush");
        }
        0x25 => {
            println!("\n===\nHALT detected");
            io::stdout().flush().expect("failed to flush");
            process::exit(0);
        }
        _ => {
            process::exit(1);
        }
    }
}

pub fn sign_extend(mut x: u16, bit_count: u8) -> u16 {
    // bit_count is the original number of bits
    // that this binary value has. We want to take that
    // and transform it into a 16 bits value

    // This if clause is testing the sign of the value.
    // We're moving `x` to the right up until
    // the sign bit (`bit_count - 1`).
    // Then check if it's different than zero,
    // if it is, it's signed as 1 (negative)
    // Meaning we have to pad with ones instead of zeroes
    if (x >> (bit_count - 1)) & 1 != 0 {
        x |= 0xFFFF << bit_count;
    }
    // If it's positive, return as is, it will be padded
    // with zeroes.
    x
}
