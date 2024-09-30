{
  inputs,
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/core
#    ../../modules/vmware
#    ../../modules/config-set/desktop
  ];

  system.stateVersion = "24.05";
  users.users."${username}" = {
   isNormalUser = true;
   shell = pkgs.bash;
   extraGroups = [
    "wheel"
    "libvirt"
    "audio"
    "video"
   ];
  };
}
