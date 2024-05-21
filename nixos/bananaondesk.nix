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

    system.stateVersion = "23.11";

    fileSystems."/mnt/stuff" = {
        device = "/dev/disk/by-partlabel/Stuff";
        fsType = "auto";
        options = [ "users" "rw" "nofail"];
    };

    fileSystems."/mnt/games" = {
        device = "/dev/disk/by-partlabel/games";
        fsType = "auto";
        options = [ "users" "rw" "nofail"];
    };

    fileSystems."/mnt/emby" = {
        device = "/dev/disk/by-label/Emby";
        fsType = "auto";
        options = [ "users" "rw" "nofail" ];
    };

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
