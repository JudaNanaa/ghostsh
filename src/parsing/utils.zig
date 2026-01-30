const std = @import("std");
const token = @import("../parsing/token.zig");

const Token = token.Token;
const debugPrint = token.debugPrint;

pub fn is_space(char: u8) bool {
	return (char >= 9 and char <= 13);
}

pub fn is_operator(char: u8) bool {
	return (char == '|' or char == '<' or char == '>' or char == '&');
}

pub fn printToken(tokens: []token.Token) void {
    for (tokens) |tok| {
        debugPrint(tok);
    }
}
