{
    pkgs, lib, ...
}:
{
# filetype specific options
home.file = {
    "markdown" = {
        target = ".config/nvim/after/ftplugin/markdown.lua";
        text = "vim.opt_local.spell = true";
    };

    "latex" = {
        target = ".config/nvim/after/ftplugin/tex.lua";
        text = "vim.opt_local.spell = true";
    };

    "plaintex" = {
        target = ".config/nvim/after/ftplugin/plaintex.lua";
        text = "vim.opt_local.spell = true";
    };
};
programs = {
    neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        plugins = with pkgs.vimPlugins; [
            Coqtail
            catppuccin-nvim
            cmp-nvim-lsp
            cmp-path
            cmp_luasnip
            luasnip
            nvim-cmp
            nvim-dap
            nvim-highlight-colors
            nvim-jdtls
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            obsidian-nvim
            telescope-nvim
            todo-comments-nvim
        ];

        # NOTE: The comment will allow the LSP and Treesitter to work in the string
        initLua = /* lua */ ''

            vim.cmd.colorscheme 'catppuccin-macchiato'

            vim.g.mapleader = ' '
            vim.g.maplocalleader = ' '
            vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

            vim.opt.guicursor = ""

            vim.opt.number = true
            vim.opt.relativenumber = true
            vim.opt.signcolumn = "number"

            vim.opt.mouse = 'a'

            vim.opt.clipboard:append { 'unnamedplus' }

            vim.opt.breakindent = true

            vim.opt.tabstop       = 4
            vim.opt.softtabstop   = 4
            vim.opt.shiftwidth    = 4
            vim.opt.expandtab     = true

            vim.opt.smartindent   = true

            vim.opt.termguicolors = true

            vim.opt.ignorecase    = true
            vim.opt.smartcase     = true

            vim.opt.list          = true
            vim.opt.listchars     = { tab = '» ', trail = '·', nbsp = '␣' }

            vim.opt.autowrite     = true

            vim.opt.cursorline    = true

            -- Setting it to a very large value to just keep it always in centre
            vim.opt.scrolloff     = 999

            vim.opt.hlsearch      = true
            vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

            vim.opt.ruler = false

            vim.g.netrw_banner = 0
            vim.g.netrw_liststyle = 3

            vim.opt.tags:append('./.tags;/')

            vim.api.nvim_create_autocmd('TextYankPost', {
                desc = 'Highlight when yanking (copying) text',
                group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
                callback = function()
                    vim.highlight.on_yank()
                end
            })

            -- remap.lua
            -- keymappings
            vim.keymap.set('n', '-', '<cmd>Explore<CR>', { desc = 'Switch to file browser' })

            vim.keymap.set('n', 'J', 'mjJ`j', { desc = 'Join a line while retaining cursor position' })

            -- plugins

            -- telescope

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles,      { desc = "[S]earch Recent Files ('.' for repeat)" })
            vim.keymap.set('n', '<leader>sc', builtin.commands,      { desc = '[S]earch [C]ommands' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics,   { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files,    { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep,     { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sh', builtin.help_tags,     { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sj', builtin.jumplist,      { desc = '[S]earch [J]umplist' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps,       { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sr', builtin.resume,        { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin,       { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>',  { desc = '[S]earch [T]odos' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string,   { desc = '[S]earch current [W]ord' })

            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 0,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })


            -- todo-comments
            require("todo-comments").setup()


            -- obsidian
            require("obsidian").setup {
                -- A list of workspace names, paths, and configuration overrides.
                -- If you use the Obsidian app, the 'path' of a workspace should generally be
                -- your vault root (where the `.obsidian` folder is located).
                -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
                -- the workspace to the first workspace in the list whose `path` is a parent of the
                -- current markdown file being edited.
                workspaces = {
                    {
                        name = "notes",
                        path = "~/College/notes",
                        overrides = {
                            templates = {
                                folder = "Meta/Templates"
                            }
                        }
                    },
                    {
                        name = "wiki",
                        path = "~/Documents/wiki",
                        overrides = {
                            templates = {
                                folder = "Templates"
                            }
                        }
                    }
                },

                ui = {
                    enable = false
                },
                checkbox = {
                    order = { " ", "x"}
                },
                daily_notes = {
                    folder = "Diary",
                    date_format = "%Y/Days/%Y-%m-%d-%a",
                    default_tags = {},
                    template = "Daily Note.md"
                },
                frontmatter = {
                    enabled = false
                },
                legacy_commands = false,
                footer = {
                    enabled = false,
                }
            }


            -- lsp
            vim.lsp.enable('basedpyright')
            vim.lsp.enable('bashls')
            vim.lsp.enable('cssls')
            vim.lsp.enable('hls')
            vim.lsp.enable('html')
            vim.lsp.enable('jdtls')
            vim.lsp.enable('jsonls')
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('nil_ls')

            vim.lsp.config('hls', {
                filetypes = { 'haskell', 'lhaskell', 'cabal' },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    -- We create a function that lets us more easily define mappings specific
                    -- for LSP related items. It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc)
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    -- Jump to the definition of the word under your cursor.
                    --  This is where a variable was first declared, or where a function is defined, etc.
                    --  To jump back, press <C-t>.
                    map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

                    -- Find references for the word under your cursor.
                    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

                    -- Jump to the implementation of the word under your cursor.
                    --  Useful when your language has ways of declaring types without an actual implementation.
                    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

                    -- Jump to the type of the word under your cursor.
                    --  Useful when you're not sure what type a variable is and you want to see
                    --  the definition of its *type*, not where it was *defined*.
                    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

                    -- Fuzzy find all the symbols in your current document.
                    --  Symbols are things like variables, functions, types, etc.
                    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

                    -- Fuzzy find all the symbols in your current workspace.
                    --  Similar to document symbols, except searches over your entire project.
                    map(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )

                    -- Rename the variable under your cursor.
                    --  Most Language Servers support renaming across files, etc.
                    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

                    -- Execute a code action, usually your cursor needs to be on top of an error
                    -- or a suggestion from your LSP for this to activate.
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                    -- Opens a popup that displays documentation about the word under your cursor
                    --  See `:help K` for why this keymap.
                    map("K", vim.lsp.buf.hover, "Hover Documentation")

                    -- WARN: This is not Goto Definition, this is Goto Declaration.
                    --  For example, in C this would take you to the header.
                    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

                    -- The following two autocommands are used to highlight references of the
                    -- word under your cursor when your cursor rests there for a little while.
                    --    See `:help CursorHold` for information about when this is executed
                    --
                    -- When you move your cursor, the highlights will be cleared (the second autocommand).
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.document_highlight,
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references,
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
                            end,
                        })
                    end

                    -- The following autocommand is used to enable inlay hints in your
                    -- code, if the language server you are using supports them
                    --
                    -- This may be unwanted, since they displace some of your code
                    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
                        map("<leader>th", function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end, "[T]oggle Inlay [H]ints")
                    end
                end,
            })

            -- nvim-dap
            vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "DAP: Toggle [B]reakpoint"})
            vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "DAP: [C]ontinue"})
            vim.keymap.set("n", "<leader>dC", require("dap").run_to_cursor, { desc = "DAP: Run to [C]ursor"})
            vim.keymap.set("n", "<leader>dT", require("dap").terminate, { desc = "DAP: [T]erminate"})


            -- treesitter
            require'nvim-treesitter'.setup {
                highlight = {
                    enable = true
                }
            }


            -- nvim-highlight-colors
            require('nvim-highlight-colors').setup({})


            -- nvim-cmp
            -- See `:help cmp`
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})

            -- LSP servers and clients are able to communicate to each other what features they support.
            --  By default, Neovim doesn't support everything that is in the LSP specification.
            --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
            --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())


            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = "menu,menuone,noinsert" },

                -- For an understanding of why these mappings were
                -- chosen, you will need to read `:help ins-completion`
                --
                -- No, but seriously. Please read `:help ins-completion`, it is really good!
                mapping = cmp.mapping.preset.insert({
                    -- Select the [n]ext item
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    -- Select the [p]revious item
                    ["<C-p>"] = cmp.mapping.select_prev_item(),

                    -- Scroll the documentation window [b]ack / [f]orward
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),

                    -- Accept ([y]es) the completion.
                    --  This will auto-import if your LSP supports it.
                    --  This will expand snippets if the LSP sent a snippet.
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),

                    -- If you prefer more traditional completion keymaps,
                    -- you can uncomment the following lines
                    --['<CR>'] = cmp.mapping.confirm { select = true },
                    --['<Tab>'] = cmp.mapping.select_next_item(),
                    --['<S-Tab>'] = cmp.mapping.select_prev_item(),

                    -- Manually trigger a completion from nvim-cmp.
                    --  Generally you don't need this, because nvim-cmp will display
                    --  completions whenever it has completion options available.
                    ["<C-Space>"] = cmp.mapping.complete({}),

                    -- Think of <c-l> as moving to the right of your snippet expansion.
                    --  So if you have a snippet that's like:
                    --  function $name($args)
                    --    $body
                    --  end
                    --
                    -- <c-l> will move you to the right of each of the expansion locations.
                    -- <c-h> is similar, except moving you backwards.
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),

                    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
                }),
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                },
            })
        '';
    };
};
}
