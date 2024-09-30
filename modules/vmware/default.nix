{ system, pkgs, ... }:
let
  services = import ./config/services.nix;
  virtual = import ./config/virtual.nix;
in {
  system.stateVersion = "24.05";
  imports = [
    services
    virtual
  ]
}
