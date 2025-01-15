{
  username,
  ...
}:
{
  systemd.user.mounts."home-${username}-anime" = {
    Unit = {
      Description = "Anime folder Bind Mouts";
      Before = [
        "local-fs.target"
        "umount.target"
      ];
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Mount = {
      What = "/mnt/DATA/Anime";
      Where = "%h/anime";
      Type = "fuse.bindfs";
      Options = "resolve-symlinks";
    };
  };
}
