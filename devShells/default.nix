{ pkgs, ... }:
let
  shellDir = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  safeImport = filePath:
    if builtins.pathExists filePath && filePath != ./default.nix then
     import filePath { inherit pkgs; }
    else
     throw "Invalid or recursive import detected: ${filePath}";

  dynamicAttrs = builtins.listToAttrs (
      map (dir: {
      name = builtins.replaceStrings [".nix"][""] (builtins.baseNameOf dir);
      value = safeImport (./. + "/${dir}");
    }) shellDir
  );
in dynamicAttrs
