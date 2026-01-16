const std = @import("std");

pub const Command = struct {
    heredoc: bool,
    open_quotes: bool,
    name: []u8,
    args: [][]u8,

    pub fn deinit(self: Command, allocator: std.mem.Allocator) void {
        allocator.free(self.args);
    }
};
