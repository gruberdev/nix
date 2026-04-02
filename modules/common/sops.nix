{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets.yaml;
    secrets = {
      gitcred = {};
      openai = {};
      anthropic = {};
      gemini = {};
      dockerhub = {};
      codeberg = {};
      sourcehut = {};
      tailscale = {};
      groq = {};
      cohere = {};
      grok = {};
      twitch = {};
      beeper = {};
      grafana = {};
      mongodb = {};
    };
    templates = {
      "gitcred".content = "${config.sops.placeholder.gitcred}";
      "openai".content = "${config.sops.placeholder.openai}";
      "anthropic".content = "${config.sops.placeholder.anthropic}";
      "gemini".content = "${config.sops.placeholder.gemini}";
      "dockerhub".content = "${config.sops.placeholder.dockerhub}";
      "codeberg".content = "${config.sops.placeholder.codeberg}";
      "sourcehut".content = "${config.sops.placeholder.sourcehut}";
      "tailscale".content = "${config.sops.placeholder.tailscale}";
      "groq".content = "${config.sops.placeholder.groq}";
      "grok".content = "${config.sops.placeholder.grok}";
      "cohere".content = "${config.sops.placeholder.cohere}";
      "twitch".content = "${config.sops.placeholder.twitch}";
      "grafana".content = "${config.sops.placeholder.grafana}";
      "mongodb".content = "${config.sops.placeholder.mongodb}";
      "claude_mcp_config.json".content = ''
        {
          "defaultModel": "claude-sonnet-4-20250514",
          "permissions": {
            "allow": [
              "mcp__sequential-thinking__*"
            ],
            "deny": [
              "rm"
            ]
          },
          "mcpServers": {
            "mcp-hub": {
              "command": "http",
              "args": ["http://localhost:3000"]
            }
          }
        }
      '';
      "mcp_hub_config.json".content = ''
        {
          "mcpServers": {
            "sequential-thinking": {
              "command": "npx",
              "args": [
                "-y",
                "@modelcontextprotocol/server-sequential-thinking"
              ]
            },
            "voice-mode": {
              "command": "nix",
              "args": [
                "run",
                "github:mbailey/voicemode",
                "--impure"
              ],
              "env": {
                "VOICEMODE_STT_BASE_URLS": "http://127.0.0.1:8080/v1/audio/transcriptions",
                "VOICEMODE_STT_MODEL": "whisper-base-en"
              }
            },
            "beeper": {
              "command": "http",
              "args": ["http://localhost:23373/v0/mcp"],
              "headers": {
                "Authorization": "Bearer ${config.sops.placeholder.beeper}"
              }
            }
          }
        }
      '';
    };
  };
}
