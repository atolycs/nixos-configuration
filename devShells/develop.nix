{ pkgs, ... }:
let
  scripts = [
    (pkgs.writeScriptBin "switch-nixos" ''
      sudo nixos-rebuild switch --flake ".#$@" --show-trace
    '')
  ];
in
pkgs.stdenv.mkDerivation ({
  name = "devNix";
  nativeBuildInputs =
    with pkgs;
    [
      gh
      git
      neovim
      vim
    ]
    ++ scripts;

  shellHook = ''
    source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh;
    export PROMPT_DIRTRIM=2;
    export NIXPKGS_ALLOW_UNFREE=1;
    export PS1='\n\[\033[1;32m\][devShell is \[\033[0;33m\]$(echo $name)\[\033[1;32m\]:\w]$(__git_ps1 "(%s)")\$\[\033[0m\] '
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
})
