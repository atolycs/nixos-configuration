{ pkgs, ... }:
{
  config = {
    boot = {
      consoleLogLevel = 4;
      initrd.verbose = true;
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
