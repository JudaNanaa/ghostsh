const std = @import("std");
const parser = @import("../parsing/parsing.zig");
const rl = @import("../readline.zig");

const Command = parser.Command;

pub fn receivePrompt(allocator: std.mem.Allocator) !void {
    while (true) {
        const command_line = rl.readline(allocator, "gsh> ") orelse {
            std.debug.print("error", .{});
            return;
        };
        try parser.parse(allocator, command_line);
        std.debug.print("{s}\n", .{command_line});
        rl.free(command_line);
    }
}
