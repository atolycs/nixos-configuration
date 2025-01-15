{
  nix = import ./nix;
  boot = import ./boot;
  fonts = import ./fonts;
  desktop-profiles = import ./desktop-profiles;
  serial = import ./serial;
  host-hardware = import ./host-hardware;
  sound = import ./sound;
  ssh = import ./ssh;
  users = import ./users;
  programs = import ./programs;
  udisk2 = import ./udisk2;

}
