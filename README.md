# Neovim Config

Personal Neovim configuration built on `lazy.nvim` with a small Lua layout, LSP support, Telescope search, Neo-tree file browsing, ToggleTerm, Treesitter, and a few UI plugins.

## Structure

- `init.lua`: entry point
- `lua/config/lazy.lua`: bootstraps `lazy.nvim` and loads plugins
- `lua/config/options.lua`: editor options
- `lua/config/keymaps.lua`: global keymaps
- `lua/plugins/*.lua`: plugin definitions and plugin-specific mappings

## Requirements

Required tools:

- Neovim `0.11+`
- `git`, `curl`, and `unzip`
- `ripgrep` for Telescope live grep
- `fd` for extended Telescope file discovery
- a C compiler and build tools for native plugins and Treesitter parsers
- a Nerd Font for file icons

Language servers are installed through Mason when available.

On macOS with Homebrew:

```bash
brew install neovim git ripgrep fd
xcode-select --install
```

Ubuntu 24.04's default `apt` package provides Neovim 0.9 and is too old for this config. Install a current Neovim release from [neovim.io](https://neovim.io/), then install the remaining dependencies:

```bash
sudo apt update
sudo apt install git curl unzip ripgrep fd-find build-essential
sudo ln -s "$(command -v fdfind)" /usr/local/bin/fd
```

The `fd` symlink is only needed when Ubuntu installs the executable as `fdfind`.

## Install

Clone this repo into your Neovim config directory:

```bash
git clone https://github.com/snowykr/nvim-config ~/.config/nvim
```

Then start Neovim:

```bash
nvim
```

On first launch, `lazy.nvim` bootstraps itself automatically and installs plugins.

## What this config includes

- `lazy.nvim` for plugin management
- `neo-tree` for file browsing
- `telescope.nvim` for file, grep, buffer, and help search
- `toggleterm.nvim` for an embedded terminal
- `nvim-lspconfig` + `mason.nvim` + `mason-lspconfig.nvim` for LSP setup
- `nvim-treesitter` for syntax highlighting and indentation
- `Comment.nvim` for commenting helpers
- `lualine.nvim` for the statusline
- `alpha-nvim` for the dashboard
- `indent-blankline.nvim` for indentation guides
- `nvim-osc52` for clipboard support over remote sessions

Configured LSP servers:

- `lua_ls`
- `ts_ls`
- `gopls`
- `rust_analyzer`
- `pyright`
- `clangd`

## Editor behavior

This config currently uses:

- 4 spaces for tabs/indentation
- spaces instead of hard tabs (`expandtab`)
- incremental search with smart case
- line numbers enabled
- true color support enabled
- `scrolloff=10`
- mouse support enabled
- system clipboard integration (`unnamedplus` / OSC52)

## Shortcuts

Leader key: `Space`

The leader key is set early in `init.lua` before the rest of the config loads.

This config has two kinds of shortcuts:

1. **Custom mappings defined in this repo**
2. **Plugin default mappings** that become available when you open a plugin UI like Neo-tree or Telescope

### Custom mappings from this repo

#### General

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>e` | Normal | Toggle Neo-tree file explorer |
| `<leader>h` | Normal | Clear search highlighting |
| `<leader>tt` | Normal | Toggle integrated terminal |

#### Window navigation

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<C-h>` | Normal | Move to left split |
| `<C-j>` | Normal | Move to split below |
| `<C-k>` | Normal | Move to split above |
| `<C-l>` | Normal | Move to right split |

#### Visual mode indentation

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<` | Visual | Indent left and keep selection |
| `>` | Visual | Indent right and keep selection |

#### Telescope launchers

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>ff` | Normal | Find files |
| `<leader>fg` | Normal | Live grep project content |
| `<leader>fb` | Normal | List open buffers |
| `<leader>fh` | Normal | Search help tags |

#### LSP

| Shortcut | Mode | Action |
| --- | --- | --- |
| `K` | Normal | Show hover documentation |
| `gd` | Normal | Go to definition |
| `<leader>ca` | Normal | Open code actions |

### Plugin default mappings that are also active

These are not explicitly defined in this repo, but they are still available because the plugins are loaded with their default behavior.

#### Comment.nvim defaults

| Shortcut | Mode | Action |
| --- | --- | --- |
| `gcc` | Normal | Toggle comment on current line |
| `gbc` | Normal | Toggle block comment on current line |
| `gc` | Visual | Toggle comment for selected text |
| `gb` | Visual | Toggle block comment for selected text |
| `gc[count]{motion}` | Normal | Comment a motion or range |
| `gb[count]{motion}` | Normal | Block-comment a motion or range |
| `gco` | Normal | Add comment on the next line and enter insert mode |
| `gcO` | Normal | Add comment on the previous line and enter insert mode |
| `gcA` | Normal | Add comment at end of line and enter insert mode |

#### Neo-tree defaults

These work when focus is inside the Neo-tree window.

| Shortcut | Mode | Action |
| --- | --- | --- |
| `?` | Normal | Show Neo-tree help |
| `<Space>` | Normal | Toggle/expand node |
| `<CR>` | Normal | Open file or directory |
| `<BS>` | Normal | Go up one directory |
| `.` | Normal | Set current node as root |
| `C` | Normal | Close node or close parent |
| `z` | Normal | Close all child nodes recursively |
| `<` | Normal | Go to previous source |
| `>` | Normal | Go to next source |
| `P` | Normal | Toggle preview |
| `l` | Normal | Focus preview window |
| `<C-f>` | Normal | Scroll preview down |
| `<C-b>` | Normal | Scroll preview up |

#### Telescope picker defaults

These work inside a Telescope picker after opening one with `<leader>ff`, `<leader>fg`, `<leader>fb`, or `<leader>fh`.

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<C-n>` / `<Down>` | Insert | Move to next item |
| `<C-p>` / `<Up>` | Insert | Move to previous item |
| `j` / `k` | Normal | Move to next/previous item |
| `gg` / `G` | Normal | Jump to first/last item |
| `<CR>` | Insert/Normal | Open selection |
| `<C-x>` | Insert/Normal | Open in horizontal split |
| `<C-v>` | Insert/Normal | Open in vertical split |
| `<C-t>` | Insert/Normal | Open in new tab |
| `<C-u>` | Insert/Normal | Scroll preview up |
| `<C-d>` | Insert/Normal | Scroll preview down |
| `<Tab>` | Insert/Normal | Toggle selection and move forward |
| `<S-Tab>` | Insert/Normal | Toggle selection and move backward |
| `<C-q>` | Insert/Normal | Send results to quickfix |
| `<M-q>` | Insert/Normal | Send selected entries to quickfix |
| `<C-/>` | Insert | Show picker keymap help |
| `?` | Normal | Show picker keymap help |
| `<Esc>` | Normal | Close picker |
| `<C-c>` | Insert | Close picker |

#### ToggleTerm

ToggleTerm does not define a global shortcut by default in this config. The active launcher is the custom mapping:

| Shortcut | Mode | Action |
| --- | --- | --- |
| `<leader>tt` | Normal | Open or close the terminal |

#### Alpha dashboard

Alpha does not add global shortcuts here. On the dashboard itself, you can use regular movement keys such as `j` / `k` and press `<CR>` to activate a button.

#### Plugins with no active shortcut layer

These plugins are enabled but do not add meaningful user-facing keymaps in this config:

- `nvim-treesitter`
- `lualine.nvim`
- `indent-blankline.nvim`
- `nvim-osc52`

#### Comment.nvim note

`Comment.nvim` is enabled with its default mappings, so standard commands like `gc` and `gcc` should work for commenting motions or lines.

## Notes

- `gruvbox` and `jb.nvim` are both installed, but `gruvbox` currently has the higher priority and sets the active colorscheme.
- Treesitter installs support for: Lua, Python, C, Rust, Markdown, Vim, SQL, TypeScript, JavaScript, HTML, and Go.
- Clipboard support is configured through `unnamedplus` in `lua/config/options.lua`, with `osc52` providing the remote-session clipboard backend.

## Customizing

- Add global mappings in `lua/config/keymaps.lua`
- Change editor defaults in `lua/config/options.lua`
- Add or modify plugins in `lua/plugins/`
- Change the active colorscheme in `lua/plugins/gruvbox.lua` or `lua/plugins/jb.lua`
