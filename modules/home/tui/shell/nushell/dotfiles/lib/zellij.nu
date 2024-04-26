def zrf [arg] {
  zellij run --name $arg --floating -- nu -c $arg
}

def zr [arg] {
  zellij run --name $arg -- fish -c $arg
}

def ze [arg] {
  zellij edit $arg
}

def zef [arg] {
  zellij edit --floating $arg
}

def z [arg] {
  try { zellij a $arg } catch { zellij -s $arg }
}
