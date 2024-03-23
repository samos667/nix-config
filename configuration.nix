{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/virtualisation/proxmox-lxc.nix")
  ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

  users.users.sam = {
    isNormalUser = true;
    home = "/home/sam";
    extraGroups = ["wheel"];
    description = "sam";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAJzb59KOgc9ldoJgsvH7eiE5BkIQQN059Cst0QYlFRN sam@DESKTOP-1SJKPJE"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDxT3VVL61Juhpl/ffT4HU7+DQfbEGOGlqRyqrSJQQNHRfferPK2IT2p+aY4+XtqgoW3uw5cecpMAFOYCcGBA3fOQfw10nEE+JUfbeIoFRhpl5c4m9kBHuAj3427ROP6u9YYNvPol2xhjWEWLoHPk8Pvm5SvJEOyLXJ9YRs2HM+9KWTwFmfPdTXKss86UvSPG2PBF/gUooiyaXHUGzDpEdcwEeexwjPm7L+RkB7Nm63L6id8Dwohzm/Idp89PbJ4WJgSKp3zDIAmu7/OZzaGxYf6p5Vrps3VQxatU6/JzRxVXj13Nx06pdv2XdEU/pcsCuVNdIH6Akm3X139L2tMvKL root@pve"
    ];
  };
}
