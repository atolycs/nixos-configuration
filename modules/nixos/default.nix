let
  modulePath = ".";
in 
lib.mapAttrs'(
  f: _: lib.nameValuePair (lib.removeSuffix ".nix" f) (import (modulePath + "/${f}"))
) (builtins.readDir modulePath)

