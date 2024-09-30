{
  config,
  pkgs,
  username,
  ...
}:
let
  boot = import ./config/boot.nix;
  i18n = import ./config/i18n.nix;
  nix = import ./config/nix.nix;
  systemd = import ./config/systemd.nix;
  time = import ./config/time.nix;
  users = import ./config/users.nix { inherit pkgs username; };
  virtual = import ./config/virtual.nix;
in {
  system.stateVersion = "24.05";

  imports = [
    boot
    i18n
    nix
    systemd
    time
    users
    virtual
  ];
}
