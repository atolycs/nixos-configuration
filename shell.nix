{
  pkgs ?
    let
      lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
      nixpkgs = fetchTarball {
        url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
        sha256 = lock.narHash;
      };
    in
    import nixpkgs { overlays = [ ]; },
  ...
}@inputs:
let
  scripts = [
    (pkgs.writeScriptBin "update-input" ''
      nix flake lock --override-input "$1" "$2"
    '')
    (pkgs.writeScriptBin "switch-nixos" ''
      sudo nixos-rebuild switch --flake ".#$@" --show-trace
    '')
  ];
in

pkgs.stdenv.mkDerivation {
  name = "nix";

  nativeBuildInputs =
    with pkgs;
    [
      nix
      nil
      nixd
      nixpkgs-fmt
      git
      neovim
      nixfmt-rfc-style
      treefmt
    ]
    ++ scripts;

  shellHook = ''
    source /run/current-system/sw/share/bash-completion/completions/git-prompt.sh;
    export PS1='\n\[\033[1;32m\][devShell is \[\033[0;33m\]$(echo $name)\[\033[1;32m\]:\w]$(__git_ps1 "(%s)")\$\[\033[0m\] '
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
