# Help


## Download and extract tar lsp's
```bash
mkdir -p ~/.local/share/{lsp name};  wget -qO- {link to tar.gz} | tar xvz -C ~/.local/share/{lsp name}
```

### Create a symbolic link in ~/.local/bin to the executable.'
see instruction from lsp

example with lua_ls:
```bash
ln -s ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server
```
