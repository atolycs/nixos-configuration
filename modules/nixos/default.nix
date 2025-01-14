{
  nix = import ./nix;
  boot = import ./boot;
  fonts = import ./fonts;
  profiles = import ./profiles;
  serial = import ./serial;
  host-hardware = import ./host-hardware;
  machine-profile = import ./machine-profile;
  sound = import ./sound;
  ssh = import ./ssh;
  users = import ./users;
}
