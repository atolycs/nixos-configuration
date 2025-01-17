{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/vmware-guest.nix")
  ];
  config = {
    virtualisation.vmware.guest.enable = true;
  };
}
