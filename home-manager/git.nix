{
    pkgs, lib, ...
}:
{
    programs = {
        git = {
            enable = true;
            userEmail = "DaraMac@users.noreply.github.com";
            userName = "dmac";
            extraConfig = {
                core.editor = "nvim";
                diff.algorithm = "histogram";
                init.defaultBranch = "main";
                log.date = "iso";
                merge.conflictstyle = "diff3";
                merge.tool = "nvimdiff";
                pull.rebase = "true";
                push.autoSetupRemote = "true";
            };
        };
    };
}
