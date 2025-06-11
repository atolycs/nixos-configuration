{
  builtins,
  home-manager,
  self,
  pkgs,
  lib,
  config,
  ...
}:
let
  test_code = builtins.trace "Tracing Path..." config;
in 
#with lib.hm.gvariant;
{
  imports = [
    #self.homeModules.desktop-manager.gdm
    #self.homeModules.default
    #self.homeManagerModules
  ];

  desktopManager.gdm = {
    packages = with pkgs; [
      gnomeExtensions.open-bar
    ];

    enable-plugins = with pkgs; [
      gnomeExtensions.open-bar.extensionUuid
    ];

    dconf = {
      "org/gnome/shell/extensions/openbar" = {
        accent-color = [
          "0.000"
          "0.750"
          "0.750"
        ];
        bartype = "Trilands";
        reloadstyle = true;
        dbradius = 71.0;
        dborder = true;
        dshadow = true;
      };
    };
  };
  home = lib.mkIf config.atlConfig.user.enable {
    username = config.atlConfig.user.username;
    homeDirectory = "/home/${config.atlConfig.user.username}";
    enableNixpkgsReleaseCheck = false;
  };
  systemd.user.startServices = "sd-switch";
}
