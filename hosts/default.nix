{
  config,
  hostname,
  inputs,
  lib,
  outputs,
  stateVersion,
  username,
  virtual,
  kind,
  ...
}:
let
  drivers = {
    "kvm" = [ (import ./base-nixos/config/kvm)];
    "vmware" = [ (import ./base-nixos/config/vmware)];
  };
in
{
  imports = [ ./${kind} ];

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
