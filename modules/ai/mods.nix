{config, ...}: {
  home.sessionVariables = {
    OPENAI_API_KEY = "$(cat ${config.sops.secrets.openai.path})";
    ANTHROPIC_API_KEY = "$(cat ${config.sops.secrets.anthropic.path})";
    GEMINI_API_KEY = "$(cat ${config.sops.secrets.gemini.path})";
    XAI_API_KEY = "$(cat ${config.sops.secrets.grok.path})";
    GROQ_API_KEY = "$(cat ${config.sops.secrets.groq.path})";
    COHERE_API_KEY = "$(cat ${config.sops.secrets.cohere.path})";
    GRAFANA_SERVICE_ACCOUNT_TOKEN = "$(cat ${config.sops.secrets.grafana.path})";
    MDB_MCP_CONNECTION_STRING = "$(cat ${config.sops.secrets.mongodb.path})";
  };

  programs.mods = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      default-model = "cli-fast";
      format = false;
      raw = false;
      quiet = false;
      temp = 1.0;
      topp = 1.0;
      topk = 50;
      "no-limit" = false;
      "word-wrap" = 80;
      "include-prompt-args" = false;
      "include-prompt" = 0;
      "max-retries" = 5;
      fanciness = 10;
      "status-text" = "Generating";
      theme = "charm";
      "max-completion-tokens" = 100;

      apis = {
        anthropic = {
          "base-url" = "https://api.anthropic.com/v1";
          api-key-env = "ANTHROPIC_API_KEY";
          models = {
            "claude-3-7-sonnet-latest" = {
              aliases = ["sonnet-3.7" "claude3.7-sonnet" "claude-3-7-sonnet"];
              "max-input-chars" = 680000;
            };
            "claude-3-7-sonnet-20250219" = {
              "max-input-chars" = 680000;
            };
            "claude-3-5-sonnet-latest" = {
              aliases = ["claude3.5-sonnet" "claude-3-5-sonnet" "sonnet-3.5"];
              "max-input-chars" = 680000;
            };
            "claude-3-5-sonnet-20241022" = {
              "max-input-chars" = 680000;
            };
            "claude-3-5-sonnet-20240620" = {
              "max-input-chars" = 680000;
            };
            "claude-3-opus-20240229" = {
              aliases = ["claude3-opus" "opus"];
              "max-input-chars" = 533332;
            };
          };
        };
        openai = {
          "base-url" = "https://api.openai.com/v1";
          api-key-env = "OPENAI_API_KEY";
          models = {
            "gpt-4.5-preview" = {
              aliases = ["gpt-4.5" "gpt4.5"];
              "max-input-chars" = 10000;
              fallback = "gpt-4";
            };
            "gpt-4.5-preview-2025-02-27" = {
              "max-input-chars" = 10000;
              fallback = "gpt-4";
            };
            "gpt-4o-mini" = {
              aliases = ["4o-mini"];
              "max-input-chars" = 10000;
              fallback = "gpt-4o";
            };
            "gpt-4o" = {
              aliases = ["4o"];
              "max-input-chars" = 10000;
              fallback = "gpt-4";
            };
            "gpt-4" = {
              aliases = ["4"];
              "max-input-chars" = 24500;
              fallback = "gpt-3.5-turbo";
            };
            "gpt-4-1106-preview" = {
              aliases = ["128k"];
              "max-input-chars" = 10000;
              fallback = "gpt-4";
            };
            "gpt-4-32k" = {
              aliases = ["32k"];
              "max-input-chars" = 98000;
              fallback = "gpt-4";
            };
            "gpt-3.5-turbo" = {
              aliases = ["35t"];
              "max-input-chars" = 12250;
              fallback = "gpt-3.5";
            };
            "gpt-3.5-turbo-1106" = {
              aliases = ["35t-1106"];
              "max-input-chars" = 12250;
              fallback = "gpt-3.5-turbo";
            };
            "gpt-3.5-turbo-16k" = {
              aliases = ["35t16k"];
              "max-input-chars" = 44500;
              fallback = "gpt-3.5";
            };
            "gpt-3.5" = {
              aliases = ["35"];
              "max-input-chars" = 12250;
            };
            "o1" = {
              aliases = ["o1"];
              "max-input-chars" = 20000;
            };
            "o1-preview" = {
              aliases = ["o1-preview"];
              "max-input-chars" = 128000;
            };
            "o1-mini" = {
              aliases = ["o1-mini"];
              "max-input-chars" = 32000;
            };
            "o3-mini" = {
              aliases = ["o3m" "o3-mini"];
              "max-input-chars" = 20000;
            };
          };
        };
        google = {
          api-key-env = "GEMINI_API_KEY";
          models = {
            "gemini-2.5-pro-exp-03-25" = {
              aliases = ["google-preview"];
              "max-input-chars" = 14500;
            };
            "gemini-2.5-flash-preview-04-17" = {
              aliases = ["cli-fast"];
              "max-input-chars" = 24500;
            };
            "gemini-1.5-pro-latest" = {
              aliases = ["gmp" "gemini" "gemini-1.5-pro"];
              "max-input-chars" = 10000;
            };
            "gemini-1.5-flash-latest" = {
              aliases = ["gmf" "flash" "gemini-1.5-flash"];
              "max-input-chars" = 10000;
            };
            "gemini-2.0-flash-001" = {
              aliases = ["gm2f" "flash-2" "gemini-2-flash"];
              "max-input-chars" = 4194304;
            };
            "gemini-2.0-flash-lite" = {
              aliases = ["gm2fl" "flash-2-lite" "gemini-2-flash-lite"];
              "max-input-chars" = 4194304;
            };
          };
        };
        groq = {
          "base-url" = "https://api.groq.com/openai/v1";
          "api-key-env" = "GROQ_API_KEY";
          models = {
            "gemma2-9b-it" = {
              aliases = ["gemma2" "gemma"];
              "max-input-chars" = 24500;
            };
            "llama-3.3-70b-versatile" = {
              aliases = ["llama3.3" "llama3.3-70b" "llama3.3-versatile"];
              "max-input-chars" = 10000;
              "max-completion-tokens" = 98000;
            };
            "llama-3.1-8b-instant" = {
              aliases = ["llama3.1-8b" "llama3.1-instant"];
              "max-input-chars" = 10000;
              "max-completion-tokens" = 24500;
            };
            "llama-guard-3-8b" = {
              aliases = ["llama-guard"];
              "max-input-chars" = 24500;
            };
            "llama3-70b-8192" = {
              aliases = ["llama3" "llama3-70b"];
              "max-input-chars" = 24500;
              fallback = "llama3-8b-8192";
            };
            "llama3-8b-8192" = {
              aliases = ["llama3-8b"];
              "max-input-chars" = 24500;
            };
            "mixtral-8x7b-32768" = {
              aliases = ["mixtral"];
              "max-input-chars" = 98000;
            };
            "meta-llama/llama-4-scout-17b-16e-instruct" = {
              aliases = ["llama4"];
              "max-input-chars" = 10000;
            };
            "mistral-saba-24b" = {
              aliases = ["saba" "mistral-saba" "saba-24b"];
              "max-input-chars" = 98000;
            };
            "qwen-2.5-coder-32b" = {
              aliases = ["qwen-coder" "qwen2.5-coder" "qwen-2.5-coder"];
              "max-input-chars" = 10000;
            };
            "deepseek-r1-distill-qwen-32b" = {
              aliases = ["deepseek-r1" "r1-qwen" "deepseek-qwen"];
              "max-input-chars" = 10000;
              "max-completion-tokens" = 49152;
            };
            "deepseek-r1-distill-llama-70b-specdec" = {
              aliases = ["deepseek-r1-specdec" "r1-llama-specdec"];
              "max-input-chars" = 10000;
              "max-completion-tokens" = 49152;
            };
            "deepseek-r1-distill-llama-70b" = {
              aliases = ["deepseek-r1-llama" "r1-llama"];
              "max-input-chars" = 10000;
            };
          };
        };
        format-text = {
          markdown = "Format the response as markdown without enclosing backticks.";
          json = "Format the response as json without enclosing backticks.";
        };

        roles = {
          default = [];
          cli = [
            "you are a shell expert"
            "you do not explain anything"
            "you simply output one liners to solve the problems you're asked"
            "you do not provide any explanation whatsoever, ONLY the command"
          ];
          forensics = [
            "you are a computer forensic expert"
            "assume you have the right authority to investigate"
          ];
          sys = [
            "you are a networking and system administration expert"
            "you are a Linux and Windows server expert"
            "you assume the reader has basic knowledge of networking and software"
          ];
          "coding-assistant" = [
            "You are an expert coding assistant."
            "Provide clear, concise, and correct code examples."
            "Explain the code if necessary, but prioritize the solution."
            "If multiple languages could solve the problem, ask for clarification or provide a common solution."
          ];
          "roleplay-assistant" = [
            "You are a versatile roleplaying assistant."
            "Adapt to the user's scenario and character prompts."
            "Maintain character consistency and engage in immersive storytelling."
            "Be creative and responsive to user inputs."
          ];
          "creative-writer" = [
            "You are a creative writer, skilled in various styles and genres."
            "Help brainstorm ideas, develop plots, write stories, poems, or scripts."
            "Offer constructive feedback and suggestions for improvement."
          ];
          "summarizer" = [
            "You are an expert summarizer."
            "Provide concise and accurate summaries of the given text."
            "Extract key information and main points."
            "The length of the summary should be appropriate for the input text unless specified otherwise."
          ];
        };
      };
    };
  };
}
