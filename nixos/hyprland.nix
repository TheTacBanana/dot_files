{ pkgs, ... }:

let
  wanipaper =
    import
      (pkgs.fetchFromGitHub {
        owner = "TheTacBanana";
        repo = "wanipaper";
        rev = "65c101c3665df33bdd2ceb82e830d4c7e899ac91";
        hash = "sha256-STBGeAW7bHrACNW63yL/Iso93d6oK9XUqgoOmrBoh2U=";
      })
      {
        pkgs = pkgs;
      };
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
