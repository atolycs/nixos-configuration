{ pkgs, ... }:
{
  config = {
    boot = {
      consoleLogLevel = 4;
      kernelParams = [

      ];
      loader = {
        systemd-boot = {
          enable = true;
          graceful = true;
        };
        efi.canTouchEfiVariables = true;
      };
    };
  };
}
