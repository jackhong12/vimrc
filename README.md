# Vim Settings

This repository contains my vim settings.

## Install
```bash
./install.sh
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
Signify uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system.

| Function                            | Action        |
| ---                                 | ---           |
| `:call sy#jump#prev_hunk(v:count1)` | Previous diff |
| `:call sy#jump#next_hunk(v:count1)` | Next diff     |
| `:call sy#fold#toggle()`            | Toggle diff   |
