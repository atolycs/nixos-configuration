{
  config,
  lib,
  ...
}:
let
  cfg = config.atlConfig.user;
in
{
  options.atlConfig.user = {
    enable = lib.mkEnableOption "Enable My User";
    username = lib.mkOption {
      type = lib.types.str;
      default = "atolycs";
      description = "Username";
    };
  };

  config.atlConfig.user = { };
}
