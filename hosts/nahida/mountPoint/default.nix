{
  imports = (
    builtins.map (mountPoint: ./. + "/${mountPoint}") (
      builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
    )
  );
}
