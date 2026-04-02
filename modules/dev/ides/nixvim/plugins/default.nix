{
  pkgs,
  lib,
  ...
}: let
  modulesFilter =
    lib.filterAttrs (name: value:
      value == "regular" && name != "default.nix" && (lib.strings.hasSuffix ".nix" name));
  nixModules = builtins.attrNames (modulesFilter (builtins.readDir ./.));
in {
  imports = builtins.map (path: ./. + "/${path}") nixModules;

  programs.nixvim = {
    plugins = {
      lz-n.enable = true;
      nvim-autopairs.enable = true;
      cmake-tools.enable = true;
      comment.enable = true;
      lazygit.enable = true;
      trouble.enable = true;
      nvim-tree = {
        enable = true;
        settings = {
          view = {
            side = "left";
            width = 20;
          };
          renderer = {
            highlight_git = true;
            icons = {
              show = {
                git = true;
                folder = true;
                file = true;
                folder_arrow = true;
              };
            };
          };
          filters = {
            dotfiles = false;
          };
        };
      };
      transparent.enable = true;
      direnv.enable = true;
      image.enable = true;
      guess-indent.enable = true;
      glow.enable = true;
      twilight = {
        enable = true;
        settings = {
          dimming = {
            alpha = 0.4;
            color = ["Normal"];
            inactive = false;
          };
          context = 15;
          treesitter = true;
        };
      };
      codecompanion.enable = true;
      auto-save.enable = true;
      diffview.enable = true;
      commentary.enable = true;
      fidget.enable = true;
      dashboard.enable = true;
      markdown-preview = {
        enable = true;
        settings.theme = "dark";
      };
      fugitive.enable = true;
      repeat.enable = true;
      rustaceanvim.enable = true;
      gitsigns.enable = true;
      gitsigns.settings.current_line_blame = true;
      undotree.enable = true;
      vim-surround.enable = true;
      web-devicons.enable = true;
      colorizer.enable = true;
      which-key.enable = true;
      render-markdown = {
        enable = true;
        settings = {
          heading = {
            position = "overlay";
            icons = ["󰲡 " "󰲣 " "󰲥 " "󰲧 " "󰲩 " "󰲫 "];
            signs = ["󰫎 "];
            width = "full";
            backgrounds = [
              "RenderMarkdownH1Bg"
              "RenderMarkdownH2Bg"
              "RenderMarkdownH3Bg"
              "RenderMarkdownH4Bg"
              "RenderMarkdownH5Bg"
              "RenderMarkdownH6Bg"
            ];
            foregrounds = [
              "RenderMarkdownH1"
              "RenderMarkdownH2"
              "RenderMarkdownH3"
              "RenderMarkdownH4"
              "RenderMarkdownH5"
              "RenderMarkdownH6"
            ];
          };
          paragraph = {
            enabled = true;
            left_margin = 0;
            min_width = 0;
          };
          indent = {
            enabled = true;
            per_level = 2;
          };
          bullet = {
            enabled = true;
            icons = ["●" "○" "◆" "◇"];
            left_pad = 0;
            right_pad = 1;
            highlight = "RenderMarkdownBullet";
          };
          checkbox = {
            enabled = true;
            position = "inline";
            unchecked = {
              icon = "󰄱 ";
              highlight = "RenderMarkdownUnchecked";
            };
            checked = {
              icon = "󰱒 ";
              highlight = "RenderMarkdownChecked";
            };
            custom = {
              todo = {
                raw = "[-]";
                rendered = "󰥔 ";
                highlight = "RenderMarkdownTodo";
              };
            };
          };
          quote = {
            enabled = true;
            icon = "▎";
            repeat_linebreak = true;
            highlight = "RenderMarkdownQuote";
          };
          pipe_table = {
            enabled = true;
            preset = "round";
            style = "full";
            cell = "padded";
            alignment_indicator = "━";
            border = [
              "┌"
              "┬"
              "┐"
              "├"
              "┼"
              "┤"
              "└"
              "┴"
              "┘"
              "│"
              "─"
            ];
            head = "RenderMarkdownTableHead";
            row = "RenderMarkdownTableRow";
            filler = "RenderMarkdownTableFill";
          };
          code = {
            enabled = true;
            sign = false;
            style = "full";
            position = "left";
            language_pad = 0;
            disable_background = ["diff"];
            width = "full";
            left_pad = 0;
            right_pad = 0;
            min_width = 0;
            border = "thin";
            above = "▄";
            below = "▀";
            highlight = "RenderMarkdownCode";
            highlight_inline = "RenderMarkdownCodeInline";
          };
          dash = {
            enabled = true;
            icon = "─";
            width = "full";
            highlight = "RenderMarkdownDash";
          };
          link = {
            enabled = true;
            image = "󰥶 ";
            email = "󰀓 ";
            hyperlink = "󰌹 ";
            highlight = "RenderMarkdownLink";
            custom = {
              web = {
                pattern = "^http[s]?://";
                icon = "󰖟 ";
                highlight = "RenderMarkdownLinkUrl";
              };
            };
          };
          sign = {
            enabled = false;
          };
          latex = {
            enabled = true;
            converter = "latex2text";
            highlight = "RenderMarkdownMath";
            top_pad = 0;
            bottom_pad = 0;
          };
          win_options = {
            conceallevel = {
              default = 3;
              rendered = 3;
            };
            concealcursor = {
              default = "";
              rendered = "";
            };
          };
        };
      };

      neoscroll = {
        enable = true;
        settings = {
          hide_cursor = true;
          stop_eof = true;
          respect_scrolloff = false;
          cursor_scrolls_alone = true;
          easing = "linear";
          pre_hook = null;
          post_hook = null;
          performance_mode = false;
        };
      };

      leap.enable = true;

      arrow = {
        enable = true;
        settings = {
          show_icons = true;
          leader_key = ";";
          buffer_leader_key = "m";
          index_keys = "123456789zxcbnmqwertyuiopasdfghjklZXVBNMQWERTYUIOPASDFGHJKL";
          full_path_list = ["update_stuff"];
        };
      };

      helpview.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-tmux-navigator
      dressing-nvim
      fzf-lua
      img-clip-nvim
      mini-pick
      nvim-cmp
      plenary-nvim
      nui-nvim
      (pkgs.vimUtils.buildVimPlugin {
        name = "tidy-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "mcauley-penney";
          repo = "tidy.nvim";
          rev = "main";
          sha256 = "sha256-eqF6XQtMm2PquLTydaMbdSeeR4MlbDi/ILIfkjedUPw=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        name = "taskfile-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "dasvh";
          repo = "taskfile.nvim";
          rev = "main";
          sha256 = "sha256-D/6Fvf+RznrRNDJOwVQMf3cXxpeab7HYa6WhJXcsFow=";
        };
      })
    ];
  };
}
