{
  pkgs,
  inputs,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      hyprwinwrap
      csgo-vulkan-fix
      hypr-dynamic-cursors
      xtra-dispatchers
    ];
    settings = {
      plugin = {
        csgo-vulkan-fix = {
          res_w = 120;
          res_h = 1024;
          class = "cs2";
          fix_mouse = true;
        };
        dynamic-cursors = {
          enabled = true;
          mode = "stretch";
          threshold = 5;
          stretch = {
            limit = 10000;
            function = "linear";
          };
          shake = {
            enabled = false;
          };
        };
      };
    };
  };
}
