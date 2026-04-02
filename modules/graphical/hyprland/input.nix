{...}: {
  wayland.windowManager.hyprland.settings = {
    input = {
      repeat_rate = 50;
      repeat_delay = 300;
      numlock_by_default = true;
      follow_mouse = 1;
      force_no_accel = 0;
      sensitivity = 0.0;
      accel_profile = "flat";
      special_fallthrough = true;
      touchpad = {
        natural_scroll = true;
        disable_while_typing = true;
        tap-to-click = true;
        drag_lock = true;
        scroll_factor = 0.5;
      };
    };
  };
}
