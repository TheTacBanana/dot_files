{ pkgs, ... }:
{
    programs.hyprland.enable = true;
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        displayManager.gdm.wayland = true;
        desktopManager.xterm.enable = false;
    };
    services.displayManager.defaultSession = "hyprland";

    security.pam.services.swaylock = {};

    environment.systemPackages = with pkgs; [
        brightnessctl
        fuzzel
        hyprpaper
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal-kde
        xdg-desktop-portal-hyprland
        hyprlock
        hypridle
        grim
        slurp
        wl-clipboard
        jq
    ];
}
