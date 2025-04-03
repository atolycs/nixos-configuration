{
  nixpkgs ?
    let
      lock = (builtins.fromJSON (builtins.readFile ../flake.lock)).nodes.nixpkgs.locked;
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
    (nixpkgs.writeScriptBin "update-input" ''
      nix flake lock --override-input "$1" "$2"
    '')
    (nixpkgs.writeScriptBin "update-flake" ''
      nix flake update --show-trace
    '')
    (nixpkgs.writeScriptBin "switch-nixos" ''
      sudo nixos-rebuild switch --flake ".#$@" --show-trace
    '')
    (nixpkgs.writeScriptBin "switch-home" ''
      home-manager switch --flake ".#$@" --show-trace
    '')
    (nixpkgs.writeScriptBin "update-home" ''
      home-manager switch --flake "." --show-trace $@
    '')
    (nixpkgs.writeScriptBin "upgrade-nixos" ''
      sudo nixos-rebuild switch --upgrade --flake ".#$@" --show-trace
    '')
    (nixpkgs.writeScriptBin "install-nixos" ''
      sudo nixos-install --root /mnt --show-trace --no-root-password --flake ".#$@"
    '')
  ];
in
nixpkgs.mkShell {
  name = "devNix";

  buildInputs =
    with nixpkgs;
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
    source ${nixpkgs.git}/share/bash-completion/completions/git-prompt.sh;
    export PROMPT_DIRTRIM=2;
    export NIXPKGS_ALLOW_UNFREE=1;
    export PS1='\n\[\033[1;32m\][devShell is \[\033[0;33m\]$(echo $name)\[\033[1;32m\]:\w]$(__git_ps1 "(%s)")\$\[\033[0m\] '
  '';

  NIX_CONFIG = "extra-experimental-features = nix-command flakes";
}
