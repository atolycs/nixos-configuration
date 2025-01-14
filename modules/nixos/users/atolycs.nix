{
 pkgs,
 inputs,
 outputs,
 lib,
 config,
 packages,
 ...
}: {
  config = {
    users.users = {
      atolycs = {
        isNormalUser = true;
	description = "atolycs";
	extraGroups = [
	  "video"
	  "lp"
	  "audio"
	  "wheel"
	];
      };
    };
  };
}
