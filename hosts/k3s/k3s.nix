{ pkgs, ... }:

{

  networking.firewall.allowedTCPPorts = [
    22
    80
    443
    6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    # 2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    # 2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  ];
  networking.firewall.allowedUDPPorts = [
    # 8472 # k3s, flannel: required if using multi-node for inter-node networking
  ];
  services.k3s.enable = true;
  services.k3s.role = "server";
  services.k3s.extraFlags = toString [
    "--flannel-backend none --disable-network-policy --disable=traefik --disable=local-storage --cluster-cidr=10.66.0.0/16 --service-cidr=10.67.0.0/16 --disable=servicelb --disable-kube-proxy"
  ];
  environment.systemPackages = [ pkgs.k3s ];
}
