{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/vmware-guest.nix")
  ];
}
