{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      enableUpdateCheck = true;

      extensions = with pkgs.vscode-extensions;
        [
          github.copilot
          kamadorueda.alejandra
          ms-vscode-remote.remote-containers
          bbenoist.nix
          esbenp.prettier-vscode
          golang.go
          pkief.material-icon-theme
          arrterian.nix-env-selector
          zhuangtongfa.material-theme
          jnoortheen.nix-ide
          shardulm94.trailing-spaces
          enkia.tokyo-night

          mhutchie.git-graph
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "code-stats-vscode";
            publisher = "riussi";
            version = "1.0.18";
            sha256 = "9UyDK588qpeMWq5OBQwXYl+9qctXIDY3qd/CtosG4TU=";
          }
          {
            name = "vscode-task";
            publisher = "task";
            version = "0.3.2";
            sha256 = "sha256-LwS3R4KkJvJvgymHL66mcPwLjhv0ZPdrLSr2olDt2nk=";
          }
          {
            name = "vscode-mcp-server";
            publisher = "JuehangQin";
            version = "0.2.0";
            sha256 = "sha256-6yfhiIkKXtcvUwAjM6wB7guKMhhyfLScr+hZzF7W7Cs=";
          }
          {
            name = "aw-watcher-vscode";
            publisher = "activitywatch";
            version = "0.5.0";
            sha256 = "sha256-OrdIhgNXpEbLXYVJAx/jpt2c6Qa5jf8FNxqrbu5FfFs=";
          }
        ];

      userSettings = {
        "window.zoomLevel" = 0.4;
        "editor.fontFamily" = "${config.monospace}";
        "editor.fontSize" = config.fontSize;
        "editor.fontWeight" = "normal";
        "editor.fontLigatures" = true;
        "editor.fontVariations" = false;
        "window.newWindowProfile" = "Default";
        "editor.renderLineHighlight" = "gutter";
        "editor.minimap.enabled" = false;
        "editor.guides.bracketPairs" = "active";
        "editor.renderWhitespace" = "all";
        "editor.stickyScroll.enabled" = false;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "phase";
        "editor.cursorStyle" = "line";
        "files.autoSave" = "onFocusChange";
        "editor.formatOnSave" = true;
        "editor.parameterHints.enabled" = false;
        "editor.bracketPairColorization.enabled" = true;
        "editor.smoothScrolling" = true;
        "editor.tabSize" = 2;
        "terminal.integrated.fontFamily" = "${config.monospace}";
        "terminal.integrated.fontSize" = config.fontSize;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorBlinking" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "terminal.integrated.gpuAcceleration" = "off";
        "terminal.integrated.rendererType" = "dom";
        "terminal.integrated.allowedLinkSchemes" = [
          "file"
          "http"
          "https"
          "mailto"
          "vscode"
          "vscode-insiders"
          "docker-desktop"
        ];
        "files.insertFinalNewline" = true;
        "files.trimTrailingWhitespace" = true;
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmPasteNative" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.fileNesting.enabled" = true;
        "explorer.fileNesting.patterns" = {
          "*.js" = "$(capture).*";
          "*.jsx" = "$(capture).*";
          "*.ts" = "$(capture).*";
          "*.tsx" = "$(capture).*";
        };
        "workbench.activityBar.location" = "hidden";
        "workbench.sideBar.location" = "left";
        "workbench.reduceMotion" = "off";
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "Tokyo Night Storm";
        "git.autofetch" = true;
        "gitConfigUser.profiles" = [
          {
            "label" = "Personal";
            "userName" = "${config.usergit}";
            "email" = "${config.usermail}";
            "selected" = true;
          }
        ];
        "git.confirmSync" = true;
        "sync.autoDownload" = true;
        "sync.autoUpload" = true;
        "sync.quietSync" = true;
        "sync.removeExtensions" = true;
        "git.openRepositoryInParentFolders" = "always";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = true;
          "markdown" = true;
          "scminput" = false;
        };
        "github.copilot.editor.enableAutoCompletions" = true;
        "svg.preview.mode" = "svg";
        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "json.validate.enable" = true;
        "json.schemas" = [
          {
            "fileMatch" = [
              "/*.stepci.json"
            ];
            "url" = "https://raw.githubusercontent.com/stepci/stepci/main/schema.json";
          }
        ];
        "yaml.completion" = true;
        "yaml.schemas" = {
          "https://raw.githubusercontent.com/stepci/stepci/main/schema.json" = "*.stepci.yml";
        };
        "extensions.ignoreRecommendations" = true;
        "update.showReleaseNotes" = false;
        "security.workspace.trust.untrustedFiles" = "open";
        "debug.console.fontSize" = config.fontSize;
        "files.eol" = "\n";
        "files.exclude" = {
          "**/.devenv" = true;
          "**/.direnv" = true;
        };
        "debug.console.fontFamily" = "${config.monospace}";
        "debug.internalConsoleOptions" = "openOnSessionStart";
      };
    };
  };
}
