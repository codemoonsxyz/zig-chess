const BitBoard = @import("bitboard.zig").Bitboard;
const Types = @import("types.zig");

const Square = Types.square;

pub fn set_bit(bb: BitBoard, square: Square) BitBoard {
    return (bb | (@as(u64, 1) << square));
}

pub fn get_bit(bb: BitBoard, square: Square) BitBoard {
    return (bb & (@as(u64, 1) << square));
}
