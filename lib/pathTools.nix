args@{ inputs, ... }:
with builtins;
let
  safeImport = filePath: 
    if builtins.pathExists filePath && filePath != ./default.nix then
      import filePath
    else
      throw "Invalid or recursive import detected: ${filePath}";
  maybeLoad =
    path: if pathExists path then builtins.trace "Loading: ${path}" (safeImport path) else _: { };
in
{
  inherit maybeLoad;
}
