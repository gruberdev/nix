#!/usr/bin/env bash

set -euo pipefail
rm -rf ~/.npm/_npx/ || true
echo "Setting up npm global directories..."
mkdir -p ~/.local/share/npm/{lib/node_modules,bin}
export NPM_CONFIG_PREFIX=~/.local/share/npm
export PATH=~/.local/share/npm/bin:$PATH
echo "Setting NPM_CONFIG_PREFIX environment variable..."
echo "Backing up old Claude config..."
if [ -f ~/.config/Claude/claude_desktop_config.json ]; then
    cp ~/.config/Claude/claude_desktop_config.json ~/.config/Claude/claude_desktop_config.json.backup
fi
