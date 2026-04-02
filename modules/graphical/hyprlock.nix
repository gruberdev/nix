{
  config,
  inputs,
  pkgs,
  lib,
  ...
}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        immediate_render = true;
        hide_cursor = false;
        no_fade_in = true;
      };

      animation = "inputFieldDots, 1, 2, linear";

      background = [
        {
          monitor = "";
          path = config.wallpaper;
        }
      ];

      input-field = [
        {
          size = "300, 50";
          valign = "bottom";
          position = "0%, 10%";

          outline_thickness = 2;

          font_family = "${config.font}";
          font_color = "${config.theme.foreground}";
          outer_color = "${config.theme.accent}";
          inner_color = "${config.theme.subtle}";
          check_color = "rgba(${builtins.substring 1 6 config.theme.success}, 0.5)";
          fail_color = "rgba(${builtins.substring 1 6 config.theme.error}, 0.5)";

          fade_on_empty = false;
          placeholder_text = "Enter Password";

          dots_spacing = 0.2;
          dots_center = true;
          dots_fade_time = 100;
        }
      ];

      label = [
        {
          monitor = "";
          text = "cmd[update:3600000] LANG=en_US.UTF-8 date +'%I:%M'";
          font_size = 120;
          color = "${config.theme.foreground}";
          font_family = "${config.font}";
          position = "0%, 30%";

          valign = "center";
          halign = "center";

          shadow_color = "rgba(${builtins.substring 1 6 config.theme.black}, 0.1)";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
        {
          monitor = "";
          text = "cmd[update:3600000] LANG=en_US.UTF-8 date +'%A %b %d'";
          font_size = 20;
          color = "${config.theme.foreground}";
          font_family = "${config.font}";
          position = "0%, 40%";

          valign = "center";
          halign = "center";

          shadow_color = "rgba(${builtins.substring 1 6 config.theme.black}, 0.1)";
          shadow_size = 20;
          shadow_passes = 2;
          shadow_boost = 0.3;
        }
      ];
    };
  };
}
