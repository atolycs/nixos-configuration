{ self, ... }:
with self;
{
  imports = [
    outputs.nixosPresets.kvm
  ];

}
