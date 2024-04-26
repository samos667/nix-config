def flux-hr-diff [branch:string] {
  overlay use ~/.venv/bin/activate.nu
  cd ~/git/cloud-gitops/
  let previous_branch = (git rev-parse --abbrev-ref HEAD)
  git switch $branch
  (
  flux-local diff helmrelease -A
  --path ./kube/clusters/
  --branch-orig main
  )
  git switch $previous_branch
}

def flux-ks-diff [branch:string] {
  overlay use ~/.venv/bin/activate.nu
  cd ~/git/cloud-gitops/
  let previous_branch = (git rev-parse --abbrev-ref HEAD)
  git switch $branch
  (
  flux-local diff kustomization -A
  --path ./kube/clusters/
  --branch-orig main
  )
  git switch $previous_branch
}
