const Bitboard = @import("bitboard.zig").Bitboard;
const Square = @import("types.zig").square;
const Attacks = @import("attacks.zig");
const Color = @import("types.zig").Color;
const std = @import("std");

pub var PawnAttacks: [2][64]Bitboard = std.mem.zeroes([2][64]Bitboard);
pub var WhitePawnAttacks: [64]Bitboard = undefined;
pub var BlackPawnAttacks: [64]Bitboard = undefined;
pub var KnightAttacks: [64]Bitboard = undefined;

pub var KingAttacks: [64]Bitboard = undefined;

pub fn init() void {
    for (0..63) |i| {
        const sq: Square = @enumFromInt(i);

        WhitePawnAttacks[i] = Attacks.pawn_mask(Color.White, sq);

        BlackPawnAttacks[i] = Attacks.pawn_mask(Color.Black, sq);
    }
    std.mem.copy(Bitboard, PawnAttacks[0][0..64], WhitePawnAttacks[0..64]);
    std.mem.copy(Bitboard, PawnAttacks[1][0..64], BlackPawnAttacks[0..64]);
}
