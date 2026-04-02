{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./animations.nix
    ./appearance.nix
    ./bg.nix
    ./binds.nix
    ./input.nix
    ./layout.nix
    ./misc.nix
    ./plugins.nix
    ./startup.nix
    ./variables.nix
    ./window-rules.nix
  ];
  home.packages = with pkgs; [
    appimage-run
    hyprcursor
    hyprshot
    hyprpaper
    udiskie
    blueberry
    swww
    iwgtk
    apple-cursor
    notify-desktop
    whitesur-cursors
    jq
    xdotool
    inputs.walker.packages.${pkgs.system}.default
    (writeShellScriptBin "exitwindow" ''
      if [ "$(${pkgs.hyprland}/bin/hyprctl activewindow -j | ${pkgs.jq}/bin/jq -r ".class")" = "Steam" ]; then
        ${pkgs.xdotool}/bin/xdotool getactivewindow windowunmap
      else
        ${pkgs.hyprland}/bin/hyprctl dispatch killactive ""
      fi
    '')
  ];

  services.copyq.enable = true;
  services.clipse.enable = true;
  wayland.windowManager.hyprland = {
    systemd = {
      variables = ["--all"];
    };
    package = null;
    portalPackage = null;
    enable = true;
  };
}
