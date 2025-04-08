{
  self,
  ...
}:
with self;{
  imports = [
    outputs.hardwareModules.kvm
    outputs.nixosModules.serial
  ];

  config = {
    boot.serial-console.enable = true;
  };
}
