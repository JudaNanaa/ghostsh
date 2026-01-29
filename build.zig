const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});

    // const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{ .name = "gsh", .root_module = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = .ReleaseFast,
    }) });

    exe.linkLibC();
    exe.linkSystemLibrary("readline");
    b.installArtifact(exe);

    // STEP
    const run_step = b.step("run", "Run the program");

    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const exe_debug = b.addExecutable(.{ .name = "gsh_debug", .root_module = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = .Debug,
    }) });

    exe_debug.linkLibC();
    exe_debug.linkSystemLibrary("readline");
    exe_debug.root_module.strip = false;
    exe_debug.root_module.omit_frame_pointer = false;

    b.installArtifact(exe_debug);

    const run_step_debug = b.step("debug", "Run the debug executable");
    const run_cmp_debug = b.addRunArtifact(exe_debug);
    run_step_debug.dependOn(&run_cmp_debug.step);
    run_cmp_debug.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmp_debug.addArgs(args);
    }
}
