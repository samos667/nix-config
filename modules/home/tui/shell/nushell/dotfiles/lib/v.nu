def vnix [] {
  cd /etc/nixos;
  v;
  cd -
}

def vgit [arg] {
  cd $'~/git/($arg)';
  v;
  cd -
}
