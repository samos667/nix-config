{pkgs, ...}: {
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # networking tools
    socat # replacement of openbsd-netcat

    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    awscli2
    ssm-session-manager-plugin
    neofetch
    ffmpeg
    nixpkgs-review

    # archives
    xz
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder

    # networking tools
    dnsutils # `dig` + `nslookup`

    # misc
    cowsay
    bitwarden-cli
    restic
    kubectl
    krew
    vault
    talosctl
    istioctl
    lens
    k9s
    kubernetes-helm
    cilium-cli
    fluxcd
    kubecolor
    sops
    age
    bottom
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    fd
    bat
    screen
    opentofu
    packer
    ansible
    sshpass
    asciinema
    asciinema-agg
    lazygit
    backblaze-b2
    k8sgpt
    kustomize
    glab
    virtualenv
    httpie
    pre-commit
    pueue
    glow # markdown previewer in terminal
  ];

  programs.vifm = {
    enable = true;
    extraConfig = "set shell=${pkgs.bash}/bin/bash";
  };
}
