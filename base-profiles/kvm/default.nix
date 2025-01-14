{ outputs, ... }:
{
  imports = [
    outputs.nixosModules.host-hardware.kvm
    outputs.nixosModules.serial
  ];
}
