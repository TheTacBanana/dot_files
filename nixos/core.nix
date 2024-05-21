{ config, pkgs, ... }:
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    time.timeZone = "Europe/London";

    networking.networkmanager.enable = true;

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
        extraGroups = [ "networkmanager" "wheel" "storage" ];
    };

    nixpkgs.config.allowUnfree = true;

    programs.thunar.enable = true;
    services.gvfs.enable = true; # Mount, trash, and other functionalities
    services.tumbler.enable = true; # Thumbnail support for images
    programs.thunar.plugins = with pkgs.xfce; [
        thunar-archive-plugin
    ];

    environment.systemPackages = with pkgs; [
        vim
        kitty
        gnumake
        xdg-utils
        cloc
        networkmanagerapplet
        firefox
        vscode-fhs
        qbittorrent
        vlc
        zip
        unzip
        bless
        gparted
    ];

    # Keyring
    security.pam.services.gdm.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;
    programs.seahorse.enable = true;
    security.polkit.enable = true;
}