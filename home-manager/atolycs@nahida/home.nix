{ home-manager, nixpkgs, inputs, outputs, self, stateVersion, ... }: 
{
  home = {
    username = "atolycs";
    homeDirectory = "/home/atolycs";
    enableNixpkgsReleaseCheck = false;
  };

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

}
