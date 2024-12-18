{ pkgs, ... }:
{
    programs.hyprland.enable = true;
    services = {
        xserver = {
            enable = true;
            desktopManager.xterm.enable = false;
            displayManager.gdm.enable = true;
            displayManager.gdm.wayland = true;
        };
        displayManager.defaultSession = "hyprland";
    };

    security.pam.services.hyprlock = {};


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
        hyprcursor
        grim
        slurp
        wl-clipboard
        jq
    ];
}
