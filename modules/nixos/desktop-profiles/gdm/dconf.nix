{ lib, ... }:
with lib.gvariant;
{
  programs.dconf = {
    enable = true;
    profiles.gdm.databases = [
      {
        settings."org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-timeout = mkUint32 0;
          sleep-inactive-ac-type = "nothing";
        };
      }
    ];
  };
}
