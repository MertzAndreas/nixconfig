{ inputs, ... }: {
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
