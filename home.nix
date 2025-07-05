{
  pkgs,
  lib,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "dara";
    homeDirectory = "/home/dara";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager releases introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager releases notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";

    file = {
        "hledger-iadd" = {
            target = ".config/hledger-iadd/config.conf";
            text = ''date-format = "%Y-%m-%d"'';
        };

        "p10k.zsh" = {
            source = ./dot-p10k.zsh;
            target = ".config/p10k/p10k.zsh";
        };
    };
  };

  programs = {
    home-manager.enable = true;

    ghostty = {
        enable = true;
        settings = {
            # disable ligatures
            font-family = "-calt";
        };
    };

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

    fzf.enable = true;
    zoxide.enable = true;

    lsd = {
      enable = true;
      settings = {
        # date = "+%Y-%m-%d %H:%M";
        date = "relative";
        sorting.dir-grouping = "first";
        symlink-arrow = "→";
      };
    };

    rofi = {
        enable = true;
    };

    neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        plugins = with pkgs.vimPlugins; [
            catppuccin-nvim
            cmp-nvim-lsp
            cmp-path
            cmp_luasnip
            luasnip
            nvim-cmp
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            obsidian-nvim
            telescope-nvim
            todo-comments-nvim
        ];

        # NOTE: The comment will allow the LSP and Treesitter to work in the string
        extraLuaConfig = /* lua */ ''

            vim.cmd.colorscheme 'catppuccin-mocha'

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

                disable_frontmatter = true,
            }


            -- lsp
            vim.lsp.enable('basedpyright')
            vim.lsp.enable('bashls')
            vim.lsp.enable('hls')
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


            -- treesitter
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true
                }
            }


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

    tmux = {
      enable = true;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color"; # this was needed on Mac, maybe not on linux
      extraConfig = /* js */ ''
        set -g status off
        bind -Tcopy-mode MouseDragEnd1Pane send -X copy-selection

        # To make new splits open in the same directory as current
        # https://unix.stackexchange.com/a/109255
        bind  %  split-window -h -c "#{pane_current_path}"
        bind '"' split-window -v -c "#{pane_current_path}"
      '';
    };

    zathura = {
      enable = true;
      options = {
        # to make it copy to the GUI clipboard upon highlight selecting
        # https://unix.stackexchange.com/a/339488
        selection-clipboard = "clipboard";
      };
    };

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      oh-my-zsh.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        # fzf
        v = "fzf --bind 'enter:become(nvim {})'";

        open = "xdg-open";

        # ls
        # la = "lsd -lA";
        # ll = "lsd -l";
        lr = "lsd -lr";
        # ls = "lsd";
        # lt = "lsd --tree";

        # start git aliases
        ggpur = "ggu";
        g = "git";
        ga = "git add";
        gaa = "git add --all";
        gapa = "git add --patch";
        gau = "git add --update";
        gav = "git add --verbose";
        gwip = ''git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'';
        gam = "git am";
        gama = "git am --abort";
        gamc = "git am --continue";
        gamscp = "git am --show-current-patch";
        gams = "git am --skip";
        gap = "git apply";
        gapt = "git apply --3way";
        gbs = "git bisect";
        gbsb = "git bisect bad";
        gbsg = "git bisect good";
        gbsn = "git bisect new";
        gbso = "git bisect old";
        gbsr = "git bisect reset";
        gbss = "git bisect start";
        gbl = "git blame -w";
        gb = "git branch";
        gba = "git branch --all";
        gbd = "git branch --delete";
        gbD = "git branch --delete --force";

        ###

        gbgd = ''LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -d'';
        gbgD = ''LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -D'';
        gbm = "git branch --move";
        gbnm = "git branch --no-merged";
        gbr = "git branch --remote";
        ggsup = "git branch --set-upstream-to=origin/$(git_current_branch)";
        gbg = ''LANG=C git branch -vv | grep ": gone\]"'';
        gco = "git checkout";
        gcor = "git checkout --recurse-submodules";
        gcb = "git checkout -b";
        gcB = "git checkout -B";
        gcd = "git checkout $(git_develop_branch)";
        gcm = "git checkout $(git_main_branch)";
        gcp = "git cherry-pick";
        gcpa = "git cherry-pick --abort";
        gcpc = "git cherry-pick --continue";
        gclean = "git clean --interactive -d";
        gcl = "git clone --recurse-submodules";
        gclf = "git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules";

        ###

        gcam = "git commit --all --message";
        gcas = "git commit --all --signoff";
        gcasm = "git commit --all --signoff --message";
        gcs = "git commit --gpg-sign";
        gcss = "git commit --gpg-sign --signoff";
        gcssm = "git commit --gpg-sign --signoff --message";
        gcmsg = "git commit --message";
        gcsm = "git commit --signoff --message";
        gc = "git commit --verbose";
        gca = "git commit --verbose --all";
        "gca!" = "git commit --verbose --all --amend";
        "gcan!" = "git commit --verbose --all --no-edit --amend";
        "gcans!" = "git commit --verbose --all --signoff --no-edit --amend";
        "gcann!" = "git commit --verbose --all --date=now --no-edit --amend";
        "gc!" = "git commit --verbose --amend";
        gcn = "git commit --verbose --no-edit";
        "gcn!" = "git commit --verbose --no-edit --amend";
        gcf = "git config --list";
        gdct = "git describe --tags $(git rev-list --tags --max-count=1)";
        gd = "git diff";
        gdca = "git diff --cached";
        gdcw = "git diff --cached --word-diff";
        gds = "git diff --staged";
        gdw = "git diff --word-diff";

        gdup = "git diff @{upstream}";

        gdt = "git diff-tree --no-commit-id --name-only -r";
        gf = "git fetch";
        gfa = "git fetch --all --tags --prune --jobs=10";
        gfo = "git fetch origin";
        gg = "git gui citool";
        gga = "git gui citool --amend";
        ghh = "git help";
        glgg = "git log --graph";
        glgga = "git log --graph --decorate --all";
        glgm = "git log --graph --max-count=10";
        glods = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'';
        glod = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'';
        glola = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'';
        glols = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'';
        glol = ''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'';
        glo=''git log --pretty="format:%C(yellow)%h %Creset%s %Cblue%>(12)%ad" --date=relative'';
        glog = "git log --oneline --decorate --graph";
        gloga = "git log --oneline --decorate --graph --all";

        glp = "_git_log_prettily";
        glg = "git log --stat";
        glgp = "git log --stat --patch";
        gignored = ''git ls-files -v | grep "^[[:lower:]]"'';
        gfg = "git ls-files | grep";
        gm = "git merge";
        gma = "git merge --abort";
        gmc = "git merge --continue";
        gms = "git merge --squash";
        gmff = "git merge --ff-only";
        gmom = "git merge origin/$(git_main_branch)";
        gmum = "git merge upstream/$(git_main_branch)";
        gmtl = "git mergetool --no-prompt";
        gmtlvim = "git mergetool --no-prompt --tool=vimdiff";

        gl = "git pull";
        gpr = "git pull --rebase";
        gprv = "git pull --rebase -v";
        gpra = "git pull --rebase --autostash";
        gprav = "git pull --rebase --autostash -v";

        gprom = "git pull --rebase origin $(git_main_branch)";
        gpromi = "git pull --rebase=interactive origin $(git_main_branch)";
        gprum = "git pull --rebase upstream $(git_main_branch)";
        gprumi = "git pull --rebase=interactive upstream $(git_main_branch)";
        ggpull = ''git pull origin "$(git_current_branch)"'';

        gluc = "git pull upstream $(git_current_branch)";
        glum = "git pull upstream $(git_main_branch)";
        gp = "git push";
        gpd = "git push --dry-run";

        "gpf!" = "git push --force";
        gpf = "git push --force-with-lease --force-if-includes";

        gpsup = "git push --set-upstream origin $(git_current_branch)";
        gpsupf = "git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes";
        gpv = "git push --verbose";
        gpoat = "git push origin --all && git push origin --tags";
        gpod = "git push origin --delete";
        ggpush = ''git push origin "$(git_current_branch)"'';

        gpu = ''git push upstream'';
        grb = ''git rebase'';
        grba = ''git rebase --abort'';
        grbc = ''git rebase --continue'';
        grbi = ''git rebase --interactive'';
        grbo = ''git rebase --onto'';
        grbs = ''git rebase --skip'';
        grbd = ''git rebase $(git_develop_branch)'';
        grbm = ''git rebase $(git_main_branch)'';
        grbom = ''git rebase origin/$(git_main_branch)'';
        grbum = ''git rebase upstream/$(git_main_branch)'';
        grf = ''git reflog'';
        gr = ''git remote'';
        grv = ''git remote --verbose'';
        gra = ''git remote add'';
        grrm = ''git remote remove'';
        grmv = ''git remote rename'';
        grset = ''git remote set-url'';
        grup = ''git remote update'';
        grh = ''git reset'';
        gru = ''git reset --'';
        grhh = ''git reset --hard'';
        grhk = ''git reset --keep'';
        grhs = ''git reset --soft'';
        gpristine = ''git reset --hard && git clean --force -dfx'';
        gwipe = ''git reset --hard && git clean --force -df'';
        groh = ''git reset origin/$(git_current_branch) --hard'';
        grs = ''git restore'';
        grss = ''git restore --source'';
        grst = ''git restore --staged'';
        gunwip = ''git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'';
        grev = ''git revert'';
        greva = ''git revert --abort'';
        grevc = ''git revert --continue'';
        grm = ''git rm'';
        grmc = ''git rm --cached'';
        gcount = ''git shortlog --summary --numbered'';
        gsh = ''git show'';
        gsps = ''git show --pretty=short --show-signature'';
        gstall = ''git stash --all'';
        gstaa = ''git stash apply'';
        gstc = ''git stash clear'';
        gstd = ''git stash drop'';
        gstl = ''git stash list'';
        gstp = ''git stash pop'';
        gsta = ''git stash push'';
        gsts = ''git stash show --patch'';
        gst = ''git status'';
        gss = ''git status --short'';
        gsb = ''git status --short --branch'';
        gsi = ''git submodule init'';
        gsu = ''git submodule update'';
        gsd = ''git svn dcommit'';
        git-svn-dcommit-push = ''git svn dcommit && git push github $(git_main_branch):svntrunk'';
        gsr = ''git svn rebase'';
        gsw = ''git switch'';
        gswc = ''git switch --create'';
        gswd = ''git switch $(git_develop_branch)'';
        gswm = ''git switch $(git_main_branch)'';
        gta = ''git tag --annotate'';
        gts = ''git tag --sign'';
        gtv = ''git tag | sort -V'';
        gignore = ''git update-index --assume-unchanged'';
        gunignore = ''git update-index --no-assume-unchanged'';
        gwch = ''git whatchanged -p --abbrev-commit --pretty=medium'';
        gwt = ''git worktree'';
        gwta = ''git worktree add'';
        gwtls = ''git worktree list'';
        gwtmv = ''git worktree move'';
        gwtrm = ''git worktree remove'';
        gstu = ''gsta --include-untracked'';
        gtl = ''gtl(){ git tag --sort=-v:refname -n --list "''${1}*" }; noglob gtl'';
        gk = ''\gitk --all --branches &!'';
        gke = ''\gitk --all $(git log --walk-reflogs --pretty=%h) &!'';
        # end git aliases
      };

      plugins = [];

      # mkBefore is to force the p10k section to be at the start of the .zshrc
      initContent = lib.mkBefore /* bash */ ''
        # This block automatically generated by p10k
        ###############################################################################
        # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
        # Initialization code that may require console input (password prompts, [y/n]
        # confirmations, etc.) must go above this block; everything else may go below.
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi

        # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
        [[ ! -f ~/.config/p10k/p10k.zsh ]] || source ~/.config/p10k/p10k.zsh
        ###############################################################################

        # start git functions

        # Check for develop and similarly named branches
        function git_develop_branch() {
            command git rev-parse --git-dir &>/dev/null || return
            local branch
            for branch in dev devel develop development; do
                if command git show-ref -q --verify refs/heads/$branch; then
                    echo $branch
                    return 0
                fi
            done

            echo develop
            return 1
        }

        function grename() {
            if [[ -z "$1" || -z "$2" ]]; then
                echo "Usage: $0 old_branch new_branch"
                return 1
            fi

            # Rename branch locally
            git branch -m "$1" "$2"
            # Rename branch in origin remote
            if git push origin :"$1"; then
                git push --set-upstream origin "$2"
            fi
        }

        function gbda() {
            git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch --delete 2>/dev/null
        }

        # https://github.com/jmaroeder/plugin-git/blob/216723ef4f9e8dde399661c39c80bdf73f4076c4/functions/gbda.fish
        function gbds() {
            local default_branch=$(git_main_branch)
            (( ! $? )) || default_branch=$(git_develop_branch)

            git for-each-ref refs/heads/ "--format=%(refname:short)" | \
            while read branch; do
                local merge_base=$(git merge-base $default_branch $branch)
                    if [[ $(git cherry $default_branch $(git commit-tree $(git rev-parse $branch\^{tree}) -p $merge_base -m _)) = -* ]]; then
                        git branch -D $branch
                    fi
                done
        }

        function gccd() {
            setopt localoptions extendedglob

            # get repo URI from args based on valid formats: https://git-scm.com/docs/git-clone#URLS
            local repo="''${''${@[(r)(ssh://*|git://*|ftp(s)#://*|http(s)#://*|*@*)(.git/#)#]}:-$_}"

            # clone repository and exit if it fails
            command git clone --recurse-submodules "$@" || return

            # if last arg passed was a directory, that's where the repo was cloned
            # otherwise parse the repo URI and use the last part as the directory
            [[ -d "$_" ]] && cd "$_" || cd "''${''${repo:t}%.git/#}"
        }
        compdef _git gccd=git-clone

        function gdv() { git diff -w "$@" | view - }
        compdef _git gdv=git-diff

        function gdnolock() {
            git diff "$@" ":(exclude)package-lock.json" ":(exclude)*.lock"
        }
        compdef _git gdnolock=git-diff

        # Pretty log messages
        function _git_log_prettily(){
            if ! [ -z $1 ]; then
                git log --pretty=$1
            fi
        }
        compdef _git _git_log_prettily=git-log

        function ggu() {
            [[ "$#" != 1 ]] && local b="$(git_current_branch)"
            git pull --rebase origin "''${b:=$1}"
        }
        compdef _git ggu=git-checkout

        function ggl() {
            if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
                git pull origin "''${*}"
            else
                [[ "$#" == 0 ]] && local b="$(git_current_branch)"
                git pull origin "''${b:=$1}"
            fi
        }
        compdef _git ggl=git-checkout

        function ggf() {
            [[ "$#" != 1 ]] && local b="$(git_current_branch)"
            git push --force origin "''${b:=$1}"
        }
        compdef _git ggf=git-checkout

        function ggfl() {
            [[ "$#" != 1 ]] && local b="$(git_current_branch)"
            git push --force-with-lease origin "''${b:=$1}"
        }
        compdef _git ggfl=git-checkout

        function ggp() {
            if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
                git push origin "''${*}"
            else
                [[ "$#" == 0 ]] && local b="$(git_current_branch)"
                git push origin "''${b:=$1}"
            fi
        }
        compdef _git ggp=git-checkout

        ### end git functions


        # Location of ledger file for hledger
        export LEDGER_FILE='/home/dara/Documents/accounts/2025.journal'

        # Use bat for highighted manual
        export MANPAGER="sh -c 'col -bx | bat -l man -p'"
        export MANROFFOPT="-c"


        # Setup yazi alias
        function y() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
            yazi "$@" --cwd-file="$tmp"
            if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
            fi
            rm -f -- "$tmp"
        }

      '';
    };
  };
}
