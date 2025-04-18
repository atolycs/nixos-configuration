{
  config,
  lib,
  name,
  ...
}:
{
  options = {
    mountFrom = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    mountTo = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
    };

    fsType = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = "";
    };

    mountOption = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = "";
    };
  };
  config = {
    mountTo = lib.mkDefault name;
  };
}
