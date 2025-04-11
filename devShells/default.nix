{ pkgs, ... }:
let

  inherit pkgs;
  shellDir = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  safeImport =
    filePath:
    if builtins.pathExists filePath && filePath != ./default.nix then
      builtins.trace "Loading DevShell Profile: ${filePath}" (import filePath)
    else
      throw "Invalid or recursive import detected: ${filePath}";

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings [ ".nix" ] [ "" ] (builtins.baseNameOf dir);
      value = safeImport (./. + "/${dir}") { inherit pkgs; };
    }) shellDir
  );
in
dynamicAttrs
