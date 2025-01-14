{ config, pkgs, ...}:

{
        programs.nvf = {
                enable = true;
                enableManpages = true;
                settings.vim = {
                        viAlias = true;
                        vimAlias = true;

                        globals = {
                                mapleader = '' '';
                                maplocalleader = '' '';

                                netrw_banner = 0;
                                netrw_liststyle = 3;
                        };
                };
        };
}
