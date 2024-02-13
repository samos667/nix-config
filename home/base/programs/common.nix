{ config, pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # archives
    zip
    unzip
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
      Host 172.16.66.200
          Hostname 172.16.66.200
          User sam
          Port 22
          IdentityFile /home/sam/.ssh/id_ed25519-workstation

    '';
  };
}
