{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config = config.nixpkgs.config;
  };
in {
  imports = lib.imports [
    "common/alacritty"
    "common/direnv"
    "common/fastfetch"
    "common/ghostty"
    "common/home"
    "common/xdg"
    "common/yazi"
    "common/activitywatch"
    "common/zsh"
    "common/xcompose"
    "dev"
    "ai"
    "graphical"
    "media"
    "sound"
    "utilities"
    "scripts/default"
  ];

  home = {
    packages = with pkgs; [
      actual-server
      anytype
      aptakube
      beeper-bridge-manager
      calcure
      dbeaver-bin
      deskflow
      discordchatexporter-desktop
      dstask
      egl-wayland
      envsubst
      exfatprogs
      fastfetch
      freelens
      gnome-calculator
      go-task
      inputs.voicemode.packages.${pkgs.system}.default
      keychain
      killall
      librechat
      pamixer
      pavucontrol
      pipes
      qbittorrent
      rizin
      scrcpy
      unstable.beeper
      cliphist
      wl-clipboard
      xournalpp
    ];

    sessionVariables = {
      DSTASK_GIT_REPO = "${config.homePath}/.config/dstask";
    };
    file = {
    };
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.tokyonight-gtk-theme.override {
        tweakVariants = ["macos"];
      };
      name = "Tokyonight-Dark";
    };
    iconTheme = {
      package = pkgs.tela-icon-theme;
      name = "Tela-black";
    };
    cursorTheme = {
      name = "macOS";
      package = pkgs.apple-cursor;
      size = 16;
    };
    font = {
      name = "SF Pro Rounded";
      size = 11;
    };
  };

  dconf.settings."org/gnome/shell/extensions/user-theme".name = "Tokyonight-Dark";

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  programs = {
  };
  home.stateVersion = "${config.version}";
}
