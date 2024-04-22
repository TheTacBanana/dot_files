{ config, pkgs, ... }:
{
    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.xterm.enable = false;
        displayManager.defaultSession = "none+xmonad";

        libinput.enable = true;
        libinput.mouse.accelProfile = "flat";
        # libinput.mouse.
    };

    environment.systemPackages = with pkgs; [
        xmousepasteblock
    ];

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
