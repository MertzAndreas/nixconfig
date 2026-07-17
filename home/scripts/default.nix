{ pkgs, ... }:
let
  scripts = {
    run-or-raise = pkgs.writeShellScriptBin "run-or-raise" (builtins.readFile ./bin/run-or-raise);
    kitty-cwd = pkgs.writeShellScriptBin "kitty-cwd" (builtins.readFile ./bin/kitty-cwd);
    start-keyring = pkgs.writeShellScriptBin "start-keyring" (builtins.readFile ./bin/start-keyring);
  };
in
{
  home.packages = builtins.attrValues scripts;
}
