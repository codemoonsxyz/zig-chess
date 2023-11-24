const std = @import("std");

const expect = @import("std").testing.expect;

const Bitboard = @import("bitboard.zig").Bitboard;

const Square = @import("types.zig").square;

const Color = @import("types.zig").Color;

pub const not_a_file: u64 = 18374403900871474942;

// not H file constant
pub const not_h_file: u64 = 9187201950435737471;

// not HG file constant
pub const not_hg_file: u64 = 4557430888798830399;

// not AB file constant
pub const not_ab_file: u64 = 18229723555195321596;

pub fn pawn_attack_mask(side: Color, square: Square) Bitboard {
    var bitboard = Bitboard.default();

    bitboard.set_bit(square);

    var attack_board: u64 = 0;

    switch (side) {
        .White => {

            // Makes sure move does not go off board

            // off left

            attack_board |= ((bitboard.bb >> 7) & not_a_file);

            //off right

            attack_board |= ((bitboard.bb >> 9) & not_h_file);

            return .{ .bb = attack_board };
        },
        .Black => {
            attack_board |= ((bitboard.bb << 7) & not_h_file);

            //off right
            attack_board |= ((bitboard.bb << 9) & not_a_file);

            return .{ .bb = attack_board };
        },
    }
}

pub fn knight_attack_mask(square: Square) Bitboard {
    var bitboard = Bitboard.default();

    bitboard.set_bit(square);

    var attack_board: u64 = 0;

    // generate knight attack_board
    attack_board |= (bitboard.bb >> 17) & not_h_file;
    attack_board |= (bitboard.bb >> 15) & not_a_file;
    attack_board |= (bitboard.bb >> 10) & not_hg_file;
    attack_board |= (bitboard.bb >> 6) & not_ab_file;
    attack_board |= (bitboard.bb << 17) & not_a_file;
    attack_board |= (bitboard.bb << 15) & not_h_file;
    attack_board |= (bitboard.bb << 10) & not_ab_file;
    attack_board |= (bitboard.bb << 6) & not_hg_file;

    // return attack map
    return .{ .bb = attack_board };
}

pub fn king_attack_mask(square: Square) Bitboard {
    var bitboard = Bitboard.default();

    bitboard.set_bit(square);

    var attack_board: u64 = 0;
    // generate king attack_board
    attack_board |= (bitboard.bb >> 8);
    attack_board |= (bitboard.bb >> 9) & not_h_file;
    attack_board |= (bitboard.bb >> 7) & not_a_file;
    attack_board |= (bitboard.bb >> 1) & not_h_file;
    attack_board |= (bitboard.bb << 8);
    attack_board |= (bitboard.bb << 9) & not_a_file;
    attack_board |= (bitboard.bb << 7) & not_h_file;
    attack_board |= (bitboard.bb << 1) & not_a_file;

    // return attack map

    return .{ .bb = attack_board };
}

pub fn bishop_attack_mask(square: Square) Bitboard {

    // masks relevent bits.

    // Does not touch the edge

    var r: i8 = undefined;
    var f: i8 = undefined;

    var attack_board: u64 = 0;

    const index = @as(i8, @intCast(square.index()));
    const rank: i8 = @divTrunc(index, 8);
    const file: i8 = @rem(index, 8);

    r = rank + 1;
    f = file + 1;
    while (r <= 6 and f <= 6) : ({
        r += 1;
        f += 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + f)));
    }

    r = rank - 1;
    f = file + 1;

    while (r >= 1 and f <= 6) : ({
        r -= 1;
        f += 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + f)));
    }

    r = rank + 1;
    f = file - 1;
    while (r <= 6 and f >= 1) : ({
        r += 1;
        f -= 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + f)));
    }

    r = rank - 1;
    f = file - 1;
    while (r >= 1 and f >= 1) : ({
        r -= 1;
        f -= 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + f)));
    }

    return .{ .bb = attack_board };
}

pub fn rook_attack_mask(square: Square) Bitboard {
    var r: i8 = undefined;
    var f: i8 = undefined;

    var attack_board: u64 = 0;

    const index = @as(i8, @intCast(square.index()));
    const rank: i8 = @divTrunc(index, 8);
    const file: i8 = @rem(index, 8);

    r = rank + 1;

    while (r <= 6) : ({
        r += 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + file)));
    }

    r = rank - 1;

    while (r >= 1) : ({
        r -= 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(r * 8 + file)));
    }

    f = file + 1;
    while (f <= 6) : ({
        f += 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(rank * 8 + f)));
    }

    f = file - 1;
    while (f >= 1) : ({
        f -= 1;
    }) {
        attack_board |= (@as(u64, 1) << @as(u6, @intCast(rank * 8 + f)));
    }

    return .{ .bb = attack_board };
}

test "Pawn Masks" {

    // White
    const white_mask = pawn_attack_mask(Color.White, Square.C4);

    try expect(white_mask.get_bit(Square.D5));

    try expect(white_mask.get_bit(Square.B5));

    // Black

    const black_mask = pawn_attack_mask(Color.Black, Square.D5);

    try expect(black_mask.get_bit(Square.E4));

    try expect(black_mask.get_bit(Square.C4));
}
