{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "bananatop";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

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
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    # Core
    vim
    kitty
    git
    gh
    gnumake
    xdg-utils
    cloc
    networkmanagerapplet

    # Languages
    python3
    swiProlog
    rustup
    gcc

    # Applications
    firefox
    vscode

    # Window Manager
    brightnessctl
    swayidle
    swaylock
    eww
  ];

  security.pam.services.swaylock = {};

  system.stateVersion = "23.11";
}
