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
    (pkgs.writeScriptBin "install-nixos" ''
      sudo nixos-install --root /mnt --show-trace --no-root-password --flake ".#$@"
    '')
  ];
in

pkgs.stdenv.mkDerivation {
  name = "nix-installer";

  nativeBuildInputs =
    with pkgs;
    [
      nix
      git
      gh
      neovim
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
