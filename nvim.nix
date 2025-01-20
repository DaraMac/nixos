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

                        options = {
                                guicursor = '''';

                                number = true;
                                relativenumber = true;
                                signcolumn = ''number'';

                                mouse = ''a'';

                                # clipboard:append { 'unnamedplus' }

                                breakindent = true;

                                tabstop = 4;
                                softtabstop = 4;
                                shiftwidth = 4;
                                expandtab = true;

                                smartindent = true;

                                termguicolors = true;

                                ignorecase = true;
                                smartcase = true;

                                list = true;
                                # listchars = 

                                autowrite = true;

                                cursorline = true;

                                # setting it to a very large value just to keep it always in centre
                                scrolloff = 999;

                                hlsearch = true;

                                ruler = false;

                                # tags:append('./.tags;/')
                        };
                };
        };
}
