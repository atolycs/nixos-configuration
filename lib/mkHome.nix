{
  inputs,
  outputs,
  home-manager,
  stateVersion,
  ...
}:
{
  mkHomeManager =
    {
      hostProfile,
    }:
    let
      self = outputs;
    in
     
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_86-linux;
      extraSpecialArgs = { inherit inputs outputs; };
      modules = [
       ../home-manager
      ];
    };
}
