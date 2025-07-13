const std = @import("std");

extern fn foo_strict(x: f64) f64;
extern fn foo_opt(x: f64) f64;

pub fn main() void {
    const x: f64 = 0.001;
    std.debug.print("optimized result: {}\n", .{foo_opt(x)});
    std.debug.print("strict result: {}\n", .{foo_strict(x)});
}


