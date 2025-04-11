args@{ inputs, ... }:
with builtins;
let
  maybeLoad =
    path: if pathExists path then builtins.trace "Loading: ${path}" (import path) else _: { };
in
{
  inherit maybeLoad;
}
