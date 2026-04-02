{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./krew.nix
    ./cli.nix
    ./ide.nix
  ];
  home.packages = with pkgs; [
    k3d
    tilt
    kind
    ctlptl
    etcd_3_4
    kubebuilder
    kubeconform
    chart-testing
  ];
}
