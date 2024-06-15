{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./hyprland.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
        ./gpu.nix
        ./multimedia.nix
        ./gamedev.nix
        # ./xmonad.nix
    ];

    networking.hostName = "bananaondesk";

    system.stateVersion = "24.05";

    # Dual Boot
    boot.loader.systemd-boot.enable = false;
    # boot.loader.grub.enable = true;
    # boot.loader.grub.device = "nodev";
    # boot.loader.grub.useOSProber = true;
    time.hardwareClockInLocalTime = true;

    boot.loader = {
        efi = {
        canTouchEfiVariables = true;
        # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
        efiSysMountPoint = "/boot";
        };
        grub = {
        # despite what the configuration.nix manpage seems to indicate,
        # as of release 17.09, setting device to "nodev" will still call
        # `grub-install` if efiSupport is true
        # (the devices list is not used by the EFI grub install,
        # but must be set to some value in order to pass an assert in grub.nix)
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        extraEntries = ''
            menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root 6E42-D51B
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
            }
        '';
        };
    };

    fileSystems."/mnt/games" = {
        device = "/dev/disk/by-partlabel/games";
        fsType = "auto";
        options = [ "users" "rw" "exec" "nofail"];
    };

    # fileSystems."/mnt/emby" = {
    #     device = "/dev/disk/by-label/Emby";
    #     fsType = "auto";
    #     options = [ "users" "nofail" ];
    # };

    environment.systemPackages = with pkgs; [
        spotify
        discord
        (lutris.override {
            extraLibraries =  pkgs: [
                # List library dependencies here
            ];
            extraPkgs = pkgs: [
                # List package dependencies here
            ];
        })
    ];

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
}
