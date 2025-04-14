{moduleWithSystem, ...}:
{ inputs, ... }:
let
  bootDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  safeImport = filePath:
    if builtins.pathExists filePath && filePath != ./default.nix then
          builtins.trace "Importing ${filePath} ... " (inputs.flake-parts.lib.importApply filePath)
    else
       throw "Invalid or recursive import detected: ${filePath}";

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings[".nix"] [""] (builtins.baseNameOf dir);
      value = safeImport (././${dir});
    }) bootDirs
  );
  #dynamicAttrs = bootDirs;

in dynamicAttrs  
# {
#   imports = (
#     builtins.map (module: ././${module}) (
#       builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }
