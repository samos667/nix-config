{
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        terraformls.enable = true;
        jsonls.enable = true;
        yamlls = {
          enable = true;
          extraOptions.settings.yaml.schemas = {
            "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.4/all.json" =
              "*.k8s.*.yaml";
            "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/kustomization-kustomize-v1.json" =
              "*.k8s.ccrd.flux.k.yaml";
            "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/ocirepository-source-v1beta2.json" =
              "*.k8s.ccrd.flux.oci.yaml";
            "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/gitrepository-source-v1.json" =
              "*.k8s.ccrd.flux.git.yaml";
            "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmchart-source-v1beta2.json" =
              "*.k8s.ccrd.flux.helmchart.yaml";
            "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrepository-source-v1beta2.json" =
              "*.k8s.ccrd.flux.helmrepo.yaml";
          };
        };
      };
      none-ls.sources.formatting.prettier.enable = true;
      # efmls-configs.setup = {
      #   yaml.formatter = "yq";
      #   json.formatter = "jq";
      # };
    };
  };
}
