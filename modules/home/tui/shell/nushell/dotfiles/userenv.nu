$env.SOPS_AGE_KEY_FILE = "/home/sam/.age/key.txt"
$env.AGEBOX_PRIVATE_KEYS = $'($env.HOME)/.age/'
$env.KUBECONFIG = (ls ~/.kube/*.yaml | to json | jq '.[] | .name' | tr '\n' ':' | tr -d '"')
$env.TALOSCONFIG = $"($env.HOME)/.talos/config.yaml"
$env.EDITOR = "nvim"
$env.GIT_WORKSPACE_PATH = $'($env.HOME)/git'


source ~/.secret/env.nu
