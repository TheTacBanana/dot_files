{ config, lib, pkgs, ... }:
{
    services.xserver.videoDrivers = ["nvidia"];
    # Force wayland when possible
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # Fix disappearing cursor on Hyprland
    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

    hardware.nvidia = {
        modesetting.enable = true;
        nvidiaSettings = true;
        open = false;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable OpenGL
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };
}
