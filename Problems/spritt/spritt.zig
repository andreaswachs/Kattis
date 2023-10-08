const std = @import("std");

pub fn main() !void {
    const in = std.io.getStdIn();
    const out = std.io.getStdOut();

    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    var buf: [512]u8 = undefined;

    var line: []const u8 = try in.reader().readUntilDelimiter(&buf, '\n');

    var it = std.mem.tokenizeAny(u8, line, " ");
    _ = it.next().?;
    var bottles = try std.fmt.parseInt(i64, it.next().?, 10);

    const numbers = try in.reader().readAllAlloc(arena.allocator(), 65_000_000);
    var nit = std.mem.tokenizeScalar(u8, numbers, '\n');
    while (nit.next()) |n| {
        const blt = try std.fmt.parseInt(i64, n, 10);
        bottles -= blt;

        if (bottles < 0) {
            _ = try out.write("Neibb\n");
            std.os.exit(0);
        }
    }

    _ = try out.write("Jebb\n");
}
