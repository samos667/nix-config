def --env cdg [arg?: string] {
  cd $env.GIT_WORKSPACE_PATH

  if ($arg | is-empty) {
    cd (
         fd -t d -H -E .git '.*' -x sh -c 'test -d "$1/.git" && echo "$1/"' sh {}
         | fzf
       )

  } else {

    cd (
         fd -t d -H -E .git $'.*($arg).*' -x sh -c 'test -d "$1/.git" && echo "$1/"' sh {}
         | ^sort | head -n 1
       )

  }
  ls
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
