{
    pkgs, lib, ...
}:
{
    programs = {
        lsd = {
            enable = true;
            settings = {
                date = "relative";
                sorting.dir-grouping = "first";
                symlink-arrow = "→";
            };
        };
    };
}
