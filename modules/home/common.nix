{ config, ... }: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "sam";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "23.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "samos667";
    userEmail = "samos667@setur.cc";
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityFile ~/.ssh/id_ed25519
      Host github.com
          Hostname github.com
          User git
          Port 22
          IdentityFile ~/.ssh/id_ed25519_github
    '';
  };
}
