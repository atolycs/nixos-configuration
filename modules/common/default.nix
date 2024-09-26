{ config, pkgs, username, lib, hostname, ... }:
let
  boot = import ./config/boot.nix;
  i18n = import ./config/i18n.nix { inherit pkgs; };
  nix = import ./config/nix.nix;
  hardware = import ./config/hardware.nix;
  network = import ./config/network.nix { inherit hostname; };
  users = import ./config/users.nix { inherit pkgs username; } ;
  fonts = import ./config/fonts.nix { inherit pkgs; } ;
  programs = import ./config/programs.nix { inherit pkgs lib; };
  packages = import ./config/package.nix { inherit pkgs; };
  services = import ./config/services.nix;
  security = import ./config/security.nix;
  time = import ./config/time.nix;
  xdg = import ./config/xdg.nix { inherit pkgs; };
  virtual = import ./config/virtual.nix;
in {
  system.stateVersion = "24.05";
  imports = [
    boot
    hardware
    network
    nix
    fonts
    i18n
    programs
    packages
    users
    services
    security
    time
    xdg
    virtual
  ];
}
