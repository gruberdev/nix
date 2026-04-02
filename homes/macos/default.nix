{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    "common/alacritty"
    "common/direnv"
    "common/fastfetch"
    "common/git"
    "common/home"
    "common/lazygit"
    "common/vscode"
    "common/xdg"
    "common/yazi"
    "common/obsidian"
    "common/zsh"
    "darwin/aerospace"
  ];

  home = {
    packages = with pkgs; [
      brave
      hyperfine
      nerdfetch
      oath-toolkit
      tldr
      httpie
      shellcheck
    ];

    sessionVariables = {
      HOMEBREW_PREFIX = "/opt/homebrew";
      HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
      HOMEBREW_REPOSITORY = "/opt/homebrew";
      INFOPATH = "/opt/homebrew/share/info:''${INFOPATH:-}";

      PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:$PATH";

      LDFLAGS = "-L/opt/homebrew/lib";
      CPPFLAGS = "-I/opt/homebrew/include";
    };

    file = {
      ".hushlogin".text = "";
    };
  };

  programs = {
    zsh.initContent = ''
      fpath+="/opt/homebrew/share/zsh/site-functions"

    '';
  };

  home.stateVersion = "${config.version}";
}
