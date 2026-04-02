{
  pkgs,
  config,
  lib,
  ...
}: let
  nvimSkipModules = [
    "avante.providers.azure"
    "avante.providers.copilot"
    "avante.providers.gemini"
    "avante.providers.ollama"
    "avante.providers.vertex_claude"
    "avante.providers.vertex"
  ];
  avanteMain = pkgs.vimPlugins.avante-nvim.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "yetone";
      repo = "avante.nvim";
      rev = "adae032f5fbc611d59545792d3c5bb1c9ddc3fdb";
      sha256 = "sha256-v99yu5LvwdmHBcH61L6JIqjQkZR8Lm2fR/uzQZNPo38=";
    };
    version = "2025-05-10";
    dependencies = with pkgs.vimPlugins; [
      copilot-lua
      dressing-nvim
      fzf-lua
      img-clip-nvim
      mini-pick
      nui-nvim
      nvim-cmp
      nvim-treesitter
      nvim-web-devicons
      plenary-nvim
      telescope-nvim
    ];
  });
in {
  programs.nixvim = {
    plugins = {
      avante = {
        enable = true;
        lazyLoad.enable = true;
        lazyLoad.settings.cmd = [
          "AvanteAsk"
          "AvanteBuild"
          "AvanteChat"
          "AvanteEdit"
          "AvanteFocus"
          "AvanteRefresh"
          "AvanteSwitchProvider"
          "AvanteShowRepoMap"
          "AvanteToggle"
        ];
        settings = {
          provider = "claude";

          claude.api_key_name = "ANTHROPIC_API_KEY";
          claude.endpoint = "https://api.anthropic.com";
          claude.model = "claude-3-7-sonnet-20250219";
          claude.temperature = 0.7;
          claude.max_tokens = 20000;

          copilot.model = "claude-3.5-sonnet";
          copilot.temperature = 0.3;
          copilot.max_tokens = 20000;

          vendors = rec {
            copilot37 = {
              model = "claude-3.7-sonnet";
              __inherited_from = "copilot";
            };
            grok =
              groq
              // {
                api_key_name = "XAI_API_KEY";
                model = "grok-2-latest";
                endpoint = "https://api.x.ai/v1";
              };
            groq = {
              api_key_name = "GROQ_API_KEY";
              __inherited_from = "openai";
              endpoint = "https://api.groq.com/openai/v1";
              model = "llama-3.3-70b-versatile";
              max_tokens = 32768;
            };
            local-deepseeg =
              local-qwen
              // {
                model = "deepseek-r1:1.5b";
              };
            local-qwen = {
              api_key_name = "";
              __inherited_from = "openai";
              endpoint = "http://localhost:11434/v1";
              model = "qwen2.5-coder";
              temperature = 0;
              max_tokens = 4096;
            };
          };
        };
      };

      copilot-lua.enable = true;
      copilot-lua.settings.suggestion.enabled = false;
      copilot-lua.settings.panel.enabled = false;

      windsurf-nvim.enable = false;
    };
  };
}
