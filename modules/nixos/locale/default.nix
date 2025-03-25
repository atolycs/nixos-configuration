{
  config,
  pkgs,
  lib,
  ...
}:
with lib;

let
  cfg = config.locale;
in
{
  options = {
    locale = {
      master = lib.mkOption {
        type = lib.types.str;
        default = "en_US.UTF-8";
        description = "default Main Locale";
      };
      additional = lib.mkOption {
        type = lib.types.nullOr (lib.types.listOf lib.types.str);
        default = [ ];
        description = "Add Locale here";
      };

      sortfix = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Sort start on Unix code";
      };
    };
  };

  config = (
    mkMerge [
      ({
        i18n.defaultLocale = cfg.master;
      })
      (mkIf cfg.sortfix {
        i18n.extraLocaleSettings.LC_COLLATE = "C.UTF-8";
      })
      (mkIf (cfg.additional != null) {
        i18n.supportedLocales = cfg.additional;
      })
    ]
  );
  # config = {
  #    i18n = {
  #      defaultLocale = cfg.master;
  #      supportedLocales = cfg.additional;
  #      extraLocaleSettings = {
  #        LC_COLLATE = if (cfg.sortfix) then "C.UTF-8" else "";
  #      };
  #    };
  # };
}
