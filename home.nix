{ pkgs, lib, ... }:

{
    imports = [
        ./home-manager/git.nix
        ./home-manager/neovim.nix
        ./home-manager/tmux.nix
    ];

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
            source = ./home-manager/dot-p10k.zsh;
            target = ".config/p10k/p10k.zsh";
        };
    };
  };

  programs = {
    home-manager.enable = true;

    ghostty = {
        enable = true;
        settings = {
            font-family = "-calt"; # disable ligatures
            theme = "catppuccin-macchiato";
        };
    };

    fzf.enable = true;
    zoxide.enable = true;

    lsd = {
      enable = true;
      settings = {
        date = "relative";
        sorting.dir-grouping = "first";
        symlink-arrow = "→";
      };
    };

    rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = [ pkgs.rofi-calc ];
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
      dotDir = "/home/dara/.config/zsh/";
      oh-my-zsh.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        # fzf
        v = "fzf --bind 'enter:become(nvim {})'";

        open = "xdg-open";

        hl = "hledger";

        # ls
        lr = "lsd -lr";


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
