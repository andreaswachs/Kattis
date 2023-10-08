const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn().reader();
    const out = std.io.getStdOut().writer();

    var buf: [81]u8 = undefined;

    const line = try in.readUntilDelimiter(&buf, '\n');
    var vowels: usize = 0;
    for (line) |c| {
        const cc = std.ascii.toLower(c);
        _ = switch (cc) {
            'a', 'e', 'i', 'o', 'u' => {
                vowels += 1;
            },
            else => {},
        };
    }

    try out.print("{d}\n", .{vowels});
}
