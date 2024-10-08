{
  services = {
    pipewire = {
      enable = true;
      pulse = {
        enable = true;
      };
    };
  };
  hardware.pulseaudio.enable = false;
}
