const std = @import("std");
const expect = std.testing.expect;

const farbe = enum(u32){
    red = 0xff0000,
    green = 0x00ff00,
    blue = 0x0000ff,
};

pub fn main() void {
    const color: u32 = 0x0000ff;
    std.debug.print("This is the color {x:0>6}\n", .{color});
    std.debug.print("Red value: {x:0>6}; green value: {x:0>6}; blue value: {x:0>6};\n\n", 
        .{@intFromEnum(farbe.red), @intFromEnum(farbe.green), @intFromEnum(farbe.blue)});

    const r1: i32 = foo();
    const r2: i32 = foo();
    std.debug.print("r1: {}; r2: {}; S2.x: {}", .{r1, r2, S2.x});
}

var y: i32 = add(10, x);
const x: i32 = 36;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "namespace" {
    try expect(x == 36);
    try expect(y == 46);
}

fn foo() i32 {
    const S = struct {
        var x: i32 = 1234;
    };
    S.x += 1;
    S2.x += 1;
    return S.x;
}

const S2 = struct {
    var x: i32 = 5;
};

test "static local variable" {
    try expect(foo() == 1235);
    try expect(foo() == 1236);
}
