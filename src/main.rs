/*
An example of an assembly program that this VM can understand:

.ORIG x3000                        ; this is the address in memory where the program will be loaded
LEA R0, HELLO_STR                  ; load the address of the HELLO_STR string into R0
PUTs                               ; output the string pointed to by R0 to the console
HALT                               ; halt the program
HELLO_STR .STRINGZ "Hello World!"  ; store this string here in the program
.END                               ; mark the end of the file


The goal is to convert this human-readable assembly code into 16-bit
binary instructions that the VM can understand.

Isn't it amazing that people can write this assembly to do all sorts of
creative and unexpected things even when limited by simple instructions
that the VM support?

What can be better than the other tutorials online:
We can do step-by-step, building a running version each time.

TODO:
1. Understand the last bits that need to be understood
2. Clean up code
3. Find a way to create an MVP, like an initial VM loop, so that it's easier to explain from scratch
4. Write

*/

extern crate termios;

pub mod hardware;
use hardware::instruction::OpCode;
use hardware::register::Registers;
use hardware::vm::VM;

use termios::*;

use byteorder::{BigEndian, ReadBytesExt};

use std::env;
use std::fs;
use std::process;
use std::{
    fs::File,
    io::{self, BufReader, Read},
    str,
};
use structopt::StructOpt;

use hardware::instruction;

#[derive(StructOpt)]
struct Cli {
    /// The path to the file to read
    #[structopt(parse(from_os_str))]
    path: std::path::PathBuf,

    #[structopt(long)]
    print_asm: bool,
}

fn main() {
    // Some tricks to make the VM's terminal be interactive
    let stdin = 0;
    let termios = termios::Termios::from_fd(stdin).unwrap();

    // make a mutable copy of termios
    // that we will modify
    let mut new_termios = termios.clone();
    new_termios.c_iflag &= IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON;
    new_termios.c_lflag &= !(ICANON | ECHO); // no echo and canonical mode

    tcsetattr(stdin, TCSANOW, &mut new_termios).unwrap();

    // Actual VM logic code
    let mut vm = VM::new();

    let cli = Cli::from_args();

    let f = File::open(cli.path).expect("couldn't open file");
    let mut f = BufReader::new(f);

    // Note how we're using `read_u16` _and_ BigEndian to read the binary file.
    let base_address = f.read_u16::<BigEndian>().expect("error");

    // Here we're loading the program in memory
    let mut address = base_address as usize;
    loop {
        match f.read_u16::<BigEndian>() {
            Ok(instruction) => {
                if cli.print_asm {
                    disassemble(address, instruction);
                    continue;
                }

                vm.write_memory(address, instruction);
                address += 1;
            }
            Err(e) => {
                if e.kind() == std::io::ErrorKind::UnexpectedEof {
                    println!("OK")
                } else {
                    println!("failed: {}", e);
                }
                break;
            }
        }
    }

    if !cli.print_asm {
        hardware::execute_program(&mut vm);
    }

    // reset the stdin to
    // original termios data
    tcsetattr(stdin, TCSANOW, &termios).unwrap();
}

fn disassemble(address: usize, instruction: u16) {
    if instruction != 0 {
        println!("instruction: {:?} ({:#018b})\n", instruction, instruction);
        let op = instruction::get_op_code(&instruction).unwrap();

        match op {
            OpCode::LEA => {
                let dr = (instruction >> 9) & 0x7;

                let pc_offset = instruction::sign_extend(instruction & 0x1ff, 9);
                println!("op: {:?}", op);
                println!("pc_offset: {:?}", pc_offset);
                println!("dr: {:?}\n", dr);

                println!(
                    "{:?} R{:?}, {:?}",
                    op,
                    dr,
                    address as u32 + pc_offset as u32
                );
            }
            _ => return,
        }
        return;
    }
}
