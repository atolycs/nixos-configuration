{
  programs = {
    dconf = {
     enable = true;
     profiles.user.databases = [
        {
          settings = {
            "org/gnome/desktop/wm/preferences" = {
              button-layout = "appmenu:minimize,maximize,close";
            };

            "org/gnome/shell" = {
              disable-user-extensions = false;
              enabled-extensions = [
                "kimpanel@kde.org"
                "user-theme@gnome-shell-extensions.gcampax.github.com"
              ];
            };
          };
        }
     ];
    };
  };
}
