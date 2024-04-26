def vnix [] {
  cd /etc/nixos;
  neovide;
  cd -
}

def vgit [arg] {
  cd $'~/git/($arg)';
  neovide;
  cd -
}
