{ config,...}:
with lib;
let
  cfg = config.atlcfg;
   
in 
{
  options = {
    atlcfg = {
      user = mkOption {
        default = "atolycs";
        type = types.str;
        description = "Set add UserName";
      };
    };
  };
}
