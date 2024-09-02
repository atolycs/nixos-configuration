{
  config,
  lib,
  pkgs,
  ...
}:

{
  time.timeZone = "Asia/Tokyo";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.atolycs = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    github-cli
    git
    vim
    neovim
  ];
  
  console = {
   keyMap = "us";
  };

  programs = {
      gnupg = {
        agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
        ];
      };
  };

}
