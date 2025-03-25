{
  home-manager,
  inputs,
  outputs,
  pkgs,
  ...
}:
{
  imports = [
    outputs.homeModules.pkgs
    outputs.homeModules.desktop-manager.gdm
    outputs.homeModules.avatar

    outputs.homeModules.programs.gh

    outputs.homeModules.hosts.stg-vm
  ];

  desktop-manager.gdm = {
    packages = with pkgs; [
      gnomeExtensions.open-bar
    ];
    enable-plugins = with pkgs; [
      gnomeExtensions.open-bar.extensionUuid
    ];
  };

  home = {
    username = "atolycs";
    homeDirectory = "/home/atolycs";
    enableNixpkgsReleaseCheck = false;
  };

  systemd.user.startServices = "sd-switch";
}
