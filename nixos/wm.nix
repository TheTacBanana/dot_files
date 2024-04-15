{ pkgs, ... }:
{
    programs.hyprland.enable = true;

    security.pam.services.swaylock = {};

    environment.systemPackages = with pkgs; [
        brightnessctl
        swayidle
        swaylock
    ];
}
