{
  pkgs,
  config,
  inputs,
  ...
}: let
  package = config.boot.kernelPackages.nvidiaPackages.beta;
in {
  boot.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
  boot.blacklistedKernelModules = ["nouveau"];

  boot.kernelParams = [
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    "nvidia-drm.modeset=1"
    "initcall_blacklist=simpledrm_platform_driver_init"
    "nvidia-drm.fbdev=1"
    "module_blacklist=amdgpu"
  ];
  services.xserver.videoDrivers = ["nvidia"];

  nixpkgs.overlays = [inputs.nvidia-patch.overlays.default];

  hardware = {
    nvidia-container-toolkit.enable = true;
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = false;
      nvidiaSettings = false;
      package = pkgs.nvidia-patch.patch-nvenc (pkgs.nvidia-patch.patch-fbc package);
    };
  };
  nixpkgs.config.cudaSupport = true;
  environment.sessionVariables = {
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    DISABLE_QT5_COMPAT = "0";
    GDK_BACKEND = "wayland,x11,*";
    LIBVA_DRIVER_NAME = "nvidia";
    ANKI_WAYLAND = "1";
    DIRENV_LOG_FORMAT = "";
    WLR_DRM_NO_ATOMIC = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    DISABLE_QT_COMPAT = "0";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WLR_BACKEND = "vulkan";
    WLR_RENDERER = "vulkan";
    XDG_SESSION_TYPE = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    WLR_DRM_DEVICES = "/dev/dri/card0";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    MESA_DISK_CACHE_SINGLE_FILE = "1";
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    DXVK_STATE_CACHE = "1";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    NVD_BACKEND = "direct";
    NIXOS_OZONE_WL = "1";
    MOX_ENABLE_WAYLAND = "1";
    GBM_BACKEND = "nvidia-drm";
    VDPAU_DRIVER = "va_gl";
    MOZ_ENABLE_WAYLAND = "1";
    ELECTRON_DISABLE_GPU = "true";
  };
  environment.systemPackages = with pkgs; [
    egl-wayland
    nvidia-system-monitor-qt
    cudaPackages.cudatoolkit
  ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      libva
      libva-utils
      xorg.libxcb
      libvdpau-va-gl
    ];
  };
}
