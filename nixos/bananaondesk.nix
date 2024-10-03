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
        ./steam.nix
    ];

    networking.hostName = "bananaondesk";

    system.stateVersion = "24.05";

    # Dual Boot
    boot.loader.systemd-boot.enable = false;
    time.hardwareClockInLocalTime = true;
    boot.loader = {
        efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
        };
        grub = {
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
        (lutris.override {
            extraLibraries =  pkgs: [];
            extraPkgs = pkgs: [];
        })
        wineWowPackages.stable
        wine
        (wine.override { wineBuild = "wine64"; })
        wine64
        wineWowPackages.staging
        winetricks
        wineWowPackages.waylandFull
    ];
}
