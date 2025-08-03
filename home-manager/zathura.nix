{
    pkgs, lib, ...
}:
{
    programs = {
        zathura = {
          enable = true;
          options = {
            # to make it copy to the GUI clipboard upon highlight selecting
            # https://unix.stackexchange.com/a/339488
            selection-clipboard = "clipboard";
          };
        };
    };
}
