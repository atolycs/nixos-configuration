{ home-manager, nixpkgs, inputs, outputs, self, stateVersion, ... }: 
{

  imports = [
    #outputs.homeModules.nahida
  ];

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
