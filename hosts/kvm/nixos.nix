{
  hostname,
  pkgs,
  ...
}:
{
  imports = [
    ./mountPoint
  ];


  packages = with pkgs; [
   zsh
  ];
}
