{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    package = pkgs.zsh;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history = {
      ignoreAllDups = true;
      path = "${config.xdg.dataHome}/zsh/history";
      save = 10000;
      size = 10000;
      share = true;
    };
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "loiccoyle/zsh-github-copilot";}
        {name = "zsh-users/zsh-completions";}
      ];
    };
    plugins = [
      {
        name = "zsh-z";
        src = "${pkgs.zsh-z}/share/zsh-z";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [];
      theme = "";
    };
    loginExtra = ''
      if [ -z "$DISPLAY" ] && [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
    initContent = ''
      fpath+=(${pkgs.pure-prompt}/share/zsh/site-functions)
      autoload -U promptinit; promptinit
      prompt pure
      source "${pkgs.zplug}/share/zplug/init.zsh";
      if ! zplug check --verbose; then
        zplug install
      fi
      zplug load;

      if [[ "$TERM" == "xterm-ghostty" ]]; then
        export TERM="xterm-256color"
      fi
      sudo-command-line() {
        [[ -z $BUFFER ]] && zle up-history
        if [[ $BUFFER != sudo\ * ]]; then
          BUFFER="sudo $BUFFER"
          zle end-of-line
        fi
      }
      zle -N sudo-command-line
      bindkey -M emacs '^[^[' sudo-command-line
      bindkey -M viins '^[^[' sudo-command-line

      eval "$(keychain --agents ssh --eval id_ed25519 2>/dev/null)" >/dev/null

      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
    '';
  };

  home.shellAliases = {
    c = "bat";
    vim = "nvim";
    vi = "nvim";
    n = "nvim";
    v = "nvim";
    g = "git";
    lsd = "eza -l --git -T --hyperlink --header";
    gb = "git branch";
    gl = "git log";
    ga = "git add";
    gs = "git status";
    gc = "git checkout";
    gpl = "git pull --rebase";
    lg = "lazygit";
    cld = "claude --append-system-prompt '$(cat $HOME/.config/Claude/autoplan.txt)' --model claude-sonnet-4-20250514 --ide";
    android = "scrcpy --video-codec=h265 -m1920 --max-fps=60 --no-audio -K";
    nixs = "nix-search --max-results 40 --name";
    ask = "nix run github:sadjow/claude-code-nix";
    chat = "iamb";
    matrix = "iamb";
    code = "nvim";
    todo = "dstask sync && clear && dstask";
    tadd = "dstask add";
    tdo = "dstask";
    tlist = "dstask list";
  };
  home.file.".zshenv" = {
    text = ''
      export DSTASK_GIT_REPO="$HOME/.config/dstask"
    '';
  };
}
