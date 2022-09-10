
use std::collections::HashSet;
use std::io::{self, BufRead};
use std::process::exit;

fn main() {
    let mut conclusions: HashSet<String> = HashSet::new();

    let mut _discard = String::new();
    io::stdin().read_line(&mut _discard).expect("should read number of lines in the problem");

    let mut current_line = 1;

    let stdin = io::stdin();
    let stdin_lock = stdin.lock();

    for line in stdin_lock.lines() {
        let input = line.unwrap();
        if input.starts_with('-') {
            add_assumptions(&input, &mut conclusions);
        } else if has_assumptions(&input, &mut conclusions) {
            add_conclusions(&input, &mut conclusions);
        } else {
            println!("{}", current_line);
            exit(0);
        }

        current_line += 1;

    }

    println!("correct");
}

fn has_assumptions(input: &str, conclusions: &mut HashSet<String>) -> bool {

    let sides = input.split("->").collect::<Vec<&str>>();
    if sides.len() != 2 {
        panic!("Expected sides to be of length 2");
    }

    sides[0].split(' ').all(|a| {
        conclusions.contains(a)
    })
}

fn add_conclusions(input: &str, conclusions: &mut HashSet<String>) {

    let sides = input.trim().split("->").collect::<Vec<&str>>();
    if sides.len() != 2 {
        panic!("Expected sides to be of length 2");
    }

    sides[1].split(' ').for_each(|a| {
        conclusions.insert(String::from(a));
    })
}

fn add_assumptions(input: &str, conclusions: &mut HashSet<String>) {

    let sides = input.trim().split("->").collect::<Vec<&str>>();
    if sides.len() != 2 {
        panic!("Expected sides to be of length 2");
    }

    for conclusion in sides[1].split(' ').collect::<Vec<&str>>() {
        conclusions.insert(String::from(conclusion));
    }
    
}

