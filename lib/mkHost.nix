args@{ self, ... }:
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ hostname, hostProfile }:
with args;
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      inputs
      lib
      hostProfile
      flakeRoot
      self
      hostname;
  };

  modules = [
    (flakeRoot + "/hosts")
  ];
}
