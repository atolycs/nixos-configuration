{config, lib, ...}:
let
 
  inherit (lib) mkOption types;
  cfg = config.atlConfig.bluetooth;
in 
{
  options = {
    atlConfig.bluetooth = {
      enable = mkOption {
         type = types.bool;
         default = false;
      };
    };
  };
}
