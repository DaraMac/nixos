{
    pkgs, lib, ...
}:
{
    programs = {
        ghostty = {
            enable = true;
            settings = {
                font-family = "-calt"; # disable ligatures
                theme = "Catppuccin Macchiato";
                quit-after-last-window-closed = "false";
                keybind = [
                    "keybind = global:cmd+backquote=toggle_quick_terminal"
                ];
            };
        };
    };
}
