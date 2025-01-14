{
  nix = import ./nix;
  boot = import ./boot;
  fonts = import ./fonts;
  profiles = import ./profiles;
  serial = import ./serial;
  host-hardware = import ./host-hardware;
  machine-profile = import ./machine-profile;
}
