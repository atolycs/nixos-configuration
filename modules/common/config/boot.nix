{
  boot = {
   loader = {
    systemd-boot = {
      enable = true;
      graceful = true;
    };
    efi.canTouchEfiVariables = true;
   };
  };
}
