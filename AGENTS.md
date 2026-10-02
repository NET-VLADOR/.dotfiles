# Repository notes

<!--toc:start-->

- [Repository notes](#repository-notes)
  - [Niri](#niri)
  - [Shell and local state](#shell-and-local-state)

<!--toc:end-->

- Personal Arch Linux dotfiles managed with GNU Stow; no build, test, or lint suite.
- Apply links from the repo root with `stow .`; remove them with `stow -D .`. The ignore rules exclude `AGENTS.md`, `scripts/`, `.github/`, README/LICENSE files, and Stow metadata from the deployed tree.
- `bash scripts/install-deps.sh` installs packages and attempts to stow. It may invoke `sudo pacman` and `yay`; use `bash scripts/install-deps.sh --dry-run` to preview. If `~/.config/niri` already exists, the script skips stowing and prints the `stow -D . && stow .` restow command—check before replacing existing configs.

## Niri

- `.config/niri/config.kdl` is the entrypoint and includes `includes/*.kdl` plus `noctalia.kdl`. Reload with `niri msg action load-config-file`.
- Niri include ordering matters: `noctalia.kdl` is included after `includes/layout.kdl`. Its `layout.border` block sets colors but omits `on`; border behavior across includes is a special case, so verify before changing either border block.

## Shell and local state

- `.zshrc` sets `XDG_CONFIG_HOME`, defines `spf` as a shell function (not a standalone command), and aliases `ls` to `lsd`.
- `.config/noctalia/plugins/` is intentionally gitignored local state; do not assume its contents are tracked.
