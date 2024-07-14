{ config
, lib
, pkgs
, ...
}:

let
  cfg = config.shell.zsh;
  inherit (cfg) enable;
in
{
  options = {
    shell.zsh.enable = lib.mkEnableOption "zsh shell";
  };

  config = lib.mkIf enable {
    users.defaultUserShell = pkgs.zsh;

    programs.zsh.enable = true;
    environment.pathsToLink = [ "/share/zsh" ]; # Allows completion for system packages

    environment.etc."greetd/environments".text = lib.mkIf config.services.greetd.enable "zsh";
  };
}
