{
  outputs,
  ...
}:
{
  imports = [
    outputs.nixosModules.serial
  ];
}
