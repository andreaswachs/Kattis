const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn().reader();
    const out = std.io.getStdOut().writer();

    var buf: [251]u8 = undefined;
    var name: [251]u8 = undefined;
    var length: usize = 1;
    var line = try in.readUntilDelimiterOrEof(&buf, '\n') orelse undefined;

    if (line.len == 1) {
        try out.print("{s}\n", .{line});
        std.os.exit(0);
    }

    name[0] = line[0];
    for (line) |c| {
        if (c != name[length - 1]) {
            name[length] = c;
            length += 1;
        }
    }

    try out.print("{s}\n", .{name[0..length]});
}
