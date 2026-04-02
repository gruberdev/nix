{...}: {
  programs.nixvim = {
    localOpts = {
      number = true;
      relativenumber = false;
    };

    globalOpts = {
      autoindent = true;
      backspace = "indent,eol,start";
      expandtab = true;
      smarttab = true;
      hidden = true;
      hlsearch = true;
      ignorecase = true;
      incsearch = true;
      mouse = "a";
      undofile = true;
      number = true;
      relativenumber = false;
      smartcase = true;
      smartindent = true;
      laststatus = 3;
      sts = 2;
      sw = 2;
    };

    extraConfigLua = ''
      vim.o.foldlevelstart = 99
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
      })
    '';
  };
}
