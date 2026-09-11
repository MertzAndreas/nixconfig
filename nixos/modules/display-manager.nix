{ ... }: {
  hardware.graphics.enable = true;

  programs.niri.enable = true;

  users.users.greeter.extraGroups = [
    "video"
    "render"
  ];

  programs.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/mertz";
  };

  programs.dank-calendar = {
    enable = true;
    systemd.enable = true;
  };
}
