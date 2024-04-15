{ pkgs, ... }:
{
    programs.hyprland.enable = true;

    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.displayManager.sddm.wayland.enable = true;
    services.xserver.displayManager.sddm.theme = "where_is_my_sddm_theme";

    security.pam.services.swaylock = {};

    environment.systemPackages = with pkgs; [
        brightnessctl
        swayidle
        swaylock
        where-is-my-sddm-theme
    ];
}
