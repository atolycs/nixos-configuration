{
  outputs,
  hostname,
  pkgs,
  username,
  ...
}:
{
  imports = [
    outputs.nixosModules.udisk2
    ./disks.nix
  ];

  networking = {
    hostName = "nix-navia";
  };

}
