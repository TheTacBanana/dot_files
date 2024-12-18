{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        python3
        rustup
        gcc
        maven
        zig_0_12
    ];
}
