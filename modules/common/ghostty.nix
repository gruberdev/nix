{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "core-theme";
      "adjust-cell-height" = "10%";
      "window-theme" = "dark";
      "window-height" = 20;
      "window-width" = 110;

      "window-padding-x" = 5;
      "window-padding-y" = 5;
      "background-opacity" = 0.90;

      "background-blur-radius" = 0;
      "cursor-style" = "bar";
      "mouse-hide-while-typing" = true;

      keybind = [
        "alt+s>c=new_tab"
        "alt+s>shift+l=next_tab"
        "alt+s>shift+h=previous_tab"
        "alt+s>comma=move_tab:-1"
        "alt+s>period=move_tab:1"

        "alt+s>1=goto_tab:1"
        "alt+s>2=goto_tab:2"
        "alt+s>3=goto_tab:3"
        "alt+s>4=goto_tab:4"
        "alt+s>5=goto_tab:5"
        "alt+s>6=goto_tab:6"
        "alt+s>7=goto_tab:7"
        "alt+s>8=goto_tab:8"
        "alt+s>9=goto_tab:9"

        "alt+s>\\=new_split:right"
        "alt+s>-=new_split:down"
        "alt+s>j=goto_split:bottom"
        "alt+s>k=goto_split:top"
        "alt+s>h=goto_split:left"
        "alt+s>l=goto_split:right"
        "alt+s>z=toggle_split_zoom"
        "alt+s>e=equalize_splits"
      ];

      "font-size" = "${config.fontSize}";
      "font-family" = "${config.monospace}";
      title = "Ghostty";
      "wait-after-command" = false;
      "shell-integration" = "detect";
      "window-save-state" = "always";
      "gtk-single-instance" = true;
      "unfocused-split-opacity" = 0.85;
      "quick-terminal-position" = "center";
      "shell-integration-features" = "cursor,sudo";
    };

    themes = {
      "core-theme" = {
        palette = [
          "0=${config.theme.black}"
          "1=${config.theme.red}"
          "2=${config.theme.green}"
          "3=${config.theme.orange}"
          "4=${config.theme.blue}"
          "5=${config.theme.purple}"
          "6=${config.theme.cyan}"
          "7=${config.theme.white}"
          "8=${config.theme.bright-black}"
          "9=${config.theme.pink}"
          "10=${config.theme.green}"
          "11=${config.theme.yellow}"
          "12=${config.theme.blue}"
          "13=${config.theme.rose}"
          "14=${config.theme.cyan}"
          "15=${config.theme.white}"
        ];
        background = "${config.theme.background}";
        foreground = "${config.theme.foreground}";
        "cursor-color" = "${config.theme.accent}";
        "cursor-text" = "${config.theme.background}";
        "selection-background" = "${config.theme.bright-black}";
        "selection-foreground" = "${config.theme.foreground}";
      };
    };
  };
}
