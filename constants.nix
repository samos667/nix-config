rec {
  # user information
  username = "sam";
  userfullname = "Sammy ETUR";
  useremail = "s@k8s-ekip.cc";

  allSystemAttrs = {
    # linux systems
    x64_system = "x86_64-linux";
    aarch64_system = "aarch64-linux";
  };
  allSystems = builtins.attrValues allSystemAttrs;
}
