{ config, pkgs, ...}:

{
    programs.nvf = {
        enable = true;
        enableManpages = true;
        settings.vim = {
            viAlias = true;
            vimAlias = true;

            keymaps = [
            {
                key = ''<Space>'';
                mode = [''n'' ''v''];
                action = ''<Nop>'';
            }
            {
                key = ''<Esc>'';
                mode = ''n'';
                action = ''<cmd>nohlsearch<CR>'';
            }
            ];

            globals = {
                mapleader = '' '';
                maplocalleader = '' '';

                netrw_banner = 0;
                netrw_liststyle = 3;
            };

            useSystemClipboard = true;


            options = {
                guicursor = '''';

                number = true;
                relativenumber = true;
                signcolumn = ''number'';

                mouse = ''a'';


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
                listchars = ''tab:» ,trail:·,nbsp:␣'';

                autowrite = true;

                cursorline = true;

                # setting it to a very large value just to keep it always in centre
                scrolloff = 999;

                hlsearch = true;

                ruler = false;


                # TODO: Check if this works without being append
                tags = ''./.tags;/'';
                # vim.opt.tags:append('./.tags;/')
            };
        };
    };
}
