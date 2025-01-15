{ outputs, ... }:
{
  imports = [
    outputs.nixosModules.host-hardware.vmware
  ];
}
