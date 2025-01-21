{pkgs, ...}: {
  config = {
    programs = {
      gh = {
        enable = true;
        package = pkgs.gh;
      };
    };
  };
}
