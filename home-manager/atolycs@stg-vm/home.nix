{
  home-manager,
  self,
  pkgs,
  ...
}:
{
  imports = [
    self.homeModules.desktop-manager.gdm
  ];

  desktop-manager.gdm = {
    packages = with pkgs; [
      gnomeExtensions.open-bar
    ];

    enable-plugins = with pkgs; [
      gnomeExtensions.open-bar.extensionUuid
    ];

    dconf = {
      "org/gnome/shell/extensions/openbar" = {
        accent-color = [
          '0.000'
          '0.750'
          '0.750'
        ];
        bartype = "Trilands";
        reloadstyle = true;
      };
    };
  };

  systemd.user.startServices = "sd"
}
