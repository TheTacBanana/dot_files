{ config, pkgs, ... }:
{
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.xterm.enable = false;
    services.xserver.displayManager.defaultSession = "none+xmonad";

    services.xserver.windowManager.xmonad = {
        enable = true;
        enableContribAndExtras = true;
        extraPackages = haskellPackages: [
            haskellPackages.dbus
            haskellPackages.List
            haskellPackages.monad-logger
            haskellPackages.xmonad
        ];
    };

    services.xserver.windowManager.xmonad.config = builtins.readFile ../xmonad/xmonad.hs;
}
