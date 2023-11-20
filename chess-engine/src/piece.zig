const piece_type = enum { Rook, Knight, Pawn, Queen, Bishop, King };
const color = enum { White, Black };

pub const piece = enum(u8) {
    WHITE_PAWN,
    WHITE_KNIGHT,
    WHITE_BISHOP,
    WHITE_ROOK,
    WHITE_QUEEN,
    WHITE_KING,
    BLACK_PAWN = 8,
    BLACK_KNIGHT,
    BLACK_BISHOP,
    BLACK_ROOK,
    BLACK_QUEEN,
    BLACK_KING,
    NO_PIECE,
};
