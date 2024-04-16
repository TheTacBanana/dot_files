{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./xmonad.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
        ./gpu.nix
    ];

    networking.hostName = "bananaondesk";

    system.stateVersion = "23.11";

    fileSystems."/mnt/stuff" = {
        device = "/dev/disk/by-partlabel/Stuff";
        fsType = "auto";
        options = [ "user" "rw" ];
    };

    environment.systemPackages = with pkgs; [
        dolphin
        spotify
        discord
    ];

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
}
