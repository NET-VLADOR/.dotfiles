#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=false
for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=true ;;
        *) echo "Usage: $0 [--dry-run]"; exit 1 ;;
    esac
done

run() {
    if $DRY_RUN; then
        echo "[DRY-RUN] $*"
    else
        echo "[RUN] $*"
        "$@"
    fi
}

info()  { echo -e "\e[36m•\e[0m $*"; }
ok()    { echo -e "\e[32m✓\e[0m $*"; }
warn()  { echo -e "\e[33m!\e[0m $*"; }

PACMAN_PACKAGES=(
    # System
    git stow base-devel
    # WM & terminal
    niri kitty
    # Shell
    zsh
    # Editor
    neovim
    # TUI tools
    btop fastfetch bat lsd lazygit superfile
    # Wayland utils
    wl-clipboard cliphist brightnessctl wireplumber playerctl
    # Fonts
    ttf-jetbrains-mono-nerd
)

AUR_PACKAGES=(
    noctalia-shell
    zen-browser-bin
    herdr
)

# ──  Install pacman ──────────────────────
info "Pacman packages…"
if $DRY_RUN; then
    run sudo pacman -S --needed "${PACMAN_PACKAGES[@]}"
else
    missing=()
    for pkg in "${PACMAN_PACKAGES[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            missing+=("$pkg")
        fi
    done
    if [ ${#missing[@]} -gt 0 ]; then
        run sudo pacman -S --needed "${missing[@]}"
    else
        ok "All pacman packages already installed"
    fi
fi

# ──  Install AUR (yay) ────────────────────
if command -v yay &>/dev/null; then
    info "AUR packages…"
    if $DRY_RUN; then
        run yay -S --needed "${AUR_PACKAGES[@]}"
    else
        missing_aur=()
        for pkg in "${AUR_PACKAGES[@]}"; do
            if ! yay -Qi "$pkg" &>/dev/null 2>&1; then
                missing_aur+=("$pkg")
            fi
        done
        if [ ${#missing_aur[@]} -gt 0 ]; then
            run yay -S --needed "${missing_aur[@]}"
        else
            ok "All AUR packages already installed"
        fi
    fi
else
    warn "yay not found — skipping AUR packages"
    warn "Install yay: sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si"
fi

# ──  Neovim — check version ──────────────
info "Neovim…"
if command -v nvim &>/dev/null; then
    nvim_ver=$(nvim --version | head -1 | grep -oP '\d+\.\d+')
    if awk "BEGIN {exit !($nvim_ver >= 0.10)}"; then
        ok "Neovim $nvim_ver+ OK"
    else
        warn "Neovim $nvim_ver detected — 0.10+ recommended (Lazy.nvim needs it)"
    fi
else
    warn "Neovim not installed — already in pacman list above"
fi

# ──  Stow dotfiles ────────────────────────
cd "$(dirname "$0")/.."
info "Stow dotfiles…"
if $DRY_RUN; then
    run stow --simulate .
else
    STOW_DIR="$(pwd)"
    if [ -d "$HOME/.config/niri" ] || [ -L "$HOME/.config/niri" ]; then
        ok "Already stowed (or existing config present)"
        warn "Run: cd $STOW_DIR && stow -D . && stow .  to restow"
    else
        run stow .
        ok "Dotfiles stowed!"
    fi
fi

echo -e "\e[32mDone.\e[0m"
