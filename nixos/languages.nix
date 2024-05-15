{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        python3
        swiProlog
        rustup
        gcc
        openjdk19
        stack
        dotnet-sdk_8
    ];
}
