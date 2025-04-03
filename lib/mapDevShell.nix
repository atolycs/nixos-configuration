let
  devShellDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir ../devshells)
  );
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings [ ".nix" ] [ "" ] (builtins.baseNameOf dir);
      value = import ./. + "../${dir}";
    }) devShellDirs
  );
in rec {
  inherit dynamicAttrs;  
}
