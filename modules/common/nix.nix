{
  config,
  inputs,
  lib,
  system,
  ...
}: {
  time.timeZone = "${config.tz}";
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops.age.keyFile = "${config.homePath}/.config/sops/age/keys.txt";
  sops.defaultSopsFile = ../../secrets.yaml;

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];
    settings.trusted-users = ["root" config.username];

    settings.substituters = [
      "https://cache.nixos.org/"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://walker.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://devenv.cachix.org"
    ];

    settings.trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];

    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath =
      lib.mapAttrsToList (name: value: "${name}=${value}")
      (lib.filterAttrs (_: value: value ? _type && value._type == "flake") inputs);

    gc = {
      automatic = true;
      dates = lib.mkIf (system != "aarch64-darwin") "weekly";
      options = "--delete-older-than 14d";
    };

    optimise.automatic = true;
  };
}
