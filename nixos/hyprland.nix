{ pkgs, ... }:

let
  wanipaperSrc = builtins.fetchGit {
    url = "https://github.com/TheTacBanana/wanipaper.git";
    ref = "master";
  };
  wanipaper = pkgs.callPackage wanipaperSrc { };
in
{
  programs.hyprland.enable = true;
  services = {
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
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
    hyprlock
    hypridle
    hyprcursor
    grim
    slurp
    wl-clipboard
    wayfreeze
    jq
    hyprland-activewindow
    wanipaper
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };
}
