{lib, config, ...}: 
let
  inherit (lib)
    mkOption
    mkIf
    types
    ;

    cfg = config.boot.serial-console;
in {
  options = {
      boot.serial-console = {
          enable = mkOption {
              type = types.bool;
              default = false;
              description = "Whenever to configure serial-console system-wide.";
            };
        };
    };
  
  config = mkIf cfg.enable {

      boot.kernelParams = [
        "console=ttyS0,115200"
        "console=tty0"
      ];
    };

}
