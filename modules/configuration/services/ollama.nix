{
  services = {
    open-webui.enable = true;
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}
