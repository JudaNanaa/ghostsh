const std = @import("std");

pub const c = @cImport({
    @cInclude("readline/readline.h");
    @cInclude("readline/readline.h");
});

pub fn readline(prompt: []const u8) ?[]const u8 {
    const allocator = std.heap.page_allocator;

    const cstr = allocator.dupeZ(u8, prompt) catch return null;
    defer allocator.free(cstr);

    const line = c.readline(cstr.ptr);
    if (line == null) return null;

    var len: usize = 0;
    while (line[len] != 0) : (len += 1) {}

    return line[0..len];
}

pub fn free(line: []const u8) void {
    std.c.free(@constCast(line.ptr));
}
