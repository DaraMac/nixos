{ config, pkgs, ...}:

{
        programs.nvf = {
                enable = true;
                enableManpages = true;
                settings.vim = {
                        viAlias = true;
                        vimAlias = true;
                };
        };
}
