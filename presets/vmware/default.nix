{outputs, ...}: {
  imports = [
    outputs.nixosModules.serial
    outputs.hardwareProfile.vmware
  ];
}
