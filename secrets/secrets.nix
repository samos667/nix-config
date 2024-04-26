let
  backup = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWGx20frhtM7GLPxqPXbBT7N5tEq2QZPs8SE++70k9I";
  sam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGl0AotOGJe2PLV0vVbjxW2byH8eS/sMCFrQw14pMelP";
  workstation = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKuk6FcEbA2VGkeUGsct3Xv6tQ8eSdYU7lQURZdxqmu0";
  masterace = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHtXhgt/avPpOZJsxOcl4oj0sLkij4l3C2yBiFW2znCt";
  systems = [masterace backup workstation];
  users = [sam];
in {
  "age.age".publicKeys = users ++ systems;
  "ssh_github.age".publicKeys = users ++ systems;
  "ssh_masterace.age".publicKeys = users ++ systems;
  "ssh_workstation.age".publicKeys = users ++ systems;
  "steropes.kube.yaml.age".publicKeys = users ++ systems;
  "haki.kube.yaml.age".publicKeys = users ++ systems;
  "talconfig.yaml.age".publicKeys = users ++ systems;
}
