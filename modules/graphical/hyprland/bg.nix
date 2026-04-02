{
  config,
  pkgs,
  ...
}: {
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
        sensitivity = 35;
        bar_width = 6;
        sleep_timer = 10;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
        bars = 200;
        bar_spacing = 1;
      };
      smoothing = {
        noise_reduction = 85;
        integral = 85;
        gravity = 200;
        ignore = 0;
      };
      input = {
        method = "pipewire";
        source = "auto";
      };
      output = {
        waveform = 0;
        show_idle_bar_heads = 0;
        alacritty_sync = 0;
        bar_height = 20;
        bar_spacing = 1;
        orientation = "bottom";
        channels = "mono";
      };
      color = {
        gradient = 1;
        gradient_count = 6;
        gradient_color_1 = "'${config.theme.black}'";
        gradient_color_2 = "'${config.theme.accent}'";
        gradient_color_3 = "'${config.theme.muted}'";
        gradient_color_4 = "'${config.theme.warning}'";
        gradient_color_5 = "'${config.theme.yellow}'";
        gradient_color_6 = "'${config.theme.error}'";
      };
    };
  };

  wayland.windowManager.hyprland.settings.windowrulev2 = [
    ''opacity 0.5 0.5,class:^(kitty-panel)$''
    ''opacity 0.5 0.5,class:^(cava)$''
  ];
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      ''opacity 0.5 0.5,class:^(kitty-panel)$''
      ''opacity 0.5 0.5,class:^(cava)$''
    ];
  };
  systemd.user.services."cava-panel" = {
    Unit = {
      Description = "cava";
      After = ["hyprland-session.target"];
      PartOf = ["hyprland-session.target"];
    };
    Service = {
      Type = "exec";
      ExecStart = "${pkgs.kitty}/bin/kitten panel --name kitty-panel --class kitty-panel --edge=background -o background_opacity=0.0 ${pkgs.cava}/bin/cava";
      Restart = "on-failure";
      RestartSec = "5s";
      Slice = "app-graphical.slice";
    };
    Install = {
      WantedBy = ["hyprland-session.target"];
    };
  };
}
