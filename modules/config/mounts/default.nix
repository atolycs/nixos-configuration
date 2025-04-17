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
  cfg = config.atlConfig.bindfs;
in 
{
  options = {
    atlConfig.bindfs = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable Bindfs mount tool";
      };
      mounts = mkOption {
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
  };
  config = mkIf cfg.enable {
    #   systemd.mounts = builtins.mapAttrs (name: value: {
    #   "bindfs-${builtins.baseNameOf name}" = {
    #     Mount = {
    #        What = value.mountFrom;
    #        Where = value.mountTo;
    #     };
    #   };
    # }) cfg.mounts;
  };
  # fileSystems = lib.optionalAttrs (cfg.mounts != null) {
  #    ${cfg.mounts._module.args.name} = { };
  # };
}
