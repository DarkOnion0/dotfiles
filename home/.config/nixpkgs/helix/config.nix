
{...}: {
  programs.helix = {
    settings = {
      theme = "catppuccin_macchiato";
      editor = {
        true-color = true; # For the catpuccin theme

        line-number = "relative";

        cursor-shape = {
          insert = "bar";
        };
        cursorline = true;
        cursorcolumn = true;

        bufferline = "multiple";

        lsp = {
          display-inlay-hints = true;
        };
      };
    };
  };
}
