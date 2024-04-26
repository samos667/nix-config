{username, ...}: {
  virtualisation.docker.enable = true;
  virtualisation.containerd.enable = true;
  users.extraGroups.docker.members = [username];
}
