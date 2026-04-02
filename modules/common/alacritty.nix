{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "${config.theme.background}";
          foreground = "${config.theme.foreground}";
        };
        cursor = {
          text = "${config.theme.background}";
          cursor = "${config.theme.accent}";
        };
        normal = {
          black = "${config.theme.black}";
          red = "${config.theme.red}";
          green = "${config.theme.green}";
          yellow = "${config.theme.yellow}";
          blue = "${config.theme.blue}";
          magenta = "${config.theme.purple}";
          cyan = "${config.theme.cyan}";
          white = "${config.theme.foreground-alt}";
        };
        bright = {
          black = "${config.theme.bright-black}";
          red = "${config.theme.red}";
          green = "${config.theme.green}";
          yellow = "${config.theme.yellow}";
          blue = "${config.theme.blue}";
          magenta = "${config.theme.purple}";
          cyan = "${config.theme.cyan}";
          white = "${config.theme.bright-white}";
        };
      };
      font = {
        normal = {
          family = "${config.font}";
        };
        size = 12.0;
      };
      window = {
        padding = {
          x = 12;
          y = 12;
        };
        dynamic_padding = true;
        opacity = 1.0;
        dimensions = {
          columns = 100;
          lines = 30;
        };
      };
    };
  };
}
