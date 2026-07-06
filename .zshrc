# === XDG Base Directories ===
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"

# === Переменные окружения ===
export ICON_THEME=Adwaita
export GTK_ICON_THEME=Adwaita
export QT_ICON_THEME=Adwaita
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24

# Wayland
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland;xcb"
export SDL_VIDEODRIVER="wayland"

# Редактор
export EDITOR="nvim"
export VISUAL="nvim"

# === PATH с проверкой дубликатов ===
if [[ ":$PATH:" != *":$HOME/.dotnet/tools:"* ]]; then
    export PATH="$PATH:$HOME/.dotnet/tools"
fi


# === Superfile ===
spf() {
    os=$(uname -s)

    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME}/superfile/lastdir"
    fi
    
    command spf "$@"
    local exit_code=$?
    
    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
    
    return $exit_code
}

# === Oh My Zsh ===
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto

ENABLE_CORRECTION="true"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# === Алиасы ===
alias ls=lsd

# === Приветствие ===
fastfetch
