{ pkgs, ... }:
{
  config = {
    boot = {
      consoleLogLevel = 4;
      initrd.verbose = false;
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
