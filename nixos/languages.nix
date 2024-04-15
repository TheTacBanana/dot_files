{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        python3
        swiProlog
        rustup
        gcc
    ];
}