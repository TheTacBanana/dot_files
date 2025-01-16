{
  config,
  lib,
  pkgs,
  ...
}:
{
  boot.initrd.kernelModules = [ "amdgpu" ];

  boot.kernelParams = [
    "radeon.si_support=0"
    "amdgpu.si_support=1"
    "radeon.cik_support=0"
    "amdgpu.cik_support=1"
  ];

  systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];

  # Enable OpenGL
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true; # For 32 bit applications

  hardware.opengl.extraPackages = with pkgs; [ amdvlk ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  # Force wayland when possible
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix disappearing cursor on Hyprland
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # RGB
  services.hardware.openrgb.enable = true;
  imports = [ ./rgb.nix ];
}
