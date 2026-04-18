# DOTFILES

Мои персональные конфиги для Arch Linux с использованием GNU Stow для управления символическими ссылками.

## 📋 Обзор конфигурации

|Компонент|Описание|
|---|---|
|**WM**|Niri (Wayland композитор)|
|**Shell**|ZSH + Oh My Zsh|
|**Terminal**|Kitty|
|**File Manager**|Superfile (spf)|
|**System Monitor**|Btop|
|**Bar/Panel**|Noctalia Shell|
|**Multiplexer**|Tmux|
|**Git TUI**|Lazygit|
|**Info Fetch**|Fastfetch|
|**LS Replacement**|Lsd|
|**Cat Viewer**|Bat|

---

## 📦 Установка

### Требования

- **Arch Linux** (или основанный на нём дистрибутив)
- **GNU Stow** — менеджер символических ссылок
- **Neovim 0.10+** (опционально, используется как редактор по умолчанию)
- **Nerd Fonts** — для корректного отображения иконок

### Шаг 1: Установка зависимостей

```bash
# Обновление системы
sudo pacman -Syu

# Установка базовых пакетов
sudo pacman -S --needed git stow base-devel

# Установка компонентов окружения
sudo pacman -S --needed \
    niri \
    kitty \
    tmux \
    zsh \
    btop \
    fastfetch \
    bat \
    lsd \
    lazygit \
    superfile \
    wl-clipboard \
    cliphist \
    brightnessctl \
    wireplumber
```

### Шаг 2: Установка шрифтов

```bash
# JetBrainsMono Nerd Font (используется в kitty)
yay -S jetbrains-mono-font-nerd

# Или через pacman
sudo pacman -S ttf-jetbrains-mono-nerd
```

### Шаг 3: Клонирование репозитория

```bash
cd ~
git clone https://github.com/NET-VLADOR/DOTFILES.git ~/.dotfiles
```

### Шаг 4: Применение конфигов через Stow

```bash
cd ~/.dotfiles

# Применить все конфиги
stow .
```

> [!NOTE]
> Stow создаст символические ссылки из `~/.dotfiles/.config/*` в `~/.config/`

---

## ⚙️ Компоненты

### 🖥️ Niri (Wayland Compositor)

**Конфиг:** `.config/niri/`

Основной оконный менеджер с тайлингом.

#### Основные горячие клавиши:

|Клавиши|Действие|
|---|---|
|`Mod+T`|Открыть терминал (Kitty)|
|`Mod+B`|Открыть браузер (Zen Browser)|
|`Alt+Space`|Открыть лаунчер приложений|
|`Mod+E`|Открыть файловый менеджер (spf)|
|`Mod+Q`|Закрыть окно|
|`Mod+H/J/K/L`|Навигация между окнами/колонками|
|`Mod+Ctrl+H/J/K/L`|Перемещение окон/колонок|
|`Mod+1-9`|Переключение на рабочую область 1-9|
|`Mod+Shift+1-9`|Переместить колонку на рабочую область 1-9|
|`Mod+O`|Переключить Overview|
|`Mod+N`|История уведомлений|
|`Mod+Escape`|Центр управления|
|`Ctrl+Shift+Escape`|Монитор ресурсов (btop)|

#### Структура конфигов Niri:

```
niri/
├── config.kdl          # Основной конфиг
├── noctalia.kdl        # Интеграция с Noctalia
└── includes/
    ├── binds.kdl       # Горячие клавиши
    ├── input.kdl       # Настройки ввода
    ├── outputs.kdl     # Настройки дисплеев
    ├── rules.kdl       # Правила для окон
    └── workspaces.kdl  # Настройки рабочих областей
```

### 🐚 ZSH

**Конфиг:** `.zshrc`

Оболочка с плагинами:

- **Oh My Zsh** — фреймворк для zsh
- **zsh-autosuggestions** — автодополнение команд
- **zsh-syntax-highlighting** — подсветка синтаксиса
- **git** — алиасы для git

#### Алиасы:

```bash
alias ls=lsd
```

#### Функции:

- `spf` — запуск Superfile с сохранением последней директории

### 🐱 Kitty

**Конфиг:** `.config/kitty/`

Терминальный эмулятор с поддержкой GPU.

**Шрифт:** JetBrainsMono Nerd Font, размер 12.0

**Тема:** Catppuccin Mocha (через `current-theme.conf`)

### 📊 Btop

**Конфиг:** `.config/btop/`

Системный монитор ресурсов.

**Тема:** Catppuccin Mocha (кастомная в `themes/catppuccin_mocha.theme`)

**Особенности:**
- Vim-клавиши включены
- Закруглённые углы
- Truecolor
- Графики: braille

### 🌀 Tmux

**Конфиг:** `.config/tmux/`

Терминальный мультиплексор.

**Префикс:** `Ctrl+Space`

#### Плагины:

- **tpm** — менеджер плагинов
- **catppuccin/tmux** — тема Catppuccin Mocha
- **vim-tmux-navigator** — навигация vim-style между панелями
- **tmux-which-key** — отображение доступных клавиш

#### Горячие клавиши:

|Клавиши|Действие|
|---|---|
|`prefix + r`|Перезагрузить конфиг|
|`prefix + \`|Вертикальное разделение|
|`prefix + -`|Горизонтальное разделение|
|`prefix + c`|Новое окно|
|`prefix + h/j/k/l`|Изменение размера панелей|
|`prefix + m`|Zoom панели|
|`prefix + v`|Начало выделения (vi-mode)|
|`prefix + y`|Копирование в буфер|

### 🗂️ Superfile

**Конфиг:** `.config/superfile/`

Файловый менеджер TUI.

**Особенности:**
- Редактор: nvim
- Автопроверка обновлений: включена
- Предпросмотр файлов: включён
- Предпросмотр изображений: включён
- cd on quit: включено

### 🔧 Lazygit

**Конфиг:** `.config/lazygit/`

TUI для Git с темой Catppuccin Mocha.

**Особенности:**
- Nerd Fonts v3
- Иконки файлов: включены
- Кастомные цвета Catppuccin

### 📁 Lsd

**Конфиг:** `.config/lsd/`

Замена `ls` с иконками и цветами.

**Тема:** custom

### 🦇 Bat

**Конфиг:** `.config/bat/`

Замена `cat` с подсветкой синтаксиса.

**Тема:** Catppuccin Mocha

### 🚀 Fastfetch

**Конфиг:** `.config/fastfetch/`

Информация о системе с кастомным оформлением.

**Логотип:** кастомный ASCII арт

**Модули:**
- Chassis, OS, Kernel, Packages
- Display, Terminal, WM
- CPU, GPU, GPU Driver
- Memory, Disk, Uptime
- Цветовая палитра

### 🌙 Noctalia Shell

**Конфиг:** `.config/noctalia/`

Оболочка для Wayland с виджетами.

**Компоненты:**
- Launcher приложений
- Control Center
- История уведомлений
- История буфера обмена
- Bar с виджетами
- Аудио контроллер с визуализатором

---

## 🔄 Обновление конфигурации

```bash
cd ~/.dotfiles && git pull

# Переприменить конфиги (если изменилась структура)
stow .
```

---

### Шрифты

Рекомендуемые шрифты:
- JetBrainsMono Nerd Font (основной)
- Любой Nerd Font для иконок

---

## ⚠️ Примечания

- Конфигурация тестировалась на **Arch Linux**
- Требуется **Wayland** сеанс для работы Niri
- Некоторые приложения могут требовать дополнительной настройки под ваше железо
- Перед применением проверьте конфиги на совместимость с вашей системой

---

## 🤝 Вклад

Если вы нашли проблему или хотите предложить улучшение — создайте issue или pull request.

---

## 📄 Лицензия

MIT License

---

## 🔗 Полезные ссылки

- [Niri Documentation](https://github.com/YaLTeR/niri)
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)
- [Arch Wiki](https://wiki.archlinux.org/)
