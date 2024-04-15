{ config, pkgs, ... }:
{
    imports = [
        ./core.nix
        ./wm.nix
        ./git.nix
        ./languages.nix
        ./audio.nix
    ];

    networking.hostName = "bananaondesk";

    system.stateVersion = "23.11";

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
