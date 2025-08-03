{
    pkgs, lib, ...
}:
{
    programs = {
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
    };
}
