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
    atlConfig.mounts = mkOption {
      type = types.nullOr types.attrOf (
          types.submodule (
            import ../../../types/mounts-option.nix {
              inherit config lib;
            }
          )
        );
    };
  };
}
