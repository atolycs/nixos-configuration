{
  config,
  pkgs,
  lib,
  ...
}: 
let
  inherit (lib)
    mkOption
    mkPackageOption
    mkIf
    types
    ;

    cfg = config.programs.cloudflared;
     
in
{
  options = {
    programs.cloudflared = {
      enable = mkOption {
        type = types.bool;
	default = false;
	description = "Whenever to configure {command}`cloudflared` system-wide.";
	relatedPackages = [ "cloudflared" ];
      };

      package = mkPackageOption pkgs "cloudflared" { };
    };
  };

  config = mkIf cfg.enable {
    environment = {
      systemPackages = [ cfg.package ];
    };

  };
}

