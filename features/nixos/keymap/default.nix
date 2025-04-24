{ config, lib, ... }:
let

  inherit (lib) mkOption types;
  cfg = config.atlConfig.console;
in
{
  options = {
    atlConfig = {
      console = {
        keymap = mkOption {
          type = types.either types.str types.path;
          default = "us";
        };
      };
    };
  };

  config = {
    console = {
      keyMap = cfg.keymap;
    };
  };
}
