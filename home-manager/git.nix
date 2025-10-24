{
    pkgs, lib, ...
}:
{
    programs = {
        git = {
            enable = true;
            settings.user.email = "DaraMac@users.noreply.github.com";
            settings.user.name = "dmac";
            settings = {
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
