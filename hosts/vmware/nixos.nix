{
  hostname,
  stateSystem,
  lib,
  ...
}:
{
  imports = [
    ./mountPoint
  ];

  networking = {
    hostName = "${hostname}";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
