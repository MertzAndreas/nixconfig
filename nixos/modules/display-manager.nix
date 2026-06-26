{ ... }: {
  hardware.graphics.enable = true;

  programs.niri.enable = true;

  # Disabled in favor of DankMaterialShell's built-in polkit agent
  # See: https://danklinux.com/docs/dankmaterialshell/nixos-flake#polkit-agent
  systemd.user.services.niri-flake-polkit.enable = false;

  users.users.greeter.extraGroups = [
    "video"
    "render"
  ];

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/mertz";
  };
}
