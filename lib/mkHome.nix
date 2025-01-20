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
      homeProfile,
    }:
    let
      self = outputs;
    in

    home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs outputs homeProfile stateVersion; };
      modules = [
        ../home-manager
      ];
    };
}
