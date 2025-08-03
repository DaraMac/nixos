{
    pkgs, lib, ...
}:
{
    programs = {
        ghostty = {
            enable = true;
            settings = {
                font-family = "-calt"; # disable ligatures
                theme = "catppuccin-macchiato";
            };
        };
    };
}
