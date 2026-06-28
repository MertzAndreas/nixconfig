{ pkgs, ... }: let
  scripts = {
    run-or-raise = pkgs.writeShellScriptBin "run-or-raise" (builtins.readFile ./bin/run-or-raise);
    kitty-cwd = pkgs.writeShellScriptBin "kitty-cwd" (builtins.readFile ./bin/kitty-cwd);
    start-keyring = pkgs.writeShellScriptBin "start-keyring" (builtins.readFile ./bin/start-keyring);
    launch-terminal = pkgs.writeShellScriptBin "launch-terminal" (builtins.readFile ./bin/launch-terminal);
    tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" (builtins.readFile ./bin/tmux-sessionizer);
    nix-search = pkgs.writeShellScriptBin "nix-search" (builtins.readFile ./bin/nix-search);
  };
in {
  home.packages = builtins.attrValues scripts;
}
