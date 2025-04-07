{
  config,
  inputs,
  ...
}: 
let
  cfg = config.nix;
in 
{
  config = {
    nix = {
      settings = {
        auto-optimise-store = true;
        trusted-users = [
           "root"
           "@wheel"
         ];
      };
    };
  };
}
