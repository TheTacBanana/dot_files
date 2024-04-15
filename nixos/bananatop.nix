{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./wm.nix
        ./git.nix
        ./languages.nix
    ];

    networking.hostName = "bananatop";

    system.stateVersion = "23.11";
}
