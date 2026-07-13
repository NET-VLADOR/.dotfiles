# AGENTS.md

## Apply configs

```bash
cd ~/.dotfiles && stow .        # create symlinks
cd ~/.dotfiles && stow -D .     # remove symlinks
```

## Requirements

- Arch Linux, Wayland session (niri compositor)
- GNU Stow, Nerd Font (JetBrainsMono), all tools listed in README
- Neovim 0.10+ (uses Lazy.nvim — run `nvim` and let it install plugins)

## Key configs

| Path                      | Tool                                                                        |
| ------------------------- | --------------------------------------------------------------------------- |
| `.config/niri/config.kdl` | WM (niri)                                                                   |
| `.config/niri/includes/`  | Keybinds, input, outputs, layout, startup, rules, workspaces                |
| `.config/kitty/`          | Terminal                                                                    |
| `.config/herdr/`          | Multiplexer (prefix: `Ctrl+Space`, мигрирован с tmux)                       |
| `.config/nvim/`           | Editor (Lazy.nvim managed)                                                  |
| `.config/noctalia/`       | Wayland shell widgets                                                       |
| `.zshrc`                  | Shell (Oh My Zsh, plugins: git/zsh-autosuggestions/zsh-syntax-highlighting) |

## Theme

Catppuccin Mocha across all components (kitty, btop, herdr, lazygit, bat, etc.).

## Gotchas

- `.config/noctalia/plugins/` is gitignored
- No build/test/lint/CI infrastructure — purely config files managed via stow
- XDG env vars set in `.zshrc`, not system-wide
- `alias ls=lsd` in `.zshrc` — `ls` is not GNU ls
- **niri border special case** (<https://github.com/niri-wm/niri/wiki/Configuration:-Include#border-special-case>): `layout { border { ... } }` in the main config implicitly enables the border (like `on`). In an include file, it does nothing — you must explicitly add `on` to the border section.
