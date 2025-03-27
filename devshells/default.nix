{
  pkgs, 
  ...
}:
let
  devShellDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  devShellList = builtins.listToAttrs(
   map (dir: {
      name = builtins.replaceStrings[".nix"] [""] (builtins.attrNames (builtins.baseNameOf ./.));
      value = import ././${dir} { inherit pkgs; };
    }) devShellDirs
  );
in

devShellList
