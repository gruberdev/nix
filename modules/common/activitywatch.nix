{
  pkgs,
  lib,
  config,
  ...
}: {
  services.activitywatch = {
    enable = true;
    package = pkgs.aw-server-rust;
    watchers = {
      aw-watcher-afk = {
        package = pkgs.activitywatch;
        settings = {
          timeout = 300;
          poll_time = 2;
        };
      };

      aw-watcher-window = {
        package = pkgs.activitywatch;
        settings = {
          poll_time = 1;
        };
      };

      aw-watcher-web = {
        package = pkgs.activitywatch;
      };

      aw-watcher-input = {
        package = pkgs.activitywatch;
      };

      awatcher = {
        package = pkgs.awatcher;
        settings = {
          idle-timeout-seconds = 180;
          poll-time-idle-seconds = 10;
          poll-time-window-seconds = 5;
        };
      };
    };
  };
}
