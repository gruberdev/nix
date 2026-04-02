{...}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>only<CR>";
      }
      {
        mode = "n";
        key = "<F2>";
        action = "<cmd>cw<CR>";
      }
      {
        mode = "n";
        key = "<F3>";
        action = "<cmd>Git<CR>";
      }
      {
        mode = "n";
        key = "<F4>";
        action = "<cmd>CMakeBuild<CR>";
      }
      {
        mode = "n";
        key = "<F5>";
        action = "<cmd>CMakeRunTest<CR>";
      }
      {
        mode = "n";
        key = "<F6>";
        action = "<cmd>prev<CR>";
      }
      {
        mode = "n";
        key = "<F7>";
        action = "<cmd>next<CR>";
      }
      {
        mode = "n";
        key = "ä";
        action = "<C-]>";
      }
      {
        mode = "n";
        key = "ö";
        action = ":";
      }
      {
        mode = "n";
        key = "<leader>lcd";
        action = "<cmd>lcd %:p:h<CR>";
      }
      {
        mode = "n";
        key = "<leader>tn";
        action = "<cmd>tabnew<CR>";
      }
      {
        mode = "n";
        key = "<leader>to";
        action = "<cmd>tabonly<CR>";
      }
      {
        mode = "n";
        key = "<leader>tc";
        action = "<cmd>tabclose<CR>";
      }
      {
        mode = "n";
        key = "<C-b>";
        action = "<cmd>NvimTreeToggle<CR>";
      }
      {
        mode = "n";
        key = "<C-z>";
        action = "u";
        options.desc = "Undo";
      }
      {
        mode = "i";
        key = "<C-z>";
        action = "<C-o>u";
        options.desc = "Undo in insert mode";
      }
      {
        mode = "n";
        key = "<C-y>";
        action = "<C-r>";
        options.desc = "Redo";
      }
      {
        mode = "i";
        key = "<C-y>";
        action = "<C-o><C-r>";
        options.desc = "Redo in insert mode";
      }
      {
        mode = "n";
        key = "<C-f>";
        action = "/";
        options.desc = "Search";
      }
      {
        mode = "n";
        key = "<C-S-f>";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Search in files";
      }
      {
        mode = "n";
        key = "<C-p>";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Quick open file";
      }
      {
        mode = "n";
        key = "<C-s>";
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }
      {
        mode = "i";
        key = "<C-s>";
        action = "<C-o><cmd>w<CR>";
        options.desc = "Save file in insert mode";
      }
      {
        mode = "n";
        key = "<C-a>";
        action = "ggVG";
        options.desc = "Select all";
      }
      {
        mode = "n";
        key = "<C-c>";
        action = "y";
        options.desc = "Copy";
      }
      {
        mode = "v";
        key = "<C-c>";
        action = "y";
        options.desc = "Copy selection";
      }
      {
        mode = "n";
        key = "<C-v>";
        action = "p";
        options.desc = "Paste";
      }
      {
        mode = "i";
        key = "<C-v>";
        action = "<C-r>+";
        options.desc = "Paste in insert mode";
      }
      {
        mode = "n";
        key = "<C-x>";
        action = "d";
        options.desc = "Cut";
      }
      {
        mode = "v";
        key = "<C-x>";
        action = "d";
        options.desc = "Cut selection";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "yyp";
        options.desc = "Duplicate line";
      }
      {
        mode = "v";
        key = "<C-d>";
        action = "yP";
        options.desc = "Duplicate selection";
      }
      {
        mode = "n";
        key = "<C-/>";
        action = "<cmd>Commentary<CR>";
        options.desc = "Toggle comment";
      }
      {
        mode = "v";
        key = "<C-/>";
        action = "<cmd>Commentary<CR>";
        options.desc = "Toggle comment on selection";
      }
      {
        mode = "n";
        key = "<C-g>";
        action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
        options.desc = "Go to line";
      }
      {
        mode = "n";
        key = "<F12>";
        action = "<cmd>Telescope lsp_definitions<CR>";
        options.desc = "Go to definition";
      }
      {
        mode = "n";
        key = "<S-F12>";
        action = "<cmd>Telescope lsp_references<CR>";
        options.desc = "Find all references";
      }
      {
        mode = "n";
        key = "<leader>mp";
        action = "<cmd>MarkdownPreview<CR>";
        options.desc = "Start markdown preview";
      }
      {
        mode = "n";
        key = "<leader>ms";
        action = "<cmd>MarkdownPreviewStop<CR>";
        options.desc = "Stop markdown preview";
      }
      {
        mode = "n";
        key = "<leader>mt";
        action = "<cmd>MarkdownPreviewToggle<CR>";
        options.desc = "Toggle markdown preview";
      }
      {
        mode = "n";
        key = "<C-Tab>";
        action.__raw = ''
          function()
            local api = require('nvim-tree.api')
            if vim.bo.filetype == 'NvimTree' then
              -- If we're in NvimTree, move to the next window (editor)
              vim.cmd('wincmd l')
            else
              -- If we're not in NvimTree, focus it
              api.tree.focus()
            end
          end
        '';
        options.desc = "Switch between nvim-tree and editor";
      }
      {
        mode = "n";
        key = "<Down>";
        action = "gj";
        options.desc = "Down arrow movement (visual line)";
      }
      {
        mode = "n";
        key = "<Up>";
        action = "gk";
        options.desc = "Up arrow movement (visual line)";
      }
      {
        mode = "n";
        key = "<Left>";
        action = "h";
        options.desc = "Left arrow movement";
      }
      {
        mode = "n";
        key = "<Right>";
        action = "l";
        options.desc = "Right arrow movement";
      }
      {
        mode = "i";
        key = "<Down>";
        action = "<C-o>gj";
        options.desc = "Down arrow movement in insert mode";
      }
      {
        mode = "i";
        key = "<Up>";
        action = "<C-o>gk";
        options.desc = "Up arrow movement in insert mode";
      }
      {
        mode = "i";
        key = "<Left>";
        action = "<C-o>h";
        options.desc = "Left arrow movement in insert mode";
      }
      {
        mode = "i";
        key = "<Right>";
        action = "<C-o>l";
        options.desc = "Right arrow movement in insert mode";
      }
      {
        mode = ["n" "x" "o"];
        key = "s";
        action = "<Plug>(leap)";
        options.desc = "Leap to position";
      }
      {
        mode = "n";
        key = "S";
        action = "<Plug>(leap-from-window)";
        options.desc = "Leap from window";
      }
      {
        mode = "n";
        key = "<leader>ac";
        action = "<cmd>ClaudeCode<CR>";
        options.desc = "Toggle Claude Code terminal";
      }
      {
        mode = "v";
        key = "<leader>as";
        action = "<cmd>ClaudeCodeSend<CR>";
        options.desc = "Send selection to Claude";
      }
      {
        mode = "n";
        key = "<leader>ad";
        action = "<cmd>ClaudeCodeDiffAccept<CR>";
        options.desc = "Accept Claude diff";
      }
      {
        mode = "n";
        key = "<leader>ar";
        action = "<cmd>ClaudeCodeDiffDeny<CR>";
        options.desc = "Reject Claude diff";
      }
      {
        mode = "n";
        key = "<leader>tt";
        action = "<cmd>Task<CR>";
        options.desc = "Show task selector";
      }
      {
        mode = "n";
        key = "<leader>tr";
        action = "<cmd>TaskRerun<CR>";
        options.desc = "Rerun last task";
      }
      {
        mode = "n";
        key = "<leader>tl";
        action = "<cmd>TaskToggleLayout<CR>";
        options.desc = "Toggle task layout";
      }
    ];
  };
}
