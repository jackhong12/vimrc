# Vim Settings

This repository contains my vim settings.

## Install
```bash
./install.sh
```

## Key Mappings
| Key     | Action                 |
| ---     | ---                    |
| `<F1>`  | Previous window buffer |
| `<F2>`  | Next window buffer     |
| `<F3>`  | Previous diff location |
| `<F4>`  | Next diff location     |
| `<F5>`  | Toggle to show diff    |
| `<F6>`  | Toggle of paste mode   |
| `<F7>`  | NONE                   |
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
