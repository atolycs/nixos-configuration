{
  config,
  lib,
  ...
}:
let
  inherit (lib) mkOption types mkIf;
  coreFileSystemOpts = 
    {name, config, ...}:{
      options = {
        mountPoint = mkOption {
          type = types.str;
        };
      };
    };
  cfg = config.atlConfig;
in 
{
  options = {
    atlConfig.mounts = mkOption {
       default = { };
       type = types.nullOr (
        types.attrsOf (types.submodule [
          #coreFileSystemOpts
          (
           import ../../../types/mounts-option.nix
          )
        ])
      );
    };

  };
  config = {
    fileSystems = {};
     # fileSystems = lib.optionalAttrs {
     #
     # };
  };
  # fileSystems = lib.optionalAttrs (cfg.mounts != null) {
  #    ${cfg.mounts._module.args.name} = { };
  # };
}
