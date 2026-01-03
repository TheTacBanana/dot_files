{
  pkgs,
  ...
}:
{
  # RGB
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server = {
      port = 6742;
    };
  };

  hardware.i2c.enable = true;

  systemd.services.openrgb-profile = {
    description = "Load OpenRGB profile";
    wantedBy = [ "multi-user.target" ];
    after = [ "openrgb.service" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.openrgb}/bin/openrgb \
          --profile /home/banana/.config/OpenRGB/Purple.orp
      '';
    };
  };
}
