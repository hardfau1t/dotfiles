{ ... }:
{
  programs.git = {
    enable = true;
    includes = [ { path = "~/.config/git/local"; } ];
    aliases = {
      c = "commit";
      ca = "commit --amend";
      cae = "commit --amend --no-edit";
      d = "diff";
      ds = "diff --staged";
      l = "log --oneline";
      lg = "log --graph --decorate --oneline";
      p = "pull";
      r = "rebase";
      ri = "rebase -i";
      s = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = "true";
      pull.rebase = "true";

    };
  };
}
