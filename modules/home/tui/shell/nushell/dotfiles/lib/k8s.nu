# Display decoded secret
def kgs [
  --namespace(-n): string
  --secret(-s): string
  ] {
  if ($namespace | is-empty) {
    cecho -dc green "Pick namespace and then secret name to decode it";
    let $namespace = $'(kubectl get namespaces -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --height 100%)';
    let $secret = $'(kubectl get secrets -n $namespace -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --height 100%)';
    echo $"command: kubectl get secret -n ($namespace) ($secret) -o yaml | yq '.data | map_values \(@base64d\)'";
    kubectl get secret -n $namespace $secret -o yaml | yq '.data | map_values(@base64d)'

  } else {
    echo $"command: kubectl get secret -n ($namespace) ($secret) -o yaml | yq '.data | map_values \(@base64d\)'";
    kubectl get secret -n $namespace $secret -o yaml | yq '.data | map_values(@base64d)'
  }
}
# short alias to set namespace
def ksn [arg] {
  try { kubectl config set-context --curent --namespace $arg } catch { kubectl config view --minify | grep namespace | cut -d" " -f6 }
}

# switch context with pickable list
def kc [--ctx(-c): string] {
  if ($ctx | is-empty) {
    let $ctx = $"(kubectl config view -o jsonpath='{.contexts[*].name}' | sed 's/ /\n/g' | fzf --height 100%)";
    try  { kubectl config use-context $ctx } catch { kubectl config current-context }
  } else {
    try  { kubectl config use-context $ctx } catch { kubectl config current-context }
  }
}

# # port-forward
# def kpfs [
#   arg
#   --namespace(-n): string
#   --cible(-c): string
#   --local-port(-l): string
#   --remote-port(-r): string
#   ] {
#   let $namespace = $'(kubectl get namespaces -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --height 100%)';
#   let $cible = $'(kubectl get svc -n $namespace -o jsonpath="{.items[*].metadata.name}" | tr " " "\n" | fzf --height 100%)';
#   echo $'kubectl port-forward ($namespace)/($cible) -n ($namespace) ($arg)';
#   $'kubectl port-forward ($namespace)/($cible) -n ($namespace) ($arg)'
# }
