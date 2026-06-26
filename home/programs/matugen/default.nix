{ config, ... }:
let
  configToml = builtins.readFile ./config.toml;
  configTomlSubstituted = builtins.replaceStrings
    [ "HOME_DIR" ]
    [ config.home.homeDirectory ]
    configToml;
in {
  xdg.configFile = {
    "matugen/config.toml".text = configTomlSubstituted;
    "matugen/templates/colors.lua.template".source = ./templates/colors.lua.template;
    "matugen/templates/niri-fire-shader.kdl.template".source = ./templates/niri-fire-shader.kdl.template;
  };
}
