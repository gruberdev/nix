{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = lib.imports [
    ./homebrew.nix
    "common/nix"
    "common/packages"
  ];
  system = {
    stateVersion = 5;
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = false;

      dock = {
        autohide = true;
        tilesize = 34;
        orientation = "right";
        show-recents = false;
        static-only = true;
        mineffect = "scale";
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        NewWindowTarget = "Other";
        NewWindowTargetPath = "file:///Users/${config.username}/";
      };

      trackpad = {
        Clicking = false;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false;
        "com.apple.sound.beep.feedback" = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;

        InitialKeyRepeat = 15;
        KeyRepeat = 3;

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      CustomUserPreferences = {
        ".GlobalPreferences" = {
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          WebKitDeveloperExtras = true;
          "com.apple.mouse.linear" = true;
        };
        "com.apple.Terminal" = {
          "FocusFollowsMouse" = true;
        };
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "64" = {enabled = false;};
            "65" = {enabled = false;};

            "34" = {enabled = false;};
            "35" = {enabled = false;};

            "36" = {enabled = false;};

            "60" = {enabled = false;};
            "61" = {enabled = false;};
          };
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
          _FXSortFoldersFirst = true;
          FXDefaultSearchScope = "SCcf";
          _FXSortFoldersFirstOnDesktop = true;
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0;
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0;
          StandardHideDesktopIcons = 0;
          HideDesktop = 0;
          StageManagerHideWidgets = 1;
          StandardHideWidgets = 1;
        };
        "com.apple.screensaver" = {
          askForPassword = 1;
          askForPasswordDelay = 0;
        };
        "com.apple.screencapture" = {
          location = "~/Pictures/Screenshots";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.HIToolbox" = {
          AppleFnUsageType = 0;
        };
        "com.apple.ImageCapture".disableHotPlug = true;

        "com.apple.CloudSubscriptionFeatures" = {
          optIn = false;
        };
      };

      loginwindow = {
        LoginwindowText = "${config.username}-toolbox";
        GuestEnabled = false;
        SHOWFULLNAME = false;
      };
    };

    keyboard = {
      enableKeyMapping = true;

      remapCapsLockToControl = false;
      remapCapsLockToEscape = true;

      swapLeftCommandAndLeftAlt = false;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
