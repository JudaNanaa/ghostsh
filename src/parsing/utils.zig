const std = @import("std");
const token = @import("../parsing/token.zig");

const Token = token.Token;
const debugPrint = token.debugPrint;

pub fn isSpace(char: u8) bool {
	return (char >= 9 and char <= 13 or char == 32);
}

pub fn printToken(tokens: []token.Token) void {
    for (tokens) |tok| {
        debugPrint(tok);
    }
}
