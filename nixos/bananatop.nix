{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./hyprland.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
        ./bluetooth.nix
        ./helix.nix
        ./suspend.nix
    ];

    networking.hostName = "bananatop";

    system.stateVersion = "24.11";

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    services.batteryNotifier = {
        enable = true;
        notifyCapacity = 20;
        suspendCapacity = 3;
    };
}
