# https://github.com/thexyno/nixos-config/blob/02188142e6795ecab889cd3c5419b958b26c9a96/nixos-modules/user/default.nix
{ config, lib, pkgs, ...}:
let
  cfg = config.atlConfig.user;
  username = cfg.username;
  extraGroups = cfg.extraGroups;
in {
  options.atlConfig.user = {
    enable = lib.mkEnableOption "Enable My User";
    username = lib.mkOption {
      type = lib.types.str;
      default = "atolycs";
      description = "My username for this system";
    };

    extraGroups = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
    };

  };

  config = lib.mkIf cfg.enable {
    #programs.bash.enable = true;
    programs.vim.enable = true;
    users.extraUsers.${username} = {
      enable = cfg.enable;
      isNormalUser = true;
      extraGroups = ["wheel" "cdrom"] ++ extraGroups;
    };
  };
}
