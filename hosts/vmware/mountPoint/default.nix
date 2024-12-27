{
    nixpkgs,
    ...
}:
let
  inherit (nixpkgs.lib.filesystem) listFilesRecursive;
in 
{
  import = listFilesRecursive .
}
