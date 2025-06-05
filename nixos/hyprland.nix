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

  security.pam.services.hyprlock = { };

  environment.systemPackages = with pkgs; [
    brightnessctl
    fuzzel
    hyprpaper
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
    kdePackages.xwaylandvideobridge
    hyprlock
    hypridle
    hyprcursor
    grim
    slurp
    wl-clipboard
    wayfreeze
    jq
    hyprland-activewindow
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };
}
