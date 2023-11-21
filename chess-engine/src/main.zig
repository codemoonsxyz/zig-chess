const std = @import("std");

const Bitboard = @import("bitboard.zig").Bitboard;

const Square = @import("types.zig").square;

pub fn main() !void {
    var bitboard = Bitboard{ .bb = 0 };

    bitboard.set_bit(Square.A8);
    bitboard.set_bit(Square.A7);
    bitboard.set_bit(Square.A6);
    bitboard.print_board();

    std.debug.print("{b}\n", .{bitboard.bb});
}
