{ pkgs, ... }:
{
    programs.hyprland.enable = true;
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.xterm.enable = false;
        displayManager.defaultSession = "hyprland";
    };
    security.pam.services.gdm.enableGnomeKeyring = true;

    security.pam.services.swaylock = {};

    environment.systemPackages = with pkgs; [
        brightnessctl
        fuzzel
        hyprpaper
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-gtk
        swaylock
        swayidle
        sway-audio-idle-inhibit
    ];
}
