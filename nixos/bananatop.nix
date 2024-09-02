{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./hyprland.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
        ./bluetooth.nix
        ./steam.nix
    ];

    networking.hostName = "bananatop";

    system.stateVersion = "24.05";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
}
