{
  config,
  hostname,
  inputs,
  lib,
  outputs,
  stateVersion,
  username,
  virtual,
  self,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
  select_flake = builtins.getEnv "FLAKE";
  drivers = {
    "kvm" = [ (import ./base-nixos/config/kvm)];
    "vmware" = [ (import ./base-nixos/config/vmware)];
  };
in
{
  imports = [
    "./${flake}"
  ];

  boot = {
    kernelModules = [ "vhost_vsock" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
        timeout = 5;
      };
    };
  };
}
