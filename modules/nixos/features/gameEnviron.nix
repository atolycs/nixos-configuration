{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib)
    mkEnableOption
    mkOption
    mkPackageOption
    mkIf
    types
    ;

  cfg = config.environment.game-machine;
in

{
  options = {
    environment.game-machine = {
      enable = mkEnableOption "Game Machine";
    };
  };

  config = mkIf cfg.enable {
    programs.steam.enable = true;
    programs.steam.protontricks.enable = true;
  };

  meta.maintainers = "Atolycs";
}
