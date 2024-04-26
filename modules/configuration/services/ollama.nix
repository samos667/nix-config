{
  pkgs,
  system,
  ...
}: let
  ollama =
    import
    (builtins.fetchTarball {
      url = https://github.com/samos667/nixpkgs/archive/eed15a20aaac3671ad0af033aab7407a2dc0910d.tar.gz;
      sha256 = "1v0acd44r1ds5qgpw69d317mvwh8wmczfjv0gadjlismjhkwzl3w";
    })
    # reuse the current configuration
    {
      inherit system;
    };
in {
  services = {
    # open-webui.enable = true;
    ollama = {
      enable = true;
      acceleration = "rocm";
      rocmOverrideGfx = "11.0.0";
      package = pkgs.ollama;
    };
    nextjs-ollama-llm-ui = {
      enable = true;
      package = ollama.nextjs-ollama-llm-ui;
    };
  };
}
