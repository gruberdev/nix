{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 10;
      gaps_out = 10;
      gaps_workspaces = 0;
      border_size = 2;
      "col.active_border" = "rgba(${builtins.substring 1 6 config.theme.accent}ff)";
      "col.inactive_border" = "rgba(${builtins.substring 1 6 config.theme.bright-black}33)";
      resize_on_border = true;
      layout = "dwindle";
    };

    decoration = {
      rounding = 6;
      rounding_power = 2;
      active_opacity = 0.97;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1;
      dim_inactive = false;
      dim_strength = 0.02;
      dim_special = 0.05;
      dim_around = 0.1;

      blur = {
        enabled = true;
        xray = true;
        size = 2;
        vibrancy_darkness = 0.3;
        passes = 2;
        vibrancy = 0.5;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.01;
      };

      shadow = {
        enabled = true;
        color = "rgba(${builtins.substring 1 6 config.theme.black}30)";
        ignore_window = true;
        offset = "0 15";
        range = 100;
        render_power = 2;
        scale = 0.97;
      };
    };
  };
}
