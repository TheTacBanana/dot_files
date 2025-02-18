{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        aseprite
        ldtk
        unityhub
        blender
    ];
}
