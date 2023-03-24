use std::io::stdin;

fn is_palindrome(number: &i64) -> bool {
    // Thanks to
    // https://www.programiz.com/c-programming/examples/palindrome-number
    let mut buffer = number.clone();
    let mut reversed = 0;
    let mut rem = 0;

    while buffer > 0 {
        rem = buffer % 10;
        reversed = reversed * 10 + rem;
        buffer /= 10;
    }

    *number == reversed
}


fn main() {
    let mut buffer = String::new();
    stdin().read_line(&mut buffer).unwrap();

    let sum = buffer.trim().parse::<i64>().unwrap();

    let mut palindromes: Vec<i64> = Vec::new();

    for n in 0..sum {
        if is_palindrome(&n) {
            palindromes.push(n);
        }
    }

    println!("There were {} palindromes found!", palindromes.len());
}
