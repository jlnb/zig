const std = @import("std");
const expect = std.testing.expect;

test "while" {
    var i: u8 = 2;
    while (i < 100) {
        i *= 2;
    }
    try expect(i == 128);
}

test "while with continue expression" {
    var sum: u8 = 0;
    var i: u8 = 1;
    while (i <= 10) : (i += 1) {
        sum += i;
        std.debug.print("i = {}; sum = {}\n", .{ i, sum });
    }
    try expect(sum == 55);
}

test "while with continue" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) continue;
        sum += i;
        std.debug.print("i = {}; sum = {}\n", .{ i, sum });
    }
    try expect(sum == 4);
}

test "while with break" {
    var sum: u8 = 0;
    var i: u8 = 0;
    while (i <= 3) : (i += 1) {
        if (i == 2) break;
        sum += i;
    }
    try expect(sum == 1);
}

test "for loops" {
    const string = [_]u8{ 'L', 'i', 's', 'a' };
    for (string, 0..) |character, index| {
        std.debug.print("Index: {}; Character: {}\n", .{ index, character });
    }
}
