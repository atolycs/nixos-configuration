{
  pkgs ?
    let
      lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
      nixpkgs = fetchTarball {
        url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
        sha256 = lock.narHash;
      };
    in
    import nixpkgs {
      config.allowUnfree = true;
      overlays = [ ];
    },
  ...
}@inputs:
let
  scripts = [
    (pkgs.writeScriptBin "update-input" ''
      nix flake lock --override-input "$1" "$2"
    '')
    (pkgs.writeScriptBin "update-flake" ''
      nix flake update --show-trace
    '')
    (pkgs.writeScriptBin "switch-nixos" ''
      sudo nixos-rebuild switch --flake ".#$@" --show-trace
    '')
    (pkgs.writeScriptBin "switch-home" ''
      home-manager switch --flake ".#$@" --show-trace
    '')
    (pkgs.writeScriptBin "update-home" ''
      home-manager switch --flake "." --show-trace $@
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
      gh
      neovim
      nixfmt-rfc-style
      treefmt
      home-manager
      sops
      age
      ssh-to-age
    ]
    ++ scripts;

  shellHook = ''
    source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh;
    export PROMPT_DIRTRIM=2;
    export NIXPKGS_ALLOW_UNFREE=1;
    export PS1='\n\[\033[1;32m\][devShell is \[\033[0;33m\]$(echo $name)\[\033[1;32m\]:\w]$(__git_ps1 "(%s)")\$\[\033[0m\] '
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
