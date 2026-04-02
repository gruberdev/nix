{
  pkgs,
  config,
  ...
}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs; [
      obs-studio-plugins.obs-backgroundremoval
      obs-studio-plugins.obs-composite-blur
      obs-studio-plugins.obs-shaderfilter
      obs-studio-plugins.wlrobs
      obs-studio-plugins.obs-pipewire-audio-capture
      obs-studio-plugins.obs-gstreamer
      obs-studio-plugins.obs-source-record
      obs-studio-plugins.obs-source-clone
      obs-studio-plugins.obs-webkitgtk
      obs-studio-plugins.obs-replay-source
      obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };
}
