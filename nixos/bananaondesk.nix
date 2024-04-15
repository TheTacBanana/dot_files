{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./wm.nix
        ./git.nix
        ./languages.nix
    ];

    networking.hostName = "bananaondesk";

    system.stateVersion = "23.11";
}