{...}: {
  wayland.windowManager.hyprland.settings = {
    xwayland = {
      force_zero_scaling = true;
    };

    opengl.nvidia_anti_flicker = 0;

    misc = {
      disable_autoreload = true;
      vfr = 0;
      vrr = 0;
      animate_manual_resizes = false;
      animate_mouse_windowdragging = true;
      enable_swallow = false;
      focus_on_activate = true;
      disable_hyprland_logo = true;
      force_default_wallpaper = -1;
      disable_splash_rendering = true;
      allow_session_lock_restore = true;
      initial_workspace_tracking = true;
    };

    debug.disable_logs = false;
  };
}
