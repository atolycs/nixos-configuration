args@{inputs, ...}:
with builtins;
let
  maybeLoad = path:
    if pathExists path then 
      builtins.trace "Loading DevShell Profile: ${path}" (import path { inherit pkgs; })
    else
    _: { };
in 
{
  inherit maybeLoad;
}

