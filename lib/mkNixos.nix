{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  mkNixOS =
    {
      hostname,
      username ? "atolycs",
      desktop ? null,
      platform ? "x86_64-linux",
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          desktop
          hostname
          username
          stateVersion
          ;
      };
      modules = [ ../hosts ];
    };
}
