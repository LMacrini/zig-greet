const std = @import("std");
const testing = std.testing;

pub fn greet(writer: std.io.AnyWriter, name: []const u8) !void {
    try writer.print("Hello {s}\n", .{name});
}

test "greet" {
    const allocator = testing.allocator;
    var list = std.ArrayList(u8).init(allocator);
    defer list.deinit();

    try greet(list.writer().any(), "Bob");

    try testing.expectEqualSlices(u8, list.items, "Hello Bob\n");
}
