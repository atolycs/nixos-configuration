{self, ...}:
with self;
{
  imports = [
    outputs.hardwareModules.kvm
  ];

}
