# let
#   nixosModuleDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./. ));
#   # dynamicAttrs = builtins.listToAttrs (
#   #  map (dir: {
#   #     name = builtins.baseNameOf dir;
#   #     value = import ././${dir};
#   #   }) nixosModuleDirs
#   # );
# in read
# {localFlake, withSystem}:
# { config, ... }:
# {
#   # https://github.com/natsukium/dotfiles/blob/ae382b6da8bb99319b272e3cd27e224dba7dbbe6/modules/nixos/default.nix#L2-L6
#   imports = (
#     builtins.map(module: ./. + "/${module}") (
#       builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }
# {
#   imports = (
#       builtins.map (module: ./. + "/${module}") (
#        builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }

let
  nixosModuleDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir ./.)
  );
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) nixosModuleDirs
  );
in
dynamicAttrs
