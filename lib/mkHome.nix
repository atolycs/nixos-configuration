# cLibs args
args@{ self, ... }:
# function args
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ homeProfile }:
with args;
let
in
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = self.inputs.nixpkgs-unstable.legacyPackages.${builtins.currentSystem};

  extraSpecialArgs = {
    inherit
      self
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
