const std = @import("std");

const Types = @import("types.zig");

const File = Types.File;

const Rank = Types.Rank;

const Square = Types.square;

pub const Bitboard = packed struct {
    bb: u64,

    pub fn set_bit(self: *Bitboard, square: Square) void {
        //
        self.bb = (self.bb | (@as(u64, 1) << @intFromEnum(square)));
    }

    pub fn default() Bitboard {
        return .{
            .bb = @as(u64, 0),
        };
    }

    pub fn get_bit(self: Bitboard, square: Square) bool {
        const bb = (self.bb & (@as(u64, 1) << @intFromEnum(square)));
        if (bb == 0) return false else return true;
    }

    pub fn print_board(self: Bitboard) void {
        const FILE_NB = @intFromEnum(File.FILE_NB);

        const RANK_NB = @intFromEnum(Rank.RANK_NB);

        for (0..RANK_NB) |rank| {
            for (0..FILE_NB) |file| {
                const square: Square = @enumFromInt(rank * 8 + file);

                // std.debug.print("ENUM: {s} SQUARE_VAL{d} GET_BIT{d} \n", .{ @tagName(square), (63 - (rank * 8 + file)), @intFromBool(get_bit(self, square)) });
                if (file == 0) {
                    std.debug.print("{d} | ", .{8 - rank});
                }

                std.debug.print("{d} ", .{@intFromBool(get_bit(self, square))});
            }

            std.debug.print("\n", .{});
        }

        std.debug.print("--------------------\n", .{});
        std.debug.print("    a b c d e f g h \n", .{});
    }
};
