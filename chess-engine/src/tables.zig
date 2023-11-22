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
        PawnAttacks[Color.White.index()][i] = Attacks.pawn_mask(Color.White, sq);

        PawnAttacks[Color.Black.index()][i] = Attacks.pawn_mask(Color.Black, sq);

        KnightAttacks[i] = Attacks.knight_mask(sq);

        KingAttacks[i] = Attacks.king_mask(sq);
    }
}
