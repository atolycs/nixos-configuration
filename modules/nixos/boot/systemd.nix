{ pkgs, ... }:
{
  config = {
    boot = {
      consoleLogLevel = 4;
      initrd.verbose = false;
      kernelParams = [
        "rd.systemd.show_status=true"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
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
