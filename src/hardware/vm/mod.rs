// The LC-3 has 65_536 memory locations, which is the max addressable by u16, 2^16.
const MEMORY_SIZE: usize = u16::MAX as usize;

use super::register::Registers;

use std::io::Read;

pub struct VM {
    pub memory: [u16; MEMORY_SIZE],
    pub registers: Registers,
}

impl VM {
    pub fn new() -> VM {
        VM {
            memory: [0; MEMORY_SIZE],
            registers: Registers::new(),
        }
    }

    pub fn read_memory(&mut self, address: u16) -> u16 {
        if address == MemoryMappedReg::Kbsr as u16 {
            self.handle_keyboard();
        }
        self.memory[address as usize]
    }

    fn handle_keyboard(&mut self) {
        let mut buffer = [0; 1];
        std::io::stdin().read_exact(&mut buffer).unwrap_or_else(|_| {
            eprintln!("Error reading from keyboard");
            eprintln!("PC: {:#06x}", self.registers.pc);
            eprintln!("Instruction: {:#06x}", self.memory[self.registers.pc as usize]);
            std::process::exit(122);
        });
        if buffer[0] != 0 {
            self.write_memory(MemoryMappedReg::Kbsr as usize, 1 << 15);
            self.write_memory(MemoryMappedReg::Kbdr as usize, buffer[0] as u16);
        } else {
            self.write_memory(MemoryMappedReg::Kbsr as usize, 0)
        }
    }

    pub fn write_memory(&mut self, address: usize, value: u16) {
        //println!("PC: {:#06x} Writing {:#06x} to {:#06x}", self.registers.pc, value, address);
        self.memory[address] = value;
    }
}

pub enum MemoryMappedReg {
    // Keyboard status: The KBSR indicates whether a key has been pressed
    Kbsr = 0xFE00,

    // Keyboard data: The KBDR identifies which key was pressed
    Kbdr = 0xFE02,
}
