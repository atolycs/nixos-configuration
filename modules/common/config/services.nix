{
  services = {
    openssh.enable = true;
    ntp.enable = true;

    xserver = {
     enable = true;
     displayManager.gdm.enable = true;
    };
  };
}
