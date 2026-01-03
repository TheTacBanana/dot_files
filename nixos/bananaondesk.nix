{ pkgs, ... }:
{
  imports = [
    ./core.nix
    ./hyprland.nix
    ./git.nix
    ./languages.nix
    ./audio.nix
    ./bluetooth.nix
    ./gpu.nix
    ./multimedia.nix
    ./steam.nix
    ./helix.nix
    ./rgb.nix
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
      configurationLimit = 30;
      devices = [ "nodev" ];
      efiSupport = true;
      enable = true;
      extraEntries = ''
        menuentry "Windows" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain
        search --fs-uuid --set=root 58D4-FF82
        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };
  };

  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-partlabel/games";
    fsType = "auto";
    options = [
      "users"
      "rw"
      "exec"
      "nofail"
    ];
  };

  fileSystems."/mnt/jelly" = {
    device = "/dev/disk/by-label/jelly";
    fsType = "auto";
    options = [
      "users"
      "nofail"
    ];
  };
}
