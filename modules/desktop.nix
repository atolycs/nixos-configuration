{
    config,
    lib,
    pkgs,
    ...
}: 
{
  environment.systemPackages = with pkgs; [
  ];

  i18n.inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = [ pkgs.fcitx5-mozc ];
  };

  fonts = {
      packages = with pkgs; [
        noto-fonts-cjk-serif
        noto-fonts-cjk-sans
        noto-fonts-emoji
        nerdfonts
      ];
      fontDir.enable = true;
      fontconfig.defaultFonts = {
          serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
          sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
          monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
          emoji = ["Noto Color Emoji"];
      };
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

}
