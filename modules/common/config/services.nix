{
  services = {
    openssh.enable = true;
    ntp.enable = true;

    xserver = {
     enable = true;
     displayManager.gdm.enable = true;
     desktopManager.gnome.enable = true;
    };

    pipewire = {
     enable = true;
     pulse = {
      enable = true;
     };
    };
  };
}
