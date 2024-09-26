{
  description = "Atolycs nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github;:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager ... }: {
   nixosConfigurations = (import ./hosts/zeus {
     inherit self nixpkgs home-manager;
   });
#   nixosConfigurations = {
#     minimal = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       modules = [
#         ./hosts/minimal/configuration.nix
#       ];
#     };
#     desktop = nixpkgs.lib.nixosSystem {
#       system = "x86_64-linux";
#       modules = [
#         ./hosts/desktop/configuration.nix
#       ];
#     };
#   };
  };
}
