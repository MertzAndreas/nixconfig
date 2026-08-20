{ pkgs, ... }:
let
  scripts = {
    run-or-raise = pkgs.writeShellScriptBin "run-or-raise" (builtins.readFile ./bin/run-or-raise);
    kitty-cwd = pkgs.writeShellScriptBin "kitty-cwd" (builtins.readFile ./bin/kitty-cwd);
  };
in
{
  home.packages = builtins.attrValues scripts;
}
