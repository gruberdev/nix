{...}: {
  programs.nixcord = {
    config = {
      plugins = {
        accountPanelServerProfile = {
          enable = true;
          prioritizeServerProfile = true;
        };

        betterFolders = {
          enable = true;
          sidebar = false;
          sidebarAnim = false;
          closeAllFolders = true;
          closeAllHomeButton = false;
          closeOthers = true;
          forceOpen = false;
          keepIcons = false;
          showFolderIcon = "always";
        };

        silentTyping = {
          enable = true;
          showIcon = true;
          contextMenu = true;
        };

        typingIndicator = {
          enable = true;
          includeCurrentChannel = false;
          includeMutedChannels = false;
        };
        noOnboardingDelay.enable = true;
        typingTweaks.enable = true;
        clearURLs.enable = true;
        platformIndicators.enable = true;
        pinDMs = {
          enable = true;
          pinOrder = "custom";
        };
        unlockedAvatarZoom.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        fullSearchContext.enable = true;
        messageLogger = {
          enable = true;
          deleteStyle = "text";
          ignoreBots = true;
          ignoreSelf = true;
          ignoreUsers = "";
          ignoreChannels = "";
          ignoreGuilds = "";
          logEdits = true;
          logDeletes = true;
          collapseDeleted = false;
          inlineEdits = true;
        };
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
        customIdle = {
          enable = true;
        };
        openInApp = {
          enable = true;
          spotify = true;
          steam = true;
          epic = true;
          tidal = true;
          itunes = true;
        };
        anonymiseFileNames = {
          enable = true;
          anonymiseByDefault = true;
        };
        shikiCodeblocks.enable = true;
        fixSpotifyEmbeds.enable = true;
        betterSettings.enable = true;
        relationshipNotifier.enable = true;
        disableCallIdle.enable = true;
        voiceMessages.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
        };
      };
    };
    dorion = {
      sysTray = true;
      blur = "acrylic";
      openOnStartup = true;
      autoClearCache = true;
      disableHardwareAccel = false;
      rpcServer = true;
      rpcProcessScanner = true;
      pushToTalk = true;
      pushToTalkKeys = ["RControl"];
      desktopNotifications = true;
      unreadBadge = true;
    };
  };
}
