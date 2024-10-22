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
