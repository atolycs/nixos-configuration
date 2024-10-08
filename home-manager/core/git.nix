{ pkgs-stable, ... }:
{
  program = {
    git = {
     enable = true;
    };
    gh = {
     enable = true;
     package = pkgs-stable.gh;
    };
  };
}
