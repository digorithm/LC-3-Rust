const NUM_REGISTERS: usize = 10;
const PC_START: u16 = 0x3000;

// LC-3 has 10 registers -- 8 general purpose registers,
// 1 program counter, and one condition flag.
// The program counter stores an uint that is the memory
// address of the next instruction to be executed.
pub struct Registers {
    pub r0: u16,
    pub r1: u16,
    pub r2: u16,
    pub r3: u16,
    pub r4: u16,
    pub r5: u16,
    pub r6: u16,
    pub r7: u16,
    pub pc: u16,
    pub cond: u16,
}

impl Registers {
    pub fn new() -> Registers {
        Registers {
            r0: 0,        // general purpose register
            r1: 0,        // general purpose register
            r2: 0,        // general purpose register
            r3: 0,        // general purpose register
            r4: 0,        // general purpose register
            r5: 0,        // general purpose register
            r6: 0,        // general purpose register
            r7: 0,        // general purpose register
            pc: PC_START, // program counter
            cond: 0,      // condition flag
        }
    }

    pub fn update(&mut self, index: u16, value: u16) {
        match index {
            0 => self.r0 = value,
            1 => self.r1 = value,
            2 => self.r2 = value,
            3 => self.r3 = value,
            4 => self.r4 = value,
            5 => self.r5 = value,
            6 => self.r6 = value,
            7 => self.r7 = value,
            8 => self.pc = value,
            9 => self.cond = value,
            _ => panic!("Index out of bound"),
        }
    }

    pub fn get(&self, index: u16) -> u16 {
        match index {
            0 => self.r0,
            1 => self.r1,
            2 => self.r2,
            3 => self.r3,
            4 => self.r4,
            5 => self.r5,
            6 => self.r6,
            7 => self.r7,
            8 => self.pc,
            9 => self.cond,
            _ => panic!("Index out of bound. "),
        }
    }

    // Update the condition register based on the value that's inside the register `r`.
    pub fn update_r_cond_register(&mut self, r: u16) {
        if self.get(r) == 0 {
            self.update(9, ConditionFlag::ZRO as u16);
        } else if (self.get(r) >> 15) != 0 {
            // a 1 in the left-most bit indicates negative
            self.update(9, ConditionFlag::NEG as u16);
        } else {
            self.update(9, ConditionFlag::POS as u16);
        }
    }
}

// The RCOND register stores condition flags that represents information about
// the most recent computation. It's used for checking logical conditions.
// The LC-3 uses only 3 condition flags which indicate the sign of the previous calculation.
enum ConditionFlag {
    // The `<<` operator is a left bit shift operator.
    // It's simpler than it looks: `n << k` means we're moving (or shifting)
    // the bits in the binary representation of the number `n` by `k`.
    // for instance, 1 in binary representation is 0000000000000001
    // 1 << 2 means we're shifting the bits twice to the left, so that
    // `1` at the end will effectively move to left, twice. It ends up being
    // 0000000000000100, which in decimal representation is 4.
    // Thus, 1 << 2 == 4.

    // So why are we storing 1, 2, 4 here? Glad you asked.
    // In binary, with 3 bits only:
    // 1 == 001
    // 2 == 010
    // 4 == 100
    // So we're playing with the possible conditional flags settings!
    // Because the condition instruction will be `nzp` (neg, zero, pos)
    // and only one can be set at a time, it will either be
    // 001 (positive set `nz1`)
    // 010 (zero set, `n1p`)
    // 100 (negative set, `1zp`)
    // And these three binary values are 1, 2, and 4 in decimal base!
    POS = 1 << 0, // Positive
    ZRO = 1 << 1, // Zero
    NEG = 1 << 2, // Negative
}
