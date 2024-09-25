{
  description = "Atolycs nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }: {
   nixosConfigurations = {
     minimal = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         ./hosts/minimal/configuration.nix
       ];
     };
     desktop = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [
         ./hosts/desktop/configuration.nix
       ];
     };
   };
  };
}
