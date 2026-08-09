{
  config,
  lib,
  pkgs,
  ...
}:

{
  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconfig/home/niri/config.kdl";

  home.activation.validateNiriConfig = lib.hm.dag.entryBefore [ "writeBoundary" ] ''
    ${pkgs.niri}/bin/niri validate \
      --config "${config.home.homeDirectory}/nixconfig/home/niri/config.kdl"
  '';
}
