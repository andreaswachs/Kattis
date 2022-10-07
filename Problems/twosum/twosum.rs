use std::io::{self, stdin};

fn main() {
    let mut buffer = String::new();

    stdin().read_line(&mut buffer).unwrap();

    let numbers = 
        buffer.split_whitespace()
              .map(|c| c.parse::<i32>().unwrap())
              .collect::<Vec<i32>>();

    assert_eq!(2, numbers.len());

    println!("{}", numbers[0] + numbers[1]);
}
