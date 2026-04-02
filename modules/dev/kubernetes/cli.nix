{
  pkgs,
  inputs,
  ...
}: {
  home.shellAliases = {
    k = "kubectl";
    kg = "kubectl get";
    kgp = "kubectl get pods";
    kgd = "kubectl get deployments";
    kgy = "kubectl get -o yaml";
    kgpw = "kubectl get pods -o wide";
    d = "docker";
    dr = "docker run";
    dps = "lazydocker";
    kga = "kubectl get all";
    kgaa = "kubectl get all --all-namespaces";
    ka = "kubectl apply -f";
    kd = "kubectl describe";
    kdl = "kubectl delete";
    ke = "kubectl edit";
    kls = "kubectl logs";
    kex = "kubectl exec";
    kx = "kubectx";
    kn = "kubens";
    knc = "kubens -c";
    kc = "kubectl create";
    hi = "helm upgrade --install";
    ht = "helm template";
    dryrun = "kustomize build --enable-helm | kubectl apply --dry-run=client -f -";
    kdeploy = "kustomize build --enable-helm | kubectl apply -f -";
    t = "talosctl";
    talos = "talosctl";
  };

  home.packages = with pkgs; [
    k9s
    argo
    ctop

    ktop
    kdash
    skopeo
    dive
    kubetui
    kubeseal
    fluxcd
    argocd
    upbound
    vcluster
    istioctl
    talosctl
    kustomize
    terraform
    lazydocker
    cilium-cli
    argo-rollouts
    kustomize-sops
    crossplane-cli
    docker-compose
    kubernetes-helm
    inputs.nur.legacyPackages.${pkgs.system}.repos.robinovitch61.kl # Improved Log viewer
    inputs.nur-macropower.packages.${pkgs.system}.kat # Rule-based rendering engine for manifests
  ];
}
