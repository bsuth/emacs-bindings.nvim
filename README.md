# emacs-bindings.nvim

Basic Emacs bindings for Neovim.

By default, this plugin adds support for emacs bindings in insert and command mode, although this is configurable.

The movements provided do _not_ traverse lines. For example, trying to delete a word backwards (`<M-Backspace>`) while already at the start of the line
will not cause your cursor to jump to the previous line, it will simply do nothing.

The bindings for moving between lines (`<C-n>`, `<C-p>`) have been left out, as these keys are often used for other purposes (such as LSP completion).
However, it is trivial to add these bindings manually:

```lua
vim.keymap.set('i', '<C-n>', '<Up>')
vim.keymap.set('i', '<C-p>', '<Down>')
```

This plugin was written using the [erde](https://erde-lang.github.io/) programming language.

## Installation

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'bsuth/emacs-bindings.nvim'
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use('bsuth/emacs-bindings.nvim')
```

## Options

### `emacs_bindings_modes`

String with each character representing a mode to apply bindings to:

- `i`: Insert Mode
- `c`: Command Mode
- `n`: Normal Mode
- `v`: Visual Mode

Some usage examples are:

```lua
-- The default, sets bindings for insert and command modes
vim.g.emacs_bindings_modes = 'ic'

-- Set bindings for just normal mode
vim.g.emacs_bindings_modes = 'n'

-- Set bindings for all supported modes
vim.g.emacs_bindings_modes = 'icnv'
```

### `emacs_bindings_wordchars`

String representing which characters (in addition to alphanumeric characters) should be considered part of
a "word" (inspired by zsh's [WORDCHARS](https://zsh.sourceforge.io/Doc/Release/Parameters.html#index-WORDCHARS) env variable).

By default, this will take the value of the env variable `WORDCHARS` and if empty default to `*?_-.[]~=`.

```lua
vim.g.emacs_bindings_wordchars = '[]/.'
```
