extern crate termios;

pub mod hardware;
use hardware::vm::VM;

use byteorder::{BigEndian, ReadBytesExt};

use std::{fs::File, io::BufReader};
use structopt::StructOpt;

#[derive(StructOpt)]
struct Cli {
    /// The path to the file to read
    #[structopt(parse(from_os_str))]
    path: Vec<std::path::PathBuf>,
}

fn main() {
    // Actual VM logic code
    let mut vm = VM::new();

    let cli = Cli::from_args();

    for path in cli.path {
        let file = File::open(path.clone()).unwrap();
        let mut reader = BufReader::new(file);
        let mut address = reader.read_u16::<BigEndian>().unwrap();
        while let Ok(value) = reader.read_u16::<BigEndian>() {
            vm.write_memory(address as usize, value);
            address += 1;
        }
    }


    println!("Loaded program in memory");
    hardware::execute_program(&mut vm);
}
