{
  pkgs,
  inputs,
  outputs,
  lib,
  config,
  packages,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  config = {
    users.users = {
      atolycs = {
        isNormalUser = true;
        description = "atolycs";
        extraGroups = [
          "video"
          "lp"
          "audio"
          "wheel"
        ];
      };
    };
  };
}
