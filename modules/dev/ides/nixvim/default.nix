{inputs, ...}: {
  imports = [
    ./keymaps.nix
    ./options.nix
    ./plugins
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
    clipboard.register = "unnamedplus";

    extraConfigLua = ''
      -- Make nvim-tree transparent to match terminal
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Set nvim-tree background to be transparent
          vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "NONE" })
        end,
      })


      -- Setup tidy.nvim
      require('tidy').setup()

      -- Setup taskfile.nvim
      require('taskfile').setup({
        layout = "horizontal",
        windows = {
          output = {
            width = 0.8,
            height = 0.8,
            border = "rounded"
          }
        }
      })


    '';

    colorschemes = {
      tokyonight = {
        enable = true;
        settings = {
          integrations.treesitter = true;
          transparent = true;
          style = "night";
        };
      };
    };
  };
}
