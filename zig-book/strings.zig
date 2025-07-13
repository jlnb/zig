const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello world!", .{});

    // Try to print out string with some rather weird characters
    try stdout.print("\nDies kostet 3 € für sie!\n", .{});
}
