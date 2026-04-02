{
  config,
  lib,
  system,
  ...
}:
with lib; {
  options = {
    username = mkOption {type = types.str;};
    usermail = mkOption {type = types.str;};
    usergit = mkOption {type = types.str;};
    version = mkOption {type = types.str;};
    homePath = mkOption {type = types.str;};
    dotfilesPath = mkOption {type = types.str;};
    wallpaper = mkOption {type = types.str;};
    screenshots = mkOption {type = types.str;};

    font = mkOption {type = types.str;};
    fontSize = mkOption {type = types.str;};
    monospace = mkOption {type = types.str;};

    cursorName = mkOption {type = types.str;};
    cursorSize = mkOption {type = types.str;};
    tz = mkOption {type = types.str;};
    ssd1 = mkOption {type = types.str;};
    ssd2 = mkOption {type = types.str;};
  };

  config = {
    username = "gruber";
    usergit = "gruberdev";
    usermail = "contact@gruber.dev.br";
    version = "25.05";
    tz = "America/Sao_Paulo";

    font = "SF Pro Rounded";
    monospace = "MonoLisa";
    cursorName = "macOS";
    fontSize = "10";
    cursorSize = "16";

    homePath =
      lib.mkDefault
      {
        x86_64-linux = "/home/${config.username}";
        aarch64-linux = "/home/${config.username}";
        aarch64-darwin = "/Users/${config.username}";
      }
      .${
        system
      };

    ssd1 = "/mnt/nvme3";
    ssd2 = "/mnt/nvme2";
    dotfilesPath = "${config.homePath}/dotfiles";
    wallpaper = "${config.homePath}/dotfiles/media/wallpapers/lockscreen.png";
    screenshots = "${config.homePath}/Pictures/screenshots";
  };
}
