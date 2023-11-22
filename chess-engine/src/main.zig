const std = @import("std");

const Bitboard = @import("bitboard.zig").Bitboard;

const Square = @import("types.zig").square;

const Types = @import("types.zig");

const tables = @import("tables.zig");

const Attacks = @import("attacks.zig");

pub fn main() !void {
    //tables.init();
    //const bb = Bitboard{ .bb = tables.PawnAttacks[@intFromEnum(Types.Color.White)][@intFromEnum(Types.square.D5)] };

    Attacks.pawn_mask(Types.Color.Black, Square.A1).print_board();

    //   tables.PawnAttacks[1][0].print_board();
}
