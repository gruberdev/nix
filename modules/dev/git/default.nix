{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./lazygit.nix
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  home.packages = with pkgs; [
    pre-commit
    gh
    gitleaks
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = config.username;
    userEmail = config.usermail;

    extraConfig = {
      init = {
        defaultBranch = "main";
        commit.gpgsign = true;
        user.signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      };
      core.autocrlf = "input";
      user.signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      color.ui = "auto";
      signing = {
        signByDefault = true;
      };
      credential.helper = "${pkgs.git}/libexec/git-core/git-credential-store --file ${config.sops.templates."gitcred".path}";
      push.autoSetupRemote = true;
      pull.rebase = false;
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
    };

    ignores = [
      ".direnv"
      ".cache"

      ".DS_Store"
      "ehthumbs.db"
      "Icon?"
      "Thumbs.db"

      "*~"
      "*.swp"
      "*.swo"

      ".history"

      ".task"
    ];

    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };

    aliases = {
      d = "diff";
      dc = "diff --cached";
      ds = "diff --staged";
      br = "branch";
      co = "checkout";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      r = "restore";
      rs = "restore --staged";
      st = "status -sb";
      ca = "commit -am";
      amend = "commit --amend -m";

      update = "submodule update --init --recursive";
      foreach = "submodule foreach";
    };
  };
}
