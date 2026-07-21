# Neovim 0.12 configuration for SvelteKit and Python

This is a complete Neovim 0.11+ configuration optimized for:

- Svelte 5 and SvelteKit
- TypeScript and JavaScript
- HTML, CSS, JSON, YAML, and TOML
- Python APIs using BasedPyright and Ruff
- Existing Lua, shell, C, C++, and Go development

## Requirements

- Neovim 0.12 or newer
- Git, curl, tar, and a C compiler
- Node.js 24 LTS
- ripgrep for Telescope project search
- A system clipboard provider appropriate for your operating system

The configuration uses the rewritten nvim-treesitter main branch and its
current Neovim 0.12 API. Mason installs the required tree-sitter CLI.

## Install

Back up your current configuration first:

    mv ~/.config/nvim ~/.config/nvim.backup

Extract the ZIP contents into a new configuration directory:

    mkdir -p ~/.config/nvim
    unzip neovim-sveltekit-config.zip -d ~/.config/nvim

Start Neovim. lazy.nvim will bootstrap itself and restore the plugin versions
from lazy-lock.json.

Then run:

    :Lazy sync
    :MasonToolsInstall
    :TSInstallConfigured
    :TSUpdate
    :checkhealth

For focused troubleshooting:

    :checkhealth mason
    :checkhealth vim.lsp
    :ConformInfo

## Configure a SvelteKit project

ESLint and Prettier belong to the project so that the editor, CI, and other
developers all use the same versions:

    pnpm dlx sv add eslint prettier --install pnpm

Run the project's complete Svelte check separately:

    pnpm check

Mason installs the editor-side language servers and the prettierd daemon.
prettierd will prefer the project's local Prettier and Svelte plugin.

## Active language tooling

Frontend:

- svelte-language-server for .svelte files
- vtsls for TypeScript and JavaScript
- eslint-language-server for project linting and code actions
- HTML, CSS, JSON, YAML, and Taplo language servers

Backend:

- BasedPyright for Python types, navigation, and hover information
- Ruff for Python diagnostics, imports, fixes, and formatting

Optional servers are documented as commented entries in
lua/plugins/mason-lspconfig.lua. Enable Tailwind, Emmet, or Docker tooling only
when the project actually uses it.

## Important mappings

| Mapping | Action |
| --- | --- |
| Space f | Format file or visual selection |
| Space pf | Find files |
| Space ps | Search the project |
| Space pw | Search the word under the cursor |
| Space pb | Find open buffers |
| Ctrl-p | Find Git files |
| gd / gD | Go to definition / declaration |
| gi / gr | Go to implementation / list references |
| K | Show hover documentation |
| Space ca | Code action |
| Space rn | Rename symbol |
| Space th | Toggle LSP inlay hints |
| Space xx | Open project diagnostics |
| Space gs | Open Fugitive Git status |
| Space u | Toggle UndoTree |

Your original clipboard, Harpoon, quickfix, replacement, and movement mappings
are preserved.

## Validation

The distributed configuration is checked as Lua source and boot-tested against
Neovim 0.12.4 with its lockfile. The plugin graph is restored through lazy.nvim,
and the Mason package identifiers are checked during the boot validation.
