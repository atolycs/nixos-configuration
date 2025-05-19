{
  self,
  ...
}:
with self;
{
  imports = [
    outputs.hardwareModules.vmware
  ];
}
