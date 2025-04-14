{
  config,
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
        example = ''
          locale.additional = [
            "en_US.UTF-8/UTF-8"
            "C.UTF-8/UTF-8"
            ...
          ];
        '';
      };

      sortfix = {
        type = lib.types.bool;
        default = true;
        description = "Sort start on Unix code";
      };
    };
  };


  config = (
     mkMerge [
      ({
        i18n.deafultLocale = cfg.master;
      })

      (mkIf cfg.sortfix {
        i18n.extraLocaleSettings.LC_COLLATE = "C.UTF-8";
      })

      ({
        i18n.supportedLocales = mkMerge [
          (cfg.additional)
          (if (cfg.sortfix) then "C.UTF-8/UTF-8" else "")];
      })
    ]
  );
}
