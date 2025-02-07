{ lib, config, ... }:
let
  inherit (lib)
    mkOption
    mkIf
    types;

  cfg = config.boot.serial-console;
in
{

  options = {
    boot.serial-console = {
      enable = mkOption {
        type = types.bool;
	default = true;
        description = "Whenever to configure serial-console system-wide.";
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services = {
      "serial-getty@ttyS0" = {
        enable = true;
        wantedBy = [ "getty.target" ];
        serviceConfig.Restart = "always";
      };
      "getty@ttyS0" = {
        enable = false;
        wantedBy = [ "getty.target" ];
        serviceConfig.Restart = "always";
      };
    };
    boot.kernelParams = [
      "console=ttyS0,115200"
      "console=tty0"
    ];
  };
}
