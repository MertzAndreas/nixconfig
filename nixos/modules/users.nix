{ pkgs, ... }: {
  users.users."mertz" = {
    isNormalUser = true;
    description = "Andreas Mertz";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  programs.zsh.enable = true;
}
