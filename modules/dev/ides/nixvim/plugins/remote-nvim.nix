{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      remote-nvim-nvim
    ];

    extraConfigLua = ''
      require('remote-nvim').setup({
        client_callback = function(port, workspace_config)
          local cmd = ("wezterm cli set-tab-title --pane-id $(wezterm cli get-pane-direction Down) 'Remote: %s'"):format(workspace_config.host)
          vim.fn.jobstart(cmd, {
            detach = true,
            on_exit = function(job_id, exit_code, event_type)
              -- You can add any cleanup logic here if needed
            end,
          })
        end,
        remote = {
          app_name = "nvim",
          copy_dirs = {
            config = {
              base = "$HOME/.config/nvim",
              dirs = "*",
              compression = true,
            },
            data = {
              base = "$HOME/.local/share/nvim",
              dirs = {
                "lazy",
                "mason",
                "telescope",
              },
              compression = true,
            },
            cache = {
              base = "$HOME/.cache/nvim",
              dirs = "*",
              compression = true,
            },
            state = {
              base = "$HOME/.local/state/nvim",
              dirs = "*",
              compression = true,
            },
          },
        },
        ssh_config = {
          ssh_binary = "ssh",
          scp_binary = "scp",
          ssh_config_file_paths = { "$HOME/.ssh/config" },
          ssh_prompts = {
            {
              match = "password:",
              type = "secret",
              input_prompt = "Enter password: ",
              value_type = "static",
              value = "",
            },
            {
              match = "continue connecting (yes/no/[fingerprint])?",
              type = "plain",
              input_prompt = "Do you want to continue connecting (yes/no)? ",
              value_type = "static",
              value = "yes",
            },
          },
        },
        devpod = {
          binary = "devpod",
          docker_binary = "docker",
          search_style = "current_dir_only",
          dotfiles = {
            path = "$HOME/.config/nvim",
            install_script = "#!/bin/bash\ncp -r ~/.config/nvim/* .\n",
          },
          container_list = "running_only",
        },
        log = {
          enable = true,
          max_size = 1024 * 1024 * 2,
        },
      })
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>rc";
        action = ":RemoteStart<CR>";
        options = {
          desc = "Start remote connection";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rs";
        action = ":RemoteStop<CR>";
        options = {
          desc = "Stop remote connection";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>ri";
        action = ":RemoteInfo<CR>";
        options = {
          desc = "Remote connection info";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rl";
        action = ":RemoteLog<CR>";
        options = {
          desc = "Show remote logs";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rr";
        action = ":RemoteCleanup<CR>";
        options = {
          desc = "Cleanup remote sessions";
          silent = true;
        };
      }
      # Devcontainer-specific keymaps
      {
        mode = "n";
        key = "<leader>rd";
        action = ":RemoteStart<CR>";
        options = {
          desc = "Start devcontainer from current directory";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rD";
        action = ":lua require('remote-nvim').start_container()<CR>";
        options = {
          desc = "Start devcontainer from image/container";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>rh";
        action = ":checkhealth remote-nvim<CR>";
        options = {
          desc = "Check remote-nvim health";
          silent = true;
        };
      }
    ];

    # Add which-key mappings for remote-nvim
    plugins.which-key.settings.spec = [
      {
        __unkeyed = "<leader>r";
        group = "[R]emote Development";
        mode = "n";
      }
    ];
  };
}