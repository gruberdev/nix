{
  pkgs,
  lib,
  ...
}: let
  # Claude Code Neovim plugin
  claudecode-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "claudecode-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "coder";
      repo = "claudecode.nvim";
      rev = "HEAD";
      sha256 = "sha256-RnMcLYjffkK4ImJ1eKrVzNRUQKD9uo0o84Tf+/LxFbM=";
    };
  };

in {
  programs.nixvim = {
    extraPlugins = [
      claudecode-nvim
      pkgs.vimPlugins.snacks-nvim
    ];

    extraConfigLua = ''
      require('claudecode').setup({
        -- Basic configuration
      })
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>cc";
        action = ":ClaudeCode<CR>";
        options = {
          desc = "Open Claude Code";
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<leader>cc";
        action = ":ClaudeCode<CR>";
        options = {
          desc = "Send selection to Claude Code";
          silent = true;
        };
      }
    ];

    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>c";
        group = "[C]laude Code";
        mode = ["n" "v"];
      }
    ];
  };
}