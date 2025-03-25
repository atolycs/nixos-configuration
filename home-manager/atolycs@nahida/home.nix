{
  home-manager,
  nixpkgs,
  inputs,
  outputs,
  self,
  stateVersion,
  pkgs,
  ...
}:
{

  imports = [
    outputs.homeModules.pkgs
    outputs.homeModules.desktop-manager.gdm
    outputs.homeModules.avatar

    outputs.homeModules.programs.gh

    outputs.homeModules.hosts.nahida
  ];

  desktop-manager.gdm = {
    packages = with pkgs; [
      gnomeExtensions.open-bar
    ];

    enable-plugins = with pkgs; [
      gnomeExtensions.open-bar.extensionUuid
    ];

    dconf = {
      "org/gnome/desktop/interface" = {
        accent-color = "#6b932f";
      };
      "org/gnome/shell/extensions/openbar" = {
         bartype = "Trilands";
	 reloadstyle = true;
      };
    };
  };

  home = {
    username = "atolycs";
    homeDirectory = "/home/atolycs";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # home.file = {
  #   "test.txt" = {
  #     text = ''
  #      Hello home-manager world!
  #     '';
  #   };
  # };
}
