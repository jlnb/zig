const std = @import("std");

pub fn main() void {
    const constant: i32 = 5;
    var variable: i32 = 4200;
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' };
    const length: i8 = b.len;

    variable = constant + variable;

    std.debug.print("This is a {s}. The number is {}.\n", .{ "test", variable });
    std.debug.print("The length of array b is {}\n", .{length});
}
