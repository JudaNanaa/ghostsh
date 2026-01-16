const std = @import("std");
const builtin = @import("builtin");
const rl = @import("prompt/prompt.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{
        .safety = builtin.mode == .Debug,
    }){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
    rl.receivePrompt(allocator);

    // std.debug.print("input => {s}", .{input});
}
