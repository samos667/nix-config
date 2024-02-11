{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
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
    dnsutils  # `dig` + `nslookup`

    # misc
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
    adoptopenjdk-jre-bin

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
  ];

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "samos667";
    userEmail = "samos667@k8s-ekip.cc";
  };
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host github.com
          Hostname github.com
          User git
          Port 22
          IdentityFile /home/sam/.ssh/id_ed25519-github
    '';
  };
}
