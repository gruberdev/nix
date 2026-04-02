{...}: {
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      animation = [
        "windows, 1, 3, md3_decel, popin 60%:"
        "windowsIn, 1, 3, md3_decel, popin 60%"
        "windowsOut, 1, 3, md3_accel, popin 60%"
        "border, 1, 10, default"
        "fade, 1, 3, md3_decel"
        "layers, 1, 2, md3_decel, slide"
        "layersIn, 1, 3, menu_decel, slide"
        "layersOut, 1, 1.6, menu_accel"
        "fadeLayersIn, 1, 2, menu_decel"
        "fadeLayersOut, 1, 4.5, menu_accel"
        "workspaces, 1, 7, menu_decel, slide"
        "workspaces, 1, 2.5, softAcDecel, slide"
        "workspaces, 1, 7, menu_decel, slidefade 15%"
        "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
        "specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
      bezier = [
        "wind, 0.05, 0.85, 0.03, 0.97"
        "winIn, 0.07, 0.88, 0.04, 0.99"
        "winOut, 0.20, -0.15, 0, 1"
        "liner, 1, 1, 1, 1"
        "md3_standard, 0.12, 0, 0, 1"
        "md3_decel, 0.05, 0.80, 0.10, 0.97"
        "md3_accel, 0.20, 0, 0.80, 0.08"
        "overshot, 0.05, 0.85, 0.07, 1.04"
        "crazyshot, 0.1, 1.22, 0.68, 0.98"
        "hyprnostretch, 0.05, 0.82, 0.03, 0.94"
        "menu_decel, 0.05, 0.82, 0, 1"
        "menu_accel, 0.20, 0, 0.82, 0.10"
        "easeInOutCirc, 0.75, 0, 0.15, 1"
        "easeOutCirc, 0, 0.48, 0.38, 1"
        "easeOutExpo, 0.10, 0.94, 0.23, 0.98"
        "softAcDecel, 0.20, 0.20, 0.15, 1"
        "md2, 0.30, 0, 0.15, 1"
        "OutBack, 0.28, 1.40, 0.58, 1"
      ];
    };
  };
}
