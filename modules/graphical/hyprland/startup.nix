{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprctl setcursor ${config.cursorName} ${config.cursorSize}"
      "systemctl --user start cava"
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "swww-daemon & sleep 0.5 && exec wallpaper_default"
      "pkill waybar; sleep 0.5; waybar"
      "dunst"
      "killall -q walker;sleep .5 && walker --gapplication-service"
      "hyprlock"
      "hyperidle"
      "wl-paste --type text --watch cliphist store"
      "[workspace 1 silent] zen-browser"
      "[workspace 2 silent] ghostty"
      "[workspace 3 silent] sleep 2 && spotify"
      "[workspace 4 silent] sleep 2 && beeper"
    ];
  };
}
