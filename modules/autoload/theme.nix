{
  config,
  lib,
  ...
}:
with lib; {
  options = {
    theme = mkOption {
      type = types.attrs;
      description = "Universal color palette based on custom dark theme";
    };
  };

  config = {
    theme = {
      background = "#00120B";
      surface = "#00140D";
      overlay = "#0F4044";

      foreground = "#E3E2E7";
      foreground-alt = "#75878A";
      muted = "#3A435A";
      comment = "#3A435A";

      accent = "#1FFFB0";
      accent-alt = "#4CE7B4";

      success = "#1FFFB0";
      warning = "#FAC1B4";
      error = "#F74D77";
      info = "#0F4044";

      cyan = "#1FFFEC";
      purple = "#956dca";
      pink = "#F74D77";
      orange = "#FAC1B4";
      yellow = "#FFEBAD";
      green = "#4CE7B4";
      blue = "#63DAFC";
      red = "#F74D77";
      rose = "#FAC1B4";

      black = "#00120B";
      bright-black = "#0F4044";
      white = "#42A0A8";
      bright-white = "#1FFFEC";

      dim = "#0F4044";
      subtle = "#00140D";

      background-alpha = "rgba(16, 19, 25, 0.12)";
      surface-alpha = "rgba(23, 27, 36, 0.95)";
      overlay-alpha = "rgba(58, 67, 90, 0.95)";

      blue-transparent = "#27c9b5";
      cyan-transparent = "#1FFFEC";
      green-transparent = "#4CE7B4";
      yellow-transparent = "#FFEBAD";
      red-transparent = "#F74D77";
      purple-transparent = "#956dca80";
    };
  };
}
