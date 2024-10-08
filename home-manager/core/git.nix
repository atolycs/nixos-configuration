{ pkgs-stable, ... }:
{
  programs = {
    git = {
     enable = true;
    };
    gh = {
     enable = true;
     package = pkgs-stable.gh;
    };
  };
}
