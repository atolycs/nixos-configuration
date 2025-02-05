{
  inputs,
  outputs,
  homeProfile,
  stateVersion,
  pkgs,
  ...
}:
{
  imports = [
    ./${homeProfile}/home.nix
  ];
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };

  home = {
    inherit stateVersion;
    # file = {
    #   ".config/fcitx5/profile" = {
    #     source = ./common/fcitx5/profile;
    #   };
    # };
  };
}
