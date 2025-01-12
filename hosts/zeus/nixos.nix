{
  hostname,
  pkgs,
  ...
}:
{
  imports = [
    ./disks.nix
  ];

  network = {
    hostName = hostname;
  };

}
