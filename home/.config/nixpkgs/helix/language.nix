{...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "d2";
          scope = "source.d2";
          file-types = ["d2"];
          comment-tokens = ["//"];
          block-comment-tokens = [
            { start = "/*"; end = "*/"; }
          ];
          indent = { tab-width = 2; unit = "  "; };
          auto-format = true;
          formatter = { command = "d2"; args = ["fmt"];};
        }
      ];
      grammar = [
        {
          name = "d2";
          source = { git = "https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2"; rev = "2595ffa6540535c0c3e4e8da1255dd4e45629a44"; };
        }
      ];
    };
  };
}
