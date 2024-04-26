{
  age.secrets.kube-steropes = {
    file = ../../../secrets/steropes.yaml.age;
    path = "/home/sam/.kube/steropes.yaml";
    mode = "600";
    owner = "sam";
    group = "users";
  };
}
