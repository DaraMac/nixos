{ config, pkgs, ...}:

{
    programs.nvf = {
        enable = true;
        enableManpages = true;
        settings.vim = {
            viAlias = true;
            vimAlias = true;

            theme = {
                enable = true;
                name = "tokyonight";
                style = "night";
            };

            lsp.enable = true;

            clipboard = {
                enable = true;
                registers = "unnamedplus";
            };

            # add vim.opt.clipboard:append("unnamedplus")' in luaConfigRC
            luaConfigRC.basic = /* lua */ ''
                vim.api.nvim_create_autocmd('TextYankPost', {
                    desc = 'Highlight when yanking (copying) text',
                    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
                    callback = function()
                        vim.highlight.on_yank()
                    end
                })
            '';

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
                {
                    key = ''-'';
                    mode = ''n'';
                    # action = ''vim.cmd.Ex'';
                    action = ''<cmd>Explore<CR>'';
                    desc = ''Switch to file browser'';
                }
                {
                    key = ''J'';
                    mode = ''n'';
                    action = ''mjJ`j'';
                    desc = ''Join a line while retaining cursor position'';
                }
            ];

            globals = {
                # I guess these were already set somewhere?
                # mapleader = '' '';
                # maplocalleader = '' '';

                netrw_banner = 0;
                netrw_liststyle = 3;
            };

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

            languages = {
                enableTreesitter = true;
                enableFormat = true;

                assembly.enable = true;
                bash.enable = true;
                clang.enable = true;
                css.enable = true;
                html.enable = true;
                java.enable = true;
                lua.enable = true;
                markdown.enable = true;
                nix.enable = true;
                python.enable = true;
                r.enable = true;
                ts.enable = true;

            };

            telescope = {
                enable = true;
            };

            autocomplete.nvim-cmp = {
                enable = true;
            };

            # TODO: test
            # NOTE: here
            # FIXME: Fix!
            notes.todo-comments = {
                enable = true;
                mappings.telescope = ''<leader>st'';
            };

            notes.obsidian = {
                enable = true;
                setupOpts = {

                    daily_notes = {
                        date_format = ''%Y/Days/%Y-%m-%d-%a'';
                        folder = ''Diary'';
                    };

                    workspaces = [
                        {
                            name = ''wiki'';
                            path = ''~/Documents/wiki'';
                        }
                    ];

                    ui.enable = false;
                    disable_frontmatter = true;
                };
            };
        };
    };
}
