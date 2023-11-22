const std = @import("std");

const Bitboard = @import("bitboard.zig").Bitboard;

const Square = @import("types.zig").square;

const Types = @import("types.zig");

const tables = @import("tables.zig");

pub fn main() !void {
    tables.init();
    //const bb = Bitboard{ .bb = tables.PawnAttacks[@intFromEnum(Types.Color.White)][@intFromEnum(Types.square.D5)] };
    var bb = Bitboard.default();

    bb.set_bit(Square.A5);
    bb.print_board();
}
