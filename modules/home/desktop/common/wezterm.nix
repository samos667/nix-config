{
  inputs,
  pkgs,
  ...
}: {
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    extraConfig = ''
      local act = wezterm.action
      local config = wezterm.config_builder()
      config.keys = {

      }
      config.leader = { key = 'Space', mods = 'CTRL|ALT' }
      config.disable_default_key_bindings = true
      config.enable_tab_bar = false
      config.keys = {

        {
          key = 'h',
          mods = 'LEADER',
          action = wezterm.action.ActivatePaneDirection 'Left',
        },
        {
          key = 'j',
          mods = 'LEADER',
          action = wezterm.action.ActivatePaneDirection 'Down',
        },
        {
          key = 'k',
          mods = 'LEADER',
          action = wezterm.action.ActivatePaneDirection 'Up',
        },
        {
          key = 'l',
          mods = 'LEADER',
          action = wezterm.action.ActivatePaneDirection 'Right',
        },

        { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
        { key = 'c', mods = 'CTRL',
          action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection'},
        { key = 'C', mods = 'CTRL',
          action = act.SendKey { key = 'c', mods = 'CTRL' }},
        {
          key = '<',
          mods = 'CTRL',
          action = act.PaneSelect {
            alphabet = 'qsdfazerwxcvjklmuiopghtybn',
          },
        },
      }
      return config
    '';
  };
}
