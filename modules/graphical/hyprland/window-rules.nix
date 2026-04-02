{...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "noanim, swww-daemon"
      "animation slide right, notifications"
      "blur, astal-quickcontrol"
      "animation fade, astal-quickcontrol"
      "animation fade, astal-logout"
      "animation slide bottom, astal-dock"
    ];

    windowrulev2 = [
      "float, class:^(dunst)$"
      "float, class:^(wired-notify)$"

      "float, title:^(Save As)$"
      "float, title:^(Open File)$"
      "size 50% 50%, title:^(Open File)$"
      "center, title:^(Open File)$"
      "float, title:^(File Upload)$"
      "center, title:^(File Upload)$"

      "float, title:^(Open Files)$"
      "center, title:^(Open Files)$"
      "float, title:^(File Upload)$"
      "center, title:^(File Upload)$"
      "float, title:^(Save Image)$"
      "center, title:^(Save Image)$"

      "float, class:^(imv)$"
      "size 75% 75%, class:^(imv)$"
      "center, class:^(imv)$"

      "float, class:^(mpv)$"
      "size 70% 70%, class:^(mpv)$"
      "center, class:^(mpv)$"

      "immediate, class:^(steam_app_)"

      "idleinhibit always, class:^(steam_app_)"
      "idleinhibit always, class:^(gamescope)$"

      "float, class:^(org.gnome.Calculator)$"
      "size 360 490, class:^(org.gnome.Calculator)$"

      "float, class:^(org.cinnamon.Nemo)$"
      "size 50% 50%, class:^(org.cinnamon.Nemo)$"

      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"

      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(Zen — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      "idleinhibit focus, class:^(mpv|.+exe|celluloid|Brave-browser)$"
      "idleinhibit focus, class:^(Brave-browser)$, title:^(.*YouTube.*)$"
      "idleinhibit fullscreen, class:^(Brave-browser)$"

      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-gtk)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"
      "dimaround, class:^(Brave-browser)$, title:^(File Upload)$"

      "rounding 0, xwayland:1"
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      "scrolltouchpad 0.1, class:^(zen|zen-brow|Brave-browser|chromium-browser|chrome-.*)$"
      "scrolltouchpad 0.1, class:^(obsidian)$"
    ];
  };
}
