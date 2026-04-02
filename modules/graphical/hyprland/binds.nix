{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod SUPER, mouse:272, resizewindow"
    ];

    bind = [
      "$mod SHIFT, E, exec, wlogout"
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"
      "$mod, G, togglegroup,"
      "$mod SHIFT, N, changegroupactive, f"
      "$mod SHIFT, P, changegroupactive, b"
      "$mod, R, togglesplit,"
      "$mod, T, exec, kitty"
      "$mod, P, pseudo,"

      "$mod SHIFT, left, movewindow, l"
      "$mod SHIFT, right, movewindow, r"
      "$mod SHIFT, up, movewindow, u"
      "$mod SHIFT, down, movewindow, d"

      "$mod, Return, exec, ghostty"
      "$mod, E, exec, $fileManager"

      "$mod, left, movefocus, l"
      "$mod, right, movefocus, r"
      "$mod, up, movefocus, u"
      "$mod, down, movefocus, d"

      "$mod SHIFT, S, exec, hyprshot -m region"
      "$mod SHIFT, R, exec, record_screen"
      "$mod SHIFT, L, exec, hyprlock"
      "$mod, W, exec, swww img ${config.home.homeDirectory}/dotfiles/media/wallpapers/wallpaper.png --transition-type wipe --transition-duration 2"
      "$mod SHIFT, W, exec, swww img ${config.home.homeDirectory}/dotfiles/media/wallpapers/lockscreen.png --transition-type fade --transition-duration 2"

      "$mod, bracketleft, workspace, m-1"
      "$mod, bracketright, workspace, m+1"

      "$mod SHIFT, bracketleft, focusmonitor, l"
      "$mod SHIFT, bracketright, focusmonitor, r"

      "$mod SHIFT SUPER, bracketleft, movecurrentworkspacetomonitor, l"
      "$mod SHIFT SUPER, bracketright, movecurrentworkspacetomonitor, r"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"

      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
    ];

    bindr = [
      "$mod, Space, exec, $menu"
    ];

    bindl = [
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
      ", XF86MonBrightnessUp, exec, brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, brillo -q -u 300000 -U 5"
    ];
  };
}
