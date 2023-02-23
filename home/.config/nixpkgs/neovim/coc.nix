{ ... }: {
  programs.neovim.coc = {
    enable = true;
    package = with pkgs.nodePackages; [
      coc-go
      coc-sh
      coc-css
      coc-docker
      coc-emmet
      coc-explorer
      coc-git
      coc-highlight
      coc-html
      coc-json
      coc-prettier
      coc-pyright
      coc-snippets
      coc-spell-checker
      coc-tsserver
      coc-tslint
      coc-svelte
      coc-yaml
      coc-rust-analyser
    ];
  };
}
