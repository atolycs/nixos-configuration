let
  modulesDir = builtins.filter (x: x != "default.nix" && x != "default") (builtins.attrNames (builtins.readDir ./.));
  
  safeImport = filePath: 
    if builtins.pathExists filePath && filePath != ./default.nix then
      import filePath
    else
      throw "Invalid or recursive import detected: ${filePath}";

  dynamicAttrs = builtins.listToAttrs(
    map( dir: {
    name = builtins.baseNameOf dir;
    value = builtins.trace "Importing Module: ${dir}" (safeImport (./. + "/${dir}"));
  }) modulesDir
  );
in dynamicAttrs
