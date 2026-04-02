{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 0;
      smart_split = false;
      smart_resizing = true;
      permanent_direction_override = false;
    };

    group = {
      groupbar = {
        font_size = 13;
        gradients = false;
        text_color = "rgb(${builtins.substring 1 6 config.theme.foreground})";
      };
    };
  };
}
