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
  nixpkgs.hostPlatform = "x86_64-linux";

}
