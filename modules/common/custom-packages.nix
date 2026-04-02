{
  config,
  lib,
  pkgs,
  ...
}: {
  options.customPackages = {
    enable = lib.mkEnableOption "custom packages";

    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = with pkgs; [
        aptakube
      ];
      description = "List of custom packages to install";
    };
  };

  config = lib.mkIf config.customPackages.enable {
    home.packages = config.customPackages.packages;
  };
}
