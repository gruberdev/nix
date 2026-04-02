{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.krewfile.homeManagerModules.krewfile
  ];
  home.packages = with pkgs; [
    kubectl
    stern
    kubie
  ];
  programs.krewfile = {
    enable = true;
    krewPackage = pkgs.krew;
    plugins = [
      "ai"
      "ns"
      "mc"
      "ctx"
      "kor"
      "ctr"
      "ice"
      "aks"
      "neat"
      "cnpg"
      "ktop"
      "warp"
      "tree"
      "blame"
      "stern"
      "ttsum"
      "minio"
      "plogs"
      "wider"
      "image"
      "pexec"
      "track"
      "allctx"
      "whoami"
      "status"
      "cilium"
      "tunnel"
      "rolesum"
      "explore"
      "history"
      "kopilot"
      "volsync"
      "openebs"
      "cautious"
      "outdated"
      "topology"
      "who-can"
      "pod-logs"
      "discover"
      "unlimited"
      "revisions"
      "pv-migrate"
      "evict-pod "
      "browse-pvc"
      "split-yaml"
      "rename-pvc"
      "crashwatch"
      "permissions"
      "kuota-calc"
      "deprecations"
      "service-tree"
      "resource-backup"
      "modify-secret"
      "argo-apps-viz"
      "access-matrix"
      "unused-volumes"
      "gke-credentials"
      "view-allocations"
      "kluster-capacity"
      "colorize-applied"
      "rm-standalone-pods"
    ];
    upgrade = true;
    krewRoot = "${config.home.homeDirectory}/.krew";
  };
}
