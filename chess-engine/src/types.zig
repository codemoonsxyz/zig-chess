pub const square = enum(u6) {

    // zig fmt: off
    
    A8, B8, C8, D8, E8, F8, G8, H8,
    A7, B7, C7, D7, E7, F7, G7, H7,
    A6, B6, C6, D6, E6, F6, G6, H6,
    A5, B5, C5, D5, E5, F5, G5, H5,
    A4, B4, C4, D4, E4, F4, G4, H4,
    A3, B3, C3, D3, E3, F3, G3, H3,
    A2, B2, C2, D2, E2, F2, G2, H2,
    A1, B1, C1, D1, E1, F1, G1, H1,



   // zig fmt: on

    pub inline fn index(self: square) u6 {
        return @intFromEnum(self);
    }
};

pub const Direction = enum(i32) {

    // zig fmt: off
    NORTH = 8,
    EAST = 1,
    SOUTH = -8,
    WEST = 1,

    NORTH_EAST = 9,
    SOUTH_EAST = -7,
    SOUTH_WEST = -9,
    NORTH_WEST = 7,


    North_North = 16,
    South_South = -16,
    // zig fmt: on
};

pub const File = enum(u8) { FILE_A, FILE_B, FILE_C, FILE_D, FILE_E, FILE_F, FILE_G, FILE_H, FILE_NB };

pub const Rank = enum(u8) { RANK_1, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8, RANK_NB };

pub const Color = enum(u1) {
    White,
    Black,

    pub inline fn index(self: Color) u1 {
        return @intFromEnum(self);
    }
};
