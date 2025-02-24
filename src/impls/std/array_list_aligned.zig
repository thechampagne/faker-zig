const std = @import("std");
const Faker = @import("../../faker.zig").Faker;

pub fn is(
    comptime T: type,
) bool {
    return comptime std.mem.startsWith(u8, @typeName(T), "array_list");
}

pub fn dummy(comptime T: type, comptime locales: anytype, comptime user_impls: anytype, faker: Faker(locales, user_impls)) T {
    const len = faker.random.uintLessThan(usize, 10);
    const elemType = std.meta.Child(T.Slice);
    var v = std.ArrayList(elemType).init(faker.allocator);
    for (0..len) |_| {
        v.append(faker.dummy(elemType)) catch |e| std.debug.panic("panic with error: {any}", .{e});
    }
    return v;
}
