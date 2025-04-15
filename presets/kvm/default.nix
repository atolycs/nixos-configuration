{
  self,
  ...
}:
with self;
{
  imports = [
    outputs.hardwareModules.kvm
    self.nixosModules.serial
  ];

  config = {
    boot.serial-console.enable = true;
  };
}
