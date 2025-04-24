# cLibs args
args@{ self, ... }:
# function args
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ homeProfile }:
with args;
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = inputs.nixpkgs-unstable.legacyPackages.${builtins.currentSystem};

  extraSpecialArgs = {
    inherit
      inputs
      homeProfile
      pkgs
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
