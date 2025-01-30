{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./gpu.nix
        ./hyprland.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
        ./bluetooth.nix
        ./helix.nix
    ];

    networking.hostName = "bananatop";

    system.stateVersion = "24.11";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
