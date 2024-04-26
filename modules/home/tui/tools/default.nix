{ pkgs, ... }: {
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    trivy
    drawio
    httpie
    pre-commit
    # networking tools
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc # it is a calculator for the IPv4/v6 addresses

    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    nnn # terminal file manager

    # archives
    xz
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils # `dig` + `nslookup`

    # misc
    zellij
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
    wezterm
    screen
    terraform
    ansible
    sshpass
    asciinema
    asciinema-agg
    lazygit

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
  ];
}
