
use std::io::{self, BufRead, BufWriter, Write};

fn main() {
    let stdin = io::stdin();
    let mut stdin_locked = stdin.lock();

    let mut out_stream = BufWriter::new(io::stdout());

    let mut _discard = String::new();

    stdin_locked.read_line(&mut _discard).expect("should read and discard the number of lines");


    let mut is_odd = true;
    for line in stdin_locked.lines() {
        if is_odd {
            out_stream.write(format!("{}\n", line.unwrap()).as_bytes()).unwrap();
        }

        is_odd = !is_odd;
    }

    out_stream.flush().unwrap();
}
