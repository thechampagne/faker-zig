const std = @import("std");
const Faker = @import("../../faker.zig").Faker;

pub fn is(
    comptime T: type,
) bool {
    return comptime std.meta.trait.isZigString(T);
}

pub fn dummy(comptime T: type, comptime locales: anytype, comptime user_impls: anytype, faker: Faker(locales, user_impls)) T {
    // TODO: return same len of request type?
    const str = faker.lorem.word();
    return @ptrCast(@constCast(str));
}
