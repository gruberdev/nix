{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  home.file.".config/walker/themes/dynamic-theme.css".text = ''

    @define-color background ${config.theme.background};
    @define-color surface ${config.theme.surface};
    @define-color overlay ${config.theme.overlay};
    @define-color foreground ${config.theme.foreground};
    @define-color foreground-alt ${config.theme.foreground-alt};
    @define-color muted ${config.theme.muted};
    @define-color comment ${config.theme.comment};
    @define-color accent ${config.theme.accent};
    @define-color accent-alt ${config.theme.accent-alt};
    @define-color success ${config.theme.success};
    @define-color warning ${config.theme.warning};
    @define-color error ${config.theme.error};
    @define-color cyan ${config.theme.cyan};

    #window,
    #box,
    #aiScroll,
    #aiList,
    #search,
    #password,
    #input,
    #prompt,
    #clear,
    #typeahead,
    #list,
    child,
    scrollbar,
    slider,
    #item,
    #text,
    #label,
    #bar,
    #sub,
    #activationlabel {
      all: unset;
    }

    #window {
      color: @foreground;
      background: transparent;
    }

    #box {
      background: @background;
      border-radius: 8px;
      padding: 16px;
      border: 1px solid @overlay;
      box-shadow:
        0 8px 32px rgba(${builtins.substring 1 6 config.theme.black}, 0.4),
        0 1px 0px rgba(${builtins.substring 1 6 config.theme.foreground}, 0.05) inset;
      margin: 8px;
    }

    #search {
      background: @surface;
      border-radius: 6px;
      border: 1px solid @overlay;
      padding: 8px 12px;
      margin-bottom: 8px;
      transition: all 200ms ease;
    }

    #search:focus-within {
      border-color: @accent;
      box-shadow: 0 0 0 1px @accent;
    }

    #input {
      background: transparent;
      color: @foreground;
      font-size: 14px;
      min-height: 20px;
    }

    #input placeholder {
      color: @comment;
      opacity: 0.8;
    }

    #prompt {
      color: @accent;
      margin-right: 8px;
      opacity: 0.8;
    }

    #clear {
      color: @muted;
      opacity: 0.6;
      transition: opacity 150ms ease;
    }

    #clear:hover {
      opacity: 1;
      color: @foreground;
    }

    #typeahead {
      color: @muted;
      opacity: 0.6;
    }

    #list {
      margin-top: 4px;
    }

    child {
      padding: 8px 12px;
      border-radius: 4px;
      margin: 1px 0;
      transition: all 150ms ease;
    }

    child:selected,
    child:hover {
      background: @overlay;
      border-left: 2px solid @accent;
      padding-left: 10px;
    }

    child:selected {
      background: alpha(@accent, 0.15);
    }

    #item {
      min-height: 24px;
    }

    #icon {
      margin-right: 12px;
      opacity: 0.9;
      color: @foreground-alt;
    }

    child:selected #icon,
    child:hover #icon {
      color: @accent;
      opacity: 1;
    }

    #text {
      flex: 1;
    }

    #label {
      color: @foreground;
      font-weight: 500;
      font-size: 14px;
    }

    child:selected #label {
      color: @foreground;
    }

    #sub {
      color: @muted;
      font-size: 12px;
      opacity: 0.8;
      margin-top: 2px;
    }

    child:selected #sub {
      color: @foreground-alt;
    }

    #activationlabel {
      background: @accent-alt;
      color: @background;
      font-weight: 600;
      font-size: 11px;
      padding: 2px 6px;
      border-radius: 3px;
      margin-left: 8px;
    }

    #bar {
      background: @surface;
      border-radius: 6px;
      padding: 4px;
      margin-bottom: 8px;
    }

    .barentry {
      padding: 6px 10px;
      border-radius: 4px;
      transition: background 150ms ease;
    }

    .barentry:hover {
      background: @overlay;
    }

    .barentry:selected {
      background: alpha(@accent, 0.2);
    }

    .aiItem {
      padding: 12px;
      border-radius: 6px;
      margin: 4px 0;
    }

    .aiItem.user {
      background: @overlay;
      color: @foreground;
    }

    .aiItem.assistant {
      background: @surface;
      color: @foreground-alt;
      border-left: 3px solid @cyan;
    }

    scrollbar {
      background: transparent;
      border-radius: 4px;
    }

    scrollbar slider {
      background: @comment;
      border-radius: 4px;
      min-width: 6px;
      min-height: 6px;
    }

    scrollbar slider:hover {
      background: @muted;
    }

    .activation #activationlabel {
      background: @accent;
      color: @background;
      animation: pulse 1s infinite;
    }

    .activation #text,
    .activation #icon {
      opacity: 0.6;
    }

    #cfgerr {
      background: alpha(@error, 0.2);
      color: @error;
      border: 1px solid @error;
      border-radius: 6px;
      padding: 12px;
      margin: 8px 0;
      font-size: 13px;
    }

    @keyframes pulse {
      0% { opacity: 1; }
      50% { opacity: 0.7; }
      100% { opacity: 1; }
    }

    *:focus {
      outline: none;
    }
  '';

  programs.walker = {
    enable = true;
    runAsService = true;

    config = {
      theme = "dynamic-theme";
      hotreload_theme = true;
      ignore_mouse = false;
      as_window = false;
      ui = {
        fullscreen = false;
        ignore_exclusive = false;

        anchors = {
          top = true;
          bottom = false;
          left = false;
          right = false;
        };

        window = {
          width = 600;
          height = 0;
          margins = {
            top = 100;
            bottom = 0;
            start = 0;
            end = 0;
          };
          css_classes = ["dynamic-theme"];

          box = {
            orientation = "vertical";
            spacing = 0;

            search = {
              orientation = "horizontal";

              spacing = 0;
              margins = {
                top = 0;
                bottom = 8;
                start = 0;
                end = 0;
              };

              input = {
                width = -1;
                height = 32;
                h_expand = true;
              };

              prompt = {
                text = "";
                icon = "";
                margins = {
                  top = 0;
                  bottom = 0;
                  start = 0;
                  end = 8;
                };
              };

              clear = {
                icon = "edit-clear-symbolic";
                icon_size = "normal";
                width = 24;
                height = 24;
              };
            };

            scroll = {
              overlay_scrolling = true;
              h_scrollbar_policy = "never";
              v_scrollbar_policy = "automatic";

              list = {
                always_show = false;
                grid = false;
                orientation = "vertical";
                max_height = 400;
                min_height = 0;

                item = {
                  orientation = "horizontal";
                  spacing = 0;
                  height = 40;
                  margins = {
                    top = 1;
                    bottom = 1;
                    start = 0;
                    end = 0;
                  };

                  icon = {
                    icon_size = "normal";
                    pixel_size = 20;
                    width = 20;
                    height = 20;
                    margins = {
                      top = 0;
                      bottom = 0;
                      start = 0;
                      end = 12;
                    };
                  };

                  text = {
                    orientation = "vertical";
                    spacing = 2;
                    h_expand = true;

                    label = {
                      h_align = "start";
                      v_align = "center";
                      wrap = false;
                      x_align = 0.0;
                      y_align = 0.5;
                    };

                    sub = {
                      h_align = "start";
                      v_align = "center";
                      wrap = false;
                      x_align = 0.0;
                      y_align = 0.5;
                    };
                  };

                  activation_label = {
                    overlay = false;
                    hide_modifier = false;
                    margins = {
                      top = 0;
                      bottom = 0;
                      start = 8;
                      end = 0;
                    };
                  };
                };

                placeholder = {
                  justify = "center";
                  wrap = false;
                  margins = {
                    top = 20;
                    bottom = 20;
                    start = 0;
                    end = 0;
                  };
                };
              };
            };
          };
        };
      };

      search = {
        placeholder = "Search...";
        delay = 50;
        resume_last_query = false;
      };

      list = {
        show_initial_entries = false;
        cycle = true;
      };

      activation_mode = {
        disabled = false;
        labels = "";
        use_alt = false;
        use_f_keys = false;
      };

      keys = {
        close = ["Escape"];
        next = ["Down" "Ctrl+j" "Tab"];
        prev = ["Up" "Ctrl+k" "Shift+Tab"];

        activation_modifiers = {
          keep_open = "Shift_L";
          alternate = "Ctrl_L";
        };
      };

      builtins = {
        applications = {
          enabled = true;
          activation_mode.disabled = false;
          context_aware = true;
          hide_actions_with_empty_query = true;
          history = true;
          name = "applications";
          placeholder = "Applications";
          prioritize_new = true;
          refresh = true;
          show_generic = false;
          show_icon_when_single = true;
          show_sub_when_single = false;
          weight = 5;
          max_entries = 20;
          whitelist = [
            {
              regexp = "^(Brave Browser|Zen Browser|Firefox|Chrome|Chromium).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Ghostty|Terminal|Alacritty|Kitty|Wezterm).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Spotify|Music|VLC|Audacity|OBS Studio).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Beeper|Discord|Telegram|Signal|Slack).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Files|Nemo|Nautilus|Thunar|Dolphin).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Calculator|GIMP|Inkscape|Blender|LibreOffice).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Claude Desktop|Code|VSCode|Neovim|Emacs).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(Steam|Lutris|GameMode|Heroic).*";
              label = true;
              sub = false;
            }
          ];
          blacklist = [
            {
              regexp = "^(Fcitx|Scrpy|nm-connection-editor|software-properties|gnome-text-editor).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(dconf|gconf|gsettings|systemd|polkit).*";
              label = true;
              sub = false;
            }
            {
              regexp = ".*(-settings|-config|-setup|-preferences).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(org\.gtk\.|org\.gnome\.|org\.freedesktop\.).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(assistant|help|documentation|manual).*";
              label = true;
              sub = false;
            }
          ];
        };

        websearch = {
          enabled = true;
          prefix = "/s";
          engines = [
            {
              name = "Google";
              url = "https://duckduckgo.com/?q=%s";
            }
          ];
        };

        calc = {
          enabled = true;
          prefix = "/calc";
        };

        switcher = {
          enabled = true;
          prefix = "/";
        };

        finder = {
          enabled = true;
          prefix = "~";
          dirs = ["~/"];
          exclude = [".git" "node_modules" ".cache" ".local/share/Trash"];
          exec = "nemo %s";
        };

        clipboard = {
          enabled = true;
          prefix = "/clip";
          max_entries = 20;
          exec = "cliphist list";
        };

        commands = {
          enabled = true;
          prefix = ":";

          blacklist = [
            {
              regexp = "^(rm|rmdir|dd|mkfs|fdisk).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(rm|rmdir|dd|mkfs|fdisk).*";
              label = true;
              sub = false;
            }
            {
              regexp = ".*password.*";
              label = true;
              sub = true;
            }
            {
              regexp = "^(history|fc).*";
              label = true;
              sub = false;
            }
            {
              regexp = "^(sudo|su|doas).*";
              label = true;
              sub = false;
            }
          ];

          history_blacklist = [
            {
              regexp = ".*(password|secret|key|token).*";
              label = true;
              sub = true;
            }
          ];

          min_chars = 2;

          eager_loading = false;

          history = true;
          delay = 100;
        };
      };

      modules = {
        shortcuts = {
          name = "Shortcuts";
          prefix = "/";
          entries = [
            {
              name = "🌐 Open Browser";
              description = "Launch Zen Browser";
              exec = "zen-browser";
              keywords = ["browser" "web" "zen"];
            }
            {
              name = "📁 File Manager";
              description = "Open Nemo file manager";
              exec = "nemo";
              keywords = ["files" "folder" "nemo"];
            }
            {
              name = "⚡ Terminal";
              description = "Launch Ghostty terminal";
              exec = "ghostty";
              keywords = ["terminal" "shell" "ghostty"];
            }
            {
              name = "🎵 Music Player";
              description = "Start Spotify";
              exec = "spotify";
              keywords = ["music" "spotify" "audio"];
            }
            {
              name = "💬 Chat";
              description = "Open Beeper messaging";
              exec = "beeper";
              keywords = ["chat" "message" "beeper"];
            }
            {
              name = "🔧 System Settings";
              description = "Open system configuration";
              exec = "systemctl --user restart hyprland";
              keywords = ["settings" "config" "system"];
            }
            {
              name = "🔒 Lock Screen";
              description = "Lock the desktop";
              exec = "hyprlock";
              keywords = ["lock" "security" "screen"];
            }
            {
              name = "📷 Screenshot";
              description = "Take a screenshot";
              exec = "hyprshot -m region";
              keywords = ["screenshot" "capture" "image"];
            }
          ];
        };
      };

      disabled = [
        "emojis"
        "symbols"
        "ssh"
        "dmenu"
        "runner"
        "windows"
        "xdph_picker"
        "translation"
        "bookmarks"
        "custom_commands"
      ];

      close_when_open = true;
      force_keyboard_focus = false;
    };
  };
}
