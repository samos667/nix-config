{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # networking tools
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    bitwarden-cli
    kubectl
    k9s
    kubernetes-helm
    cilium-cli
    kubecolor
    sops
    age

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal
  ];
}
