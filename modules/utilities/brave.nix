{
  pkgs,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    commandLineArgs = [
      "--extension-mime-request-handling=always-prompt-for-install"
      "--fingerprinting-canvas-image-data-noise"
      "--fingerprinting-canvas-measuretext-noise"
      "--fingerprinting-client-rects-noise"
      "--popups-to-tabs"
      "--keep-old-history"
      "--remove-client-hints"
      "--reduced-system-info"
      "--spoof-webgl-info"
      "--disable-search-engine-collection"
      "--test-type"
      "--no-default-browser-check"
      "--enable-parallel-downloading"
      "--ozone-platform-hint=auto"
      "--brave-adblock-dev-mode"

      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
      "--enable-features=AiSettingsPageRefresh,BraveBlockScreenFingerprinting,BraveDarkModeBlock,BraveExtensionsManifestV2,BraveHistoryMoreSearchResults,BraveTorWindowsHttpsOnly,BraveWebViewRoundedCorners,DisallowDocWrittenScriptLoads,EnableFingerprintingProtectionBlocklist,ForceDark,GpuRasterization,NtpClock,OopRasterization,SmoothScrolling,SyncAutofillWalletCredentialData,TabHoverCardImages,VaapiVideoDecodeLinuxGL,VaapiVideoEncoder,VerticalTabs,VerticalTabsFloating,WindowsScrollingPersonality,ZeroCopy"
      "--disable-features=BraveAiChat,BraveAiChatContextMenuRewriteInPlace,BraveAiChatHistory,BraveAiChatOpenLeoFromBraveSearch,BraveAiChatPageContentRefine,BraveAiChatWebContentAssociationDefault,BraveAiHostSpecificDistillation,BraveAiRewriter,BraveAdsAllowedToFallbackToCustomPushNotificationAds,BraveAdsCustomPushNotificationsAds,BraveNewsFeedUpdate,BraveNewsPeek,BraveRewards,BraveRewardsAllowSelfCustodyProviders,BraveRewardsAnimatedBackground,BraveRewardsGemini,BraveRewardsNewRewardsUI,BraveRewardsPlatformCreatorDetection,BraveShowGettingStartedPage,BraveSpeedreader,BraveWalletBitcoin,BraveWalletZcash,EthereumRemoteClientNewInstalls,NativeBraveWallet,Translate,WebTorrent"
    ];
    extensions = [
      {id = "adjiklnjodbiaioggfpbpkhbfcnhgkfe";}
      {id = "aflbdmaojedofngiigjpnlabhginodbf";}
      {id = "agghbaheofcoecndkbflbnggdjcmiaml";}
      {id = "alhjppeeeklkfjecgipijppbgnmgipnh";}
      {id = "amfnaoebakgdklcahkilhjoglflgnhbm";}
      {id = "ammjkodgmmoknidbanneddgankgfejfh";}
      {id = "anlikcnbgdeidpacdbdljnabclhahhmd";}
      {
        id = "bolggfoncklhniejomgplkjcllmnonbh";
        updateUrl = "https://raw.githubusercontent.com/FilipePS/Traduzir-paginas-web/master/dist/chromium/updates.xml";
      }
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";}
      {id = "cldmemdnllncchfahbcnjijheaolemfk";}
      {id = "clngdbkpkpeebahjckkjfobafhncgmne";}
      {id = "cnjifjpddelmedmihgijeibhnjfabmlf";}
      {id = "dhdgffkkebhmkfjojejmpbldmpobfkfo";}
      {id = "dnhpnfgdlenaccegplpojghhmaamnnfp";}
      {id = "eapcedpgnlmgkigiieacngkpdjikfgci";}
      {id = "edacconmaakjimmfgnblocblbcdcpbko";}
      {id = "einpaelgookohagofgnnkcfjbkkgepnp";}
      {id = "fdpohaocaechififmbbbbbknoalclacl";}
      {id = "ffbgkjjcdkigoedjkebblclfllfoepbg";}
      {id = "fnaicdffflnofjppbagibeoednhnbjhg";}
      {id = "gebbhagfogifgggkldgodflihgfeippi";}
      {id = "hhinaapppaileiechjoiifaancjggfjm";}
      {id = "hkligngkgcpcolhcnkgccglchdafcnao";}
      {id = "hlepfoohegkhhmjieoechaddaejaokhf";}
      {id = "infppggnoaenmfagbfknfkancpbljcca";}
      {id = "jaoafjdoijdconemdmodhbfpianehlon";}
      {id = "joggkdfebigddmaagckekihhfncdobff";}
      {id = "dnakmmcpobpgknolnfoiagbmpmglnckn";}
      {id = "kdbmhfkmnlmbkgbabkdealhhbfhlmmon";}
      {id = "kefjpfngnndepjbopdmoebkipbgkggaa";}
      {id = "kekjfbackdeiabghhcdklcdoekaanoel";}
      {
        id = "lkbebcjgcmobigpeffafkodonchffocl";
        updateUrl = "https://gitflic.ru/project/magnolia1234/bpc_updates/blob/raw?file=updates.xml";
      }
      {id = "maanaljajdhhnllllmhmiiboodmoffon";}
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";}
      {id = "mpbjkejclgfgadiemmefgebjfooflfhl";}
      {id = "ndjbbmjmhjcjciogoeaiempciggmihle";}
      {id = "nfmmmhanepmpifddlkkmihkalkoekpfd";}
      {id = "nngceckbapebfimnlniiiahkandclblb";}
      {
        id = "ocaahdebbfolfmndjeplogmgcagdmblk";
        updateUrl = "https://raw.githubusercontent.com/NeverDecaf/chromium-web-store/master/updates.xml";
      }
      {id = "ombpkjoelcapenbepmgifadkgpokfgfd";}
      {id = "oncbjlgldmiagjophlhobkogeladjijl";}
      {id = "pcmpcfapbekmbjjkdalcgopdkipoggdi";}
    ];
  };
}
