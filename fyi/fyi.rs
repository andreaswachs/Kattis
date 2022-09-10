use std::io;

fn main() {
    let mut buffer = String::new();
    io::stdin().read_line(&mut buffer).expect("expected to read a line");
    if buffer.starts_with("555") {
        println!("1");
    } else {
        println!("0");
    }
}

