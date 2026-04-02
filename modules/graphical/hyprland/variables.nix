{
  pkgs,
  config,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "${pkgs.ghostty}/bin/ghostty || ${pkgs.xterm}/bin/xterm";
    "$fileManager" = "${pkgs.nemo}/bin/nemo";
    "$wwwbrowser" = "${pkgs.brave}/bin/brave";
    "$menu" = "${inputs.walker.packages.${pkgs.system}.default}/bin/walker";
    "$mod" = "ALT";

    env = [
      "NIXOS_OZONE_WL,1"
      "HYPRCURSOR_THEME,${config.cursorName}"
      "HYPRCURSOR_SIZE,${config.cursorSize}"
      "FREETYPE_PROPERTIES,cff:no-stem-darkening=0 autofitter:warping=1"
      "GDK_SCALE,1"
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORM,wayland"
      "GDK_BACKEND,wayland"
    ];
  };
}
