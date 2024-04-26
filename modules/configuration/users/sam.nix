{pkgs, ...}: {
  users.users.sam = {
    shell = pkgs.nushell;
    initialHashedPassword = "$7$CU..../....cM.cjpSdcybWBpckxY1b90$grq57TCZ9N5gpXRech0atSYOu0Qwi4k9WRgRUOTsh53";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVxKSjXuqUwo6UMuepfWaX5Bstf4RGWkiSv92BiobS6 sam@home.lab"
    ];
    extraGroups = ["wheel"];
  };

  # Secrets "mount" #TODO swap to https://github.com/Mic92/sops-nix
  age.secrets = {
    ssh_github = {
      file = ../../../secrets/ssh_github.age;
      path = "/home/sam/.ssh/id_ed25519_github";
      mode = "600";
      owner = "sam";
      group = "users";
    };

    kube-steropes = {
      file = ../../../secrets/steropes.kube.yaml.age;
      path = "/home/sam/.kube/steropes.yaml";
      mode = "600";
      owner = "sam";
      group = "users";
    };

    kube-haki = {
      file = ../../../secrets/haki.kube.yaml.age;
      path = "/home/sam/.kube/haki.yaml";
      mode = "600";
      owner = "sam";
      group = "users";
    };

    talconfig = {
      file = ../../../secrets/talconfig.yaml.age;
      path = "/home/sam/.talos/config.yaml";
      mode = "600";
      owner = "sam";
      group = "users";
    };

    age = {
      file = ../../../secrets/age.age;
      path = "/home/sam/.age/key.txt";
      mode = "400";
      owner = "sam";
      group = "users";
    };
  };
}
