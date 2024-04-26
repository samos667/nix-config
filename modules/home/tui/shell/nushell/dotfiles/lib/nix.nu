def nix-run [
  command
  --arg(-a): string
  ] {
  if ($arg | is-empty) {
    nix-shell -p $command --command $command
  } else {
   nix-shell -p $command --command $"($command) ($arg)"
  }
}

def ns [] {
  cd /etc/nixos
  git pull --rebase
  sudo nixos-rebuild switch
}
