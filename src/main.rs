extern crate termios;

pub mod hardware;
use hardware::vm::VM;

use termios::*;

use byteorder::{BigEndian, ReadBytesExt};

use std::{fs::File, io::BufReader};
use structopt::StructOpt;

#[derive(StructOpt)]
struct Cli {
    /// The path to the file to read
    #[structopt(parse(from_os_str))]
    path: std::path::PathBuf,

    #[structopt(long)]
    print_asm: bool, // Future feature
}

fn main() {
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
                vm.write_memory(address, instruction);
                address += 1;
            }
            Err(e) => {
                if e.kind() == std::io::ErrorKind::UnexpectedEof {
                    println!("OK, EOF reached");
                } else {
                    println!("failed: {}", e);
                }
                break;
            }
        }
    }

    println!("Loaded program in memory");
    hardware::execute_program(&mut vm);
}
