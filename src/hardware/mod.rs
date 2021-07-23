//pub mod instruction;
//pub mod memory;
pub mod instruction;
pub mod register;
pub mod vm;

use vm::VM;

pub const MEMORY_SIZE: usize = std::u16::MAX as usize;

pub fn execute_program(vm: &mut VM) {
    //initialize Registers
    while vm.registers.pc < MEMORY_SIZE as u16 {
        //read instruction
        let instruction = vm.read_memory(vm.registers.pc);

        //increment program counter
        vm.registers.pc += 1;

        //extract op_code and execute operation...
        instruction::execute_instruction(instruction, vm)
    }
}
