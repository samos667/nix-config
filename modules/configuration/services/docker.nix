{
  username,
  pkgs,
  ...
}: {
  virtualisation.docker.enable = true;
  virtualisation.containerd.enable = true;
  users.extraGroups.docker.members = [username];
  environment.systemPackages = [
    pkgs.kind
  ];
}
