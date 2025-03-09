{pkgs, ...}: {
  imports = [
    ./hardware-config.nix
    ../../modules/configuration/common.nix
    ../../modules/configuration/services/docker.nix
    ../../modules/configuration/localization/baguette.nix
    # ../../modules/configuration/users/sam.nix # It's me :) #TODO make secret mount optionnable depending the host
  ];

  services.openssh.enable = true;

  users.users.sam = {
    shell = pkgs.nushell;
    initialHashedPassword = "$7$CU..../....cM.cjpSdcybWBpckxY1b90$grq57TCZ9N5gpXRech0atSYOu0Qwi4k9WRgRUOTsh53";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVxKSjXuqUwo6UMuepfWaX5Bstf4RGWkiSv92BiobS6 sam@home.lab"
    ];
    extraGroups = ["wheel"];
  };
}
