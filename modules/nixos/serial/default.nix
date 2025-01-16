{ lib, ... }:
with lib;
{
  config = {
    systemd.services = {
      "serial-getty@ttyS0" = {
        enable = false;
        wantedBy = [ "getty.target" ];
        serviceConfig.Restart = "always";
      };
      "getty@ttyS0" = {
        enable = false;
        wantedBy = [ "getty.target" ];
        serviceConfig.Restart = "always";
      };
    };
  };
}
