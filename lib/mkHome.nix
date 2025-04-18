# cLibs args
args@{ self, ... }:
# function args
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ homeProfile }:
with args;
inputs.home-manager.lib.homeManagerConfiguration {
  extraSpecialArgs = {
    inherit
      inputs
      homeProfile
      ;
  };

  modules = [
    ../home-manager
  ];
}

# inputs.nixpkgs.lib.nixosSystem {
#   specialArgs = {
#     inherit
#       inputs
#       lib
#       hostProfile
#       flakeRoot
#       self
#       hostname
#       ;
#   };
#
#   modules = [
#     (flakeRoot + "/hosts")
#   ];
# }
