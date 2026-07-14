# AGENTS.md

## Apply configs

```bash
cd ~/.dotfiles && stow .        # create symlinks
cd ~/.dotfiles && stow -D .     # remove symlinks
```

- `.stow-local-ignore` excludes AGENTS.md, `.github/`, `scripts/`, `README*`, `LICENSE*` from stow
- Only files/dirs under `.config/` and root files like `.zshrc` are stowed

## Niri config structure

```
.config/niri/
├── config.kdl              # main file, includes everything
├── noctalia.kdl             # colors & integration with Noctalia Shell
└── includes/
    ├── binds.kdl            # keybindings
    ├── input.kdl            # keyboard, touchpad, focus settings
    ├── layout.kdl           # gaps, border, shadow, focus-ring
    ├── outputs.kdl          # display config (eDP-1, DP-1, HDMI-A-1/2)
    ├── rules.kdl            # window rules with workspace assignments
    ├── startup.kdl          # autostart, cursor, screenshot, animations
    └── workspaces.kdl       # 7 workspaces pinned to DP-1
```

Reload: `niri msg action load-config-file`

## Workspaces

| # | Icon | Name | Apps |
|---|------|------|------|
| 1 | `` | Web | Zen |
| 2 | `` | Code | Kitty (nvim, lazygit, dotnet) |
| 3 | `` | Social | Telegram |
| 4 | `` | Productivity | Obsidian |
| 5 | `` | System | btop, superfile, AmneziaVPN |
| 6 | `` | Music | YandexMusic |
| 7 | `` | Games | Steam |

## Gotchas

- **Rules ordering**: niri uses the **last** matching rule. Put specific rules (btop/superfile by title) after the generic kitty rule, or the generic rule wins.
- **Border special case** ([docs](https://github.com/niri-wm/niri/wiki/Configuration:-Include#border-special-case)): `border { ... }` in the main config implies `on`. In an include file, you must add `on` explicitly. The current `noctalia.kdl` has `border { active-color ... }` without `on` — since it's included after `includes/layout.kdl` (which has `border { on; width 2; }`), the color overrides may be ignored. To fix, add `on` in `noctalia.kdl`'s border block or move colors into `layout.kdl`.
- `.config/noctalia/plugins/` is gitignored
- XDG env vars (`XDG_CONFIG_HOME`, etc.) are set in `.zshrc`, not system-wide
- `alias ls=lsd` in `.zshrc` — `ls` is not GNU ls
- `spf` is a shell function defined in `.zshrc`, not a standalone binary (preserves last directory)
- No build/test/lint infrastructure — purely config files managed via stow
- All Catppuccin Mocha themed: niri, kitty, btop, herdr, lazygit, bat, lsd, fastfetch, noctalia
- Dotnet tools path: `$HOME/.dotnet/tools` added to PATH in `.zshrc`

## Install

```bash
bash ~/.dotfiles/scripts/install-deps.sh   # pacman + yay deps, then stow
```
