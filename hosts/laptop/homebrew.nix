{
  config,
  lib,
  ...
}: {
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    masApps = {
      HiddenBar = 1452453066;
      OneThing = 1604176982;
    };

    taps = [
      "nikitabobko/tap"
    ];

    brews = [
      "mas"
      "displayplacer"
    ];

    casks = [
      "insomnia"
      "raycast"
      "ghostty"
      "spotify"
      "iina"
      "cursor"
      "docker"
    ];
  };
}
