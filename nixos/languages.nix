{ pkgs, ... }:
{
    nixpkgs.overlays = let
        nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
    in [
        nix-matlab.overlay
        (
        final: prev: {
        }
        )
    ];


    environment.systemPackages = with pkgs; [
        python3
        swiProlog
        rustup
        gcc
        openjdk19
        stack
        dotnet-sdk_8
        maven
        # CS368
        matlab
    ];
}
