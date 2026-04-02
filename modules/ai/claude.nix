{
  pkgs,
  config,
  inputs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in {
  home = {
    packages = with pkgs; [
      inputs.claude-desktop.packages.${pkgs.system}.claude-desktop-with-fhs
      unstable.claude-code
    ];
  };
  xdg.desktopEntries.claude-desktop = {
    name = "Claude Desktop";
    exec = "env NODE_PATH=${config.homePath}/.local/share/npm/lib/node_modules claude-desktop %u --no-sandbox --enable-features=UseOzonePlatform --ozone-platform=x11 --enable-wayland-ime=true --disable-gpu";
    icon = "claude";
    type = "Application";
    terminal = false;
    categories = [
      "Office"
    ];
  };
}
