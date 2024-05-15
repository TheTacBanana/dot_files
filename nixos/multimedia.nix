{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
    ];

    users.groups.multimedia = {};

    users.users.jellyfin = {
        isNormalUser  = false;
        home  = "/home/jellyfin";
        extraGroups  = [ "networkmanager" "multimedia" "disk" ];
    };

    services.jellyfin = {
        enable = true;
        openFirewall = true;
        user="jellyfin";
    };
}