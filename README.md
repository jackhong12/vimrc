# Vim Settings

This repository contains my vim settings.

## Install
- For Linux:
    ```bash
    ./install.sh
    ```

- For Windows:
    ```powershell
    ./install.ps1
    ```

## Key Mappings
Type `:map` to check key mappings in vim.

| Key     | Action                 |
| ---     | ---                    |
| `<F1>`  | Nerd Tree Toggle       |
| `<F2>`  | Previous window buffer |
| `<F3>`  | Next window buffer     |
| `<F4>`  | Previous diff location |
| `<F5>`  | Next diff location     |
| `<F6>`  | Toggle to show diff    |
| `<F7>`  | Toggle of paste mode   |
| `<F8>`  | NONE                   |
| `<F9>`  | NONE                   |
| `<F10>` | NONE                   |
| `<F11>` | NONE                   |
| `<F12>` | P4 open current file   |

## Open Source Plugins
### [vim-signify](https://github.com/mhinz/vim-signify)
- Toggle by `g:use_signify`.

Signify uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system.

| Function                            | Action        |
| ---                                 | ---           |
| `:call sy#jump#prev_hunk(v:count1)` | Previous diff |
| `:call sy#jump#next_hunk(v:count1)` | Next diff     |
| `:call sy#fold#toggle()`            | Toggle diff   |

### [vim-rainbow](https://github.com/frazrepo/vim-rainbow)
- Toggle by `g:use_rainbow`.

Rainbow parentheses colors matching brackets (`()`, `[]`, `{}`) by nesting
depth, making deeply nested C/C++ code easier to read. Enabled for
`c`, `cpp`, `objc`, `objcpp` filetypes.

### [vim-airline](https://github.com/vim-airline/vim-airline)
- Toggle by `g:use_airline`.

Replaces the default status line with an enhanced one showing mode,
filename, filetype, encoding and cursor position. Paired with
`vim-airline-themes` (theme: `badwolf`) and the tabline extension for
buffer/tab display; Powerline fonts are enabled for the separator icons.

### [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- Toggle by `g:use_devicons`.

Adds file type icons in front of filenames, used by NerdTree and the
vim-airline tabline. Requires a Nerd Font (e.g.
`fonts/UbuntuMonoNerdFont-Regular.ttf`) to render correctly.

### [supertab](https://github.com/ervandew/supertab)
- Toggle by `g:use_supertab`.

Allows using `<Tab>` for insert-mode completion instead of `<C-n>`/`<C-p>`,
picking the completion method based on context. Configured to default to
`<c-n>` (keyword completion) via `g:SuperTabDefaultCompletionType`.

### [indentLine](https://github.com/Yggdroot/indentLine)
- Toggle by `g:use_indentline`.

Displays vertical lines for indentation levels, making nested code blocks
easier to follow. Configured to use `┊` as the guide character
(`g:indentLine_char_list`) with a dim terminal color (`g:indentLine_color_term`).

### [tabular](https://github.com/godlygeek/tabular)
- Toggle by `g:use_tabular`.

Aligns text around a given delimiter (e.g. `=`, `,`, `:`), useful for
lining up assignments or table-like code.

| Command     | Action                        |
| ---         | ---                            |
| `:Tab/<key>` | Align selected lines on `<key>` |

### [nerdtree](https://github.com/preservim/nerdtree)
- Toggle by `g:use_nerdtree`.

A file system explorer in a side window for browsing and opening files,
pairing with vim-devicons for file type icons. Toggled with `<leader>h`.

### [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
- Toggle by `g:use_ycm`. Built via `./install.sh --ycm` (see [Install](#install)).

A code-completion engine with semantic, `clangd`-backed completion,
go-to-definition and find-callers for C/C++.

| Function                   | Action                    |
| ---                        | ---                       |
| `:YcmCompleter GoTo`       | Jump to definition (`gd`) |
| `:YcmCompleter GoToCallers` | Jump to callers (`gc`)   |
| `<C-o>`                     | Jump back                |

### [tmux-complete](https://github.com/wellle/tmux-complete.vim)
- Toggle by `g:use_tmux`.

Adds words visible in other tmux panes to vim's insert-mode completion
candidates, useful for completing identifiers seen in a terminal/log pane.

### [vim-perforce](https://github.com/nfvs/vim-perforce)
- Toggle by `g:use_perforce`.

Integrates Perforce (`p4`) commands into vim.

| Command         | Action                        |
| ---              | ---                            |
| `:P4edit`        | Check out the current file    |
| `:P4revert`      | Revert the current file       |
| `:P4movetocl`    | Move the current file to a CL |

### [vim-easy-align](https://github.com/junegunn/vim-easy-align)
- Toggle by `g:use_easyalign`.

Interactive text alignment around a delimiter you choose while the
command is running. Mapped to `ga` in normal/visual mode.

### [Copilot](https://github.com/github/copilot.vim)
- Toggle by `g:use_copilot`.

GitHub Copilot AI code suggestions. Run `:Copilot setup` once to
authenticate. `<C-j>` accepts a suggestion (the default `<Tab>` mapping
is disabled via `g:copilot_no_tab_map` to avoid clashing with supertab).

### [vim-markdown](https://github.com/preservim/vim-markdown)
Markdown syntax highlighting and folding. Currently commented out /
disabled in `settings.vimrc`.

### [vim-polyglot](https://github.com/sheerun/vim-polyglot)
A collection of language packs (used here for markdown). Currently
commented out / disabled in `settings.vimrc`.

### [vim-fugitive](https://github.com/tpope/vim-fugitive)
- Toggle by `g:use_fugitive`.

A git wrapper for vim. Use `:Git diff` to show the git diff of the
current file inside vim.

### [vim-tablegen](https://github.com/antiagainst/vim-tablegen)
- Toggle by `g:use_tablegen`.

Syntax highlighting for LLVM TableGen (`.td`) files.
