let
  pinnedZoomPkgs =
    import
      (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/0c19708cf035f50d28eb4b2b8e7a79d4dc52f6bb.tar.gz";
        sha256 = "0ngw2shvl24swam5pzhcs9hvbwrgzsbcdlhpvzqc7nfk8lc28sp3";
      })
      {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
  pinnedZoom = pinnedZoomPkgs.zoom-us;
in
{ pkgs, ... }:
{
  time.timeZone = "Europe/London";

  networking = {
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    kitty
    btop
    gnumake
    xdg-utils
    cloc
    networkmanagerapplet
    firefox
    google-chrome
    pympress
    vscode-fhs
    qbittorrent
    vlc
    zip
    unzip
    imhex
    gparted
    spotify
    discord
    discord-canary
    pinnedZoom
  ];

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  users.users.banana = {
    isNormalUser = true;
    description = "Eris";
    extraGroups = [
      "networkmanager"
      "wheel"
      "storage"
      "gamemode"
    ];
  };

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.thunar.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
  ];
  programs.file-roller.enable = true;
  fonts.packages = with pkgs; [
    fira-code
  ];

  # Keyring
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  security.polkit.enable = true;

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.systemd}/bin/systemctl suspend";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = [ "NOPASSWD" ];
          }
          {
            command = "${pkgs.systemd}/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
        ];
        groups = [ "wheel" ];
      }
    ];
  };

  programs.nix-ld = {
    enable = true;
  };

  programs.bash.shellAliases = {
    bat = "cat /sys/class/power_supply/BAT0/capacity";
    cloc = "cloc --vcs=git";
  };
}
