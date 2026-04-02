{
  lib,
  pkgs,
  ...
}: {
  environment = {
    systemPackages = with pkgs; [
      gamemode
    ];
    sessionVariables = {
      PROTON_ENABLE_HDR = 1;
      PROTON_ENABLE_WAYLAND = 1;
      STEAM_MULTIPLE_XWAYLANDS = 1;
      STEAM_GAMESCOPE_VRR_SUPPORTED = 1;
    };
  };
  hardware.steam-hardware.enable = true;
  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks = {
        enable = true;
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        steamtinkerlaunch
      ];
      extraPackages = with pkgs; [
        mangohud
        mangojuice
        winetricks
      ];
    };
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--steam"
        "--expose-wayland"
        "--rt"
        "-W 1920"
        "-H 1080"
        "--force-grab-cursor"
        "--grab"
        "--fullscreen"
      ];
    };
  };
}
