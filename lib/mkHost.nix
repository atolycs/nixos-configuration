# cLibs args
args@{ self, ... }:
# function args
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ system ? "", hostname, hostProfile }:
with args;
inputs.nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit
      inputs
      lib
      hostProfile
      flakeRoot
      self
      hostname
      ;
  };

  modules = [
    (flakeRoot + "/hosts")
  ];
}
