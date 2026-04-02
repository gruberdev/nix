{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.xorg.libX11];

  home.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "us";
    XKB_DEFAULT_VARIANT = "alt-intl";
  };

  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "alt-intl";
    };
  };
}
