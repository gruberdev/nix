{
  config,
  pkgs,
  ...
}: {
  home.file.".config/Claude/claude_desktop_config.json".text = builtins.toJSON {
    mcpServers = {
      filesystem = {
        command = "npx";
        args = ["-y" "@modelcontextprotocol/server-filesystem" "${config.homePath}"];
        env = {
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
      };

      sequential-thinking = {
        command = "npx";
        args = ["-y" "@modelcontextprotocol/server-sequential-thinking"];
        env = {
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        autoApprove = ["sequentialthinking"];
      };

      chat-openai = {
        command = "npx";
        args = ["@pyroprompts/any-chat-completions-mcp"];
        env = {
          AI_CHAT_NAME = "OpenAI";
          AI_CHAT_MODEL = "gpt-4o";
          AI_CHAT_KEY = "$OPENAI_API_KEY";
          AI_CHAT_BASE_URL = "https://api.openai.com/v1";
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        timeout = 600;
      };

      everything = {
        command = "npx";
        args = ["-y" "@modelcontextprotocol/server-everything"];
        env = {
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        autoApprove = ["get_time"];
        timeout = 30;
      };

      kubernetes = {
        command = "npx";
        args = ["mcp-server-kubernetes"];
        env = {
          KUBECONFIG_PATH = "/home/${config.username}/.kube/config";
          SPAWN_MAX_BUFFER = "5242880";
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        autoApprove = [
          "kubectl_logs"
          "explain_resource"
          "list_api_resources"
          "ping"
          "port_forward"
          "stop_port_forward"
        ];
        timeout = 1800;
      };

      graphiti_pro = {
        command = "http";
        args = ["http://localhost:8000/mcp"];
      };

      grafana = {
        command = "npx";
        args = ["-y" "mcp-grafana"];
        env = {
          GRAFANA_URL = "http://192.168.193.6";
          GRAFANA_SERVICE_ACCOUNT_TOKEN = "$GRAFANA_SERVICE_ACCOUNT_TOKEN";
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        timeout = 300;
      };

      mongodb = {
        command = "npx";
        args = ["-y" "mongodb-mcp-server"];
        env = {
          MDB_MCP_READ_ONLY = "true";
          MDB_MCP_CONNECTION_STRING = "$MDB_MCP_CONNECTION_STRING";
          NPM_CONFIG_CACHE = "${config.homePath}/.cache/npm";
          NPM_CONFIG_PREFIX = "${config.homePath}/.local/share/npm";
        };
        timeout = 300;
      };
    };
  };

  home.packages = with pkgs; [
    nodejs_22
    python313
    python313Packages.pip
    python313Packages.uv
  ];
}
