{
  inputs,
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./hardware-conifguration.nix

    ../../modules/common
    ../../modules/vmware
  ]
}
