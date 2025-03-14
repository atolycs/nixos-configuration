{
  home-manager,
  inputs,
  outputs,
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

  home = {
    username = "atolycs";
    homeDirectory = "/home/atolycs";
    enableNixpkgsReleaseCheck = false;
  };

  systemd.user.startServices = "sd-switch";
}
