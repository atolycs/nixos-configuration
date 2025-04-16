{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkOption types mkIf;
in 
{
  options = {
    atlConfig.mounts = {};
  };
}
