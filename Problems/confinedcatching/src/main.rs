use std::io::{self, Write};

fn read_player_pos() -> (i32, i32, i32, i32) {
    let mut buffer = String::new();
    io::stdin().read_line(&mut buffer).unwrap();

    let pcoords: Vec<i32> = buffer.split_whitespace().map(|c| c.parse::<i32>().unwrap()).collect();

    (pcoords[0], pcoords[1], pcoords[2], pcoords[3])
}


fn read_enemy_pos() -> (i32, i32) {
    let mut buffer = String::new();
    io::stdin().read_line(&mut buffer).unwrap();
    let ocoords: Vec<i32> = buffer.split_whitespace().map(|c| c.parse::<i32>().unwrap()).collect();

    (ocoords[0], ocoords[1])
}


fn write_player_pos(p1x: &i32, p1y: &i32, p2x: &i32, p2y: &i32) {
    println!("{} {} {} {}", p1x, p1y, p2x, p2y);
    io::stdout().flush().unwrap();
}

fn main() {
    let mut buffer = String::new();

    // Read n
    io::stdin().read_line(&mut buffer).unwrap();

    // Read board size and increment to adjust for 1-indexed game
    let n: i32 = buffer.trim().parse().unwrap();

    // Read the player and enemy position initially
    let (mut p1x, mut p1y, mut p2x, mut p2y) = read_player_pos();
    let (mut ex, mut ey) = (0, 0);

    // Lazy way of making sure that we don't attempt to move diagonally
    let (mut mp1x, mut mp2x) = (false, false);

    // Making sure the looping work from the first iteration
    let mut is_turn_1 = true;

    // Move the player pieces to n * n
    while (4 * n) != p1x + p1y + p2x + p2y {
        if !is_turn_1 {
            p1x = if p1x != n { mp1x = true; p1x + 1 } else { p1x };
            p1y = if p1y != n && !mp1x { p1y + 1 } else { p1y };
            p2x = if p2x != n { mp2x = true; p2x + 1 } else { p2x };
            p2y = if p2y != n && !mp2x { p2y + 1 } else { p2y };

            mp1x = false; mp2x = false;
            write_player_pos(&p1x, &p1y, &p2x, &p2y);
        }

        (ex, ey) = read_enemy_pos();

        // Checking if we "accidentally" win while moving the pieces to the corner
        if ex == 0 && ey == 0 {
            std::process::exit(0);
        }
        is_turn_1 = false;
    }

    // The player pieces are now at n * n, lets move them over to catch the enemy 

    loop {
        // First priority for p1 is to align its x value with enemy
        if p1x != ex {
            p1x = p1x + if p1x < ex { 1 } else { -1 };
        } else {
            p1y = p1y + if p1y < ey { 1 } else { -1 };
        }

        // First priority for p2 is to align its y value with enemy
        if p2y != ey {
            p2y = p2y + if p2y < ey { 1 } else { -1 };
        } else {
            p2x = p2x + if p2x < ex { 1 } else { -1 };
        }

        write_player_pos(&p1x, &p1y, &p2x, &p2y);

        (ex, ey) = read_enemy_pos();

        // Check to see that the game is over
        if ex == 0 && ey == 0 {
            break;
        }
    }
}
