{
  pkgs,
  lib,
  ...
}:
pkgs.claude-code.overrideAttrs (oldAttrs: rec {
  version = "1.0.83";

  src = pkgs.fetchzip {
    url = "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-${version}.tgz";
    hash = "sha256-h6bAP6nMifQ6cfM80A1QxSYM53LYbEX1WsyPiNPby0M=";
  };

  npmDepsHash = "sha256-h6bAP6nMifQ6cfM80A1QxSYM53LYbEX1WsyPiNPby0M=";

  passthru =
    oldAttrs.passthru or {}
    // {
      updateScript = pkgs.writeShellScript "update-claude-code" ''
        set -euo pipefail

        LATEST_INFO=$(${pkgs.curl}/bin/curl -s https://registry.npmjs.org/@anthropic-ai/claude-code/latest)
        VERSION=$(echo "$LATEST_INFO" | ${pkgs.jq}/bin/jq -r '.version')
        TARBALL_URL=$(echo "$LATEST_INFO" | ${pkgs.jq}/bin/jq -r '.dist.tarball')

        TEMP_DIR=$(mktemp -d)
        ${pkgs.curl}/bin/curl -s "$TARBALL_URL" -o "$TEMP_DIR/claude-code.tgz"
        HASH=$(${pkgs.nix}/bin/nix hash file --type sha256 --base32 "$TEMP_DIR/claude-code.tgz")

        sed -i "s/version = \".*\";/version = \"$VERSION\";/" /etc/nixos/claude-code.nix
        sed -i "s/hash = \".*\";/hash = \"$HASH\";/" /etc/nixos/claude-code.nix

        rm -rf "$TEMP_DIR"
        echo "Updated claude-code to version $VERSION"
      '';
    };
})
