{
  pkgs,
  ...
}:
{
  fonts = {
    # packages = with pkgs; [
    #   noto-fonts
    #   noto-fonts-cjk-sans
    #   noto-fonts-emoji
    #   (nerdfonts.override {
    #     fonts = [
    #       "FiraCode"
    #       "DroidSansMono"
    #     ];
    #   })
    # ];

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts._0xproto
      nerd-fonts.droid-sans-mono
    ];
    fontDir.enable = true;

    fontconfig = {
      defaultFonts = {
        serif = [
          "Noto Serif CJK JP"
          "Noto Color Emoji"
        ];

        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Color Emoji"
        ];

        monospace = [
          "JetBrainsMono Nerd Font"
          "Noto Color Emoji"
        ];

        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
