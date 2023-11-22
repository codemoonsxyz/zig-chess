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

pub fn pawn_mask(side: Color, square: Square) Bitboard {
    var bitboard = Bitboard.default();

    bitboard.set_bit(square);

    bitboard.print_board();

    var attack_board = Bitboard.default();

    switch (side) {
        .White => {

            // Makes sure move does not go off board

            // off left

            attack_board.bb |= ((bitboard.bb >> 7) & not_a_file);

            //off right

            attack_board.bb |= ((bitboard.bb >> 9) & not_h_file);

            return attack_board;
        },
        .Black => {
            attack_board.bb |= ((bitboard.bb << 7) & not_h_file);

            //off right
            attack_board.bb |= ((bitboard.bb << 9) & not_a_file);

            return attack_board;
        },
    }
}

test "Pawn Masks" {

    // White
    const white_mask = pawn_mask(Color.White, Square.C4);

    try expect(white_mask.get_bit(Square.D5));

    try expect(white_mask.get_bit(Square.B5));

    // Black

    const black_mask = pawn_mask(Color.Black, Square.D5);

    try expect(black_mask.get_bit(Square.E4));

    try expect(black_mask.get_bit(Square.C4));
}
