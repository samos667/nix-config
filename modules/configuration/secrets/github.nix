{
  age.secrets.ssh_github = {
    file =  ../../../secrets/ssh_github.age;
    path = "/home/sam/.ssh/id_ed25519_github";
    mode = "600";
    owner = "sam";
    group = "users";
  };
}
