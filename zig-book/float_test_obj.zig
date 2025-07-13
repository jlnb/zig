const std = @import("std");
const number = @as(f64, 1 << 40);

//pub fn main() void {
//    std.debug.print("number: {}", .{number});
//}

export fn foo_strict(x: f64) f64 {
    return x + number - number;
}

export fn foo_opt(x: f64) f64 {
    @setFloatMode(.optimized);
    return x + number - number;
}
