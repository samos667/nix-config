def cdg [arg] {
  cd $'~/git/($arg)';
}

def gac [arg] {
  git add .;
  git commit -am $arg
}

def gacp [arg] {
  git add .;
  git commit -am $arg;
  git push
}

def gg [arg] {
  cd ~/git;
  git clone $arg
}
