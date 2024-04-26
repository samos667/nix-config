let
  backup =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDWGx20frhtM7GLPxqPXbBT7N5tEq2QZPs8SE++70k9I";
  sam =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVxKSjXuqUwo6UMuepfWaX5Bstf4RGWkiSv92BiobS6";
  workstation =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKuk6FcEbA2VGkeUGsct3Xv6tQ8eSdYU7lQURZdxqmu0";
  masterace =
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHRhwsKc1fwMbjHqIT4iu1i8ifDBUPx8oO3TD3obwOrO";
  systems = [ masterace backup workstation ];
  users = [ sam ];
in {
  "ssh_github.age".publicKeys = users ++ systems;
  "ssh_masterace.age".publicKeys = users ++ systems;
  "ssh_workstation.age".publicKeys = users ++ systems;
  "sops_steropes.age".publicKeys = users ++ systems;
  "talconfig.age".publicKeys = users ++ systems;
  "steropes.yaml.age".publicKeys = users ++ systems;
}
