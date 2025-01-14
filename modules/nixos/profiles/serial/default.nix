{ lib, ...}:
with lib
{
  config = {
      systemd = {
        "serial-getty@ttyS0" = {
          enable = true;
        };
        "getty@ttyS0" = {
            enable = true;
          };
      };

  };
}
