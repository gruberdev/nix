{
  lib,
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.mangohud.enable = true;
  programs.steam = {
    enable = true;
    extest.enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };
  home.packages = with pkgs; [
    gamescope
    mangohud
    gamemode
  ];
}
