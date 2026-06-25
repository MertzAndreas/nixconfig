{ ... }: {
  hardware.graphics.enable = true;

  programs.niri.enable = true;

  users.users.greeter.extraGroups = [ "video" "render" ];

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/mertz";
  };
}
