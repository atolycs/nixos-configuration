{
  config,
  lib,
  ...
}@moduleArgs:
let
  inherit (lib) mkOption types mkIf;
  cfg = config.atlConfig;
in 
{
  options = {
    atlConfig.mounts = mkOption {
       type = types.nullOr (
        types.attrsOf (types.submodule [(
           import ../../../types/mounts-option.nix { inherit config lib; }
        )])
      );
    };

  };
  config = {
    inherit moduleArgs;
     # fileSystems = lib.optionalAttrs {
     #
     # };
  };
  # fileSystems = lib.optionalAttrs (cfg.mounts != null) {
  #    ${cfg.mounts._module.args.name} = { };
  # };
}
