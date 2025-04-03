{ inputs, ... }@args:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit args;
  };
  modules = [ ../hosts ];
}
