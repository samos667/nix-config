### General
alias cdn = cd /etc/nixos
alias cds = cd ~/Sync
alias v = nvim
alias d = docker
alias dc = docker compose

### Nixos
alias nt = sudo nixos-rebuild test
alias ns = sudo nixos-rebuild switch
alias fr = nix flake update

### Kubernetes
alias k = kubectl
alias kg = kubectl get
alias kd = kubectl describe
alias kD = kubectl delete
alias ka = kubectl apply
alias kaf = kubectl apply -f
alias kp = kubectl proxy --port=8080
alias kn = k9s -A

### Git
alias lg = lazygit
alias gp = git pull
alias gP = git push
alias ga = git add
alias gaa = git add .
alias gcp = git checkout -b
alias gsb = git switch

### Python
alias venv = overlay use .venv/bin/activate.nu
