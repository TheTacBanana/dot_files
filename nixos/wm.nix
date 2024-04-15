{ pkgs, ... }:
{
    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
        brightnessctl
        swayidle
        swaylock
    ];
}
