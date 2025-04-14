{self, ...}:
{
  imports = [
    #./mountPoint
    #outputs.nixosPreset.kvm
  ];


  test_code = self;
  nixpkgs.hostPlatform = "x86_64-linux";
}
