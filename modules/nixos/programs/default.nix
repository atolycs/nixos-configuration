let
  moduleDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) moduleDirs
  );
in

dynamicAttrs

# {
#   git = import ./git;
#   firefox-esr = import ./firefox-esr;
#   vim = import ./vim;
#
#   cloudflared = import ./cloudflared;
# }
