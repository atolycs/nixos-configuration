{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  mkNixos =
    {
      hostname,
      username ? "atolycs",
      desktop ? null,
      platform ? "x86_64-linux",
      profileName,
    }:
    let
      self = outputs;
      pkgs = inputs.nixpkgs;
    in
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          hostname
          username
          stateVersion
          profileName
          platform
          pkgs
          ;
      };
      modules = [ ../hosts ];
    };
}
