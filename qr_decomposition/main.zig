//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const std = @import("std");
const math = std.math;

pub fn main() !void {
    const vec = [_]f64{ 1.0, 2.0, 3.0, 1.0, 1.0 };
    const p: u16 = 2;

    const result: f64 = pNorm(&vec, p);

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("For the vector with the elements \n", .{});
    for (vec) |x| {
        try stdout.print("{}\n", .{x});
    }
    try stdout.print("and the p={}, the p-norm is: {}\n", .{ p, result });

    try bw.flush();
}

// Helper function: Compute p-norm
fn pNorm(vec: []const f64, p: u16) f64 {
    var sum: f64 = 0.0;
    const power: f64 = @floatFromInt(p);
    for (vec) |x| {
        sum += math.pow(f64, x, power);
    }
    const exponent: f64 = 1.0 / power;
    return math.pow(f64, sum, exponent);
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test "fuzz example" {
    const global = struct {
        fn testOne(input: []const u8) anyerror!void {
            // Try passing `--fuzz` to `zig build test` and see if it manages to fail this test case!
            try std.testing.expect(!std.mem.eql(u8, "canyoufindme", input));
        }
    };
    try std.testing.fuzz(global.testOne, .{});
}
