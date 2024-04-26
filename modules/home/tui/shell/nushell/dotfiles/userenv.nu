$env.SOPS_AGE_KEY_FILE = /home/sam/.credentials/sops_steropes.age
$env.SOPS_AGE_RECIPIENTS = age1430al9hlrscfugjgpyexe0se3wsc2l6aqsu55tah47h42r6pwpcsu9vf52

$env.KUBECONFIG = (ls ~/.kube/*.yaml | to json | jq '.[] | .name' | tr '\n' ':' | tr -d '"')
