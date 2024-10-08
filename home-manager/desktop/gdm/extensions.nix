{ pkgs, username }: {
  users.users.${username}.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.kimpanel
  ];
}
