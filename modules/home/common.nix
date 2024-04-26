{
  username,
  homeDirectory,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = username;
    homeDirectory = homeDirectory;
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Sammy Etur";
    userEmail = "sammyetur11@gmail.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
  programs.gpg.enable = true;

  programs.ssh = {
    enable = true;
    extraConfig = ''
      IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
