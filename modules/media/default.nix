{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./spotify.nix
    ./obs.nix
  ];
  home.sessionVariables = {
    TWT_TOKEN = "$(cat ${config.sops.secrets.twitch.path})";
  };
  home.packages = with pkgs; [
    chatterino7
    config.programs.spicetify.spicedSpotify
    dust
    ffmpeg_7-full
    glow
    imv
    komikku
    mpc
    mpv
    playerctl
    asak
    solaar
    stremio
    twitch-chat-downloader
    twitch-hls-client
    yt-dlp
  ];
}
