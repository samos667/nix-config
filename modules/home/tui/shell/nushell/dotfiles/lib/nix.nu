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

def fu [arg?: string] {
  cd /etc/nixos;
  sudo nix flake update $arg
}
