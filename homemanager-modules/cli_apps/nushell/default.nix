{
  pkgs,
  ...
}:
{

  programs = {
    bash.initExtra = ''
      if which nu >/dev/null 2>&1 && [[ "$NONU" != "1" ]]
      then
        exec nu
      fi
    '';
    nushell = {
      enable = true;
      plugins = with pkgs.nushellPlugins; [
        formats
        polars
        semver
      ];
    };
  };
}
