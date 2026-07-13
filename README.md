# DOTFILES

Мои персональные конфиги для Arch Linux с использованием GNU Stow для управления
символическими ссылками.

## 📋 Обзор конфигурации

| Компонент          | Описание                  |
| ------------------ | ------------------------- |
| **WM**             | Niri (Wayland композитор) |
| **Shell**          | ZSH + Oh My Zsh           |
| **Terminal**       | Kitty                     |
| **File Manager**   | Superfile (spf)           |
| **System Monitor** | Btop                      |
| **Bar/Panel**      | Noctalia Shell            |
| **Multiplexer**    | Tmux                      |
| **Git TUI**        | Lazygit                   |
| **Info Fetch**     | Fastfetch                 |
| **LS Replacement** | Lsd                       |
| **Cat Viewer**     | Bat                       |

---

## 📦 Установка

### Требования

- **Arch Linux** (или основанный на нём дистрибутив)
- **GNU Stow** — менеджер символических ссылок
- **Neovim 0.10+** с **LazyVim** (опционально, используется как редактор по умолчанию)
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
    wireplumber \
    playerctl
```

### Шаг 2: AUR пакеты

```bash
# Noctalia Shell — Wayland-шелл (бар, лаунчер, центр управления)
yay -S noctalia-shell

# Zen Browser (опционально, используется в Mod+B)
yay -S zen-browser-bin
```

### Шаг 3: Установка шрифтов

```bash
# JetBrainsMono Nerd Font (используется в kitty)
sudo pacman -S ttf-jetbrains-mono-nerd
```

### Шаг 4: Клонирование репозитория

```bash
cd ~
git clone https://github.com/NET-VLADOR/.dotfiles.git ~/.dotfiles
```

### Шаг 5: Применение конфигов через Stow

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

#### Основные горячие клавиши

| Клавиши                  | Действие                                  |
| ------------------------ | ----------------------------------------- |
|                          | **Навигация**                             |
| `Mod+H/L`                | Колонка слева/справа; на краю — монитор   |
| `Mod+J/K`                | Рабочая область ниже/выше                 |
| `Mod+Ctrl+H/L`           | Колонка слева/справа (строго)             |
| `Mod+Ctrl+J/K`           | Окно ниже/выше в колонке                  |
| `Mod+Home/End`           | Первая/последняя колонка                  |
|                          | **Перемещение**                           |
| `Mod+Shift+H/L`          | Колонка на соседний монитор (на краю)     |
| `Mod+Shift+J/K`          | Окно на соседний workspace (на краю)      |
| `Mod+Ctrl+Shift+H/J/K/L` | Перемещение окон и колонок (строго)       |
| `Mod+Ctrl+U/I`           | Колонка на workspace ниже/выше            |
| `Mod+Shift+U/I`          | Переместить workspace ниже/выше           |
|                          | **Workspaces**                            |
| `Mod+1-9`                | Переключиться на workspace 1-9            |
| `Mod+Shift+1-9`          | Колонка на workspace 1-9                  |
|                          | **Layout**                                |
| `Mod+Q`                  | Закрыть окно                              |
| `Mod+F`                  | Максимизировать колонку                   |
| `Mod+Shift+F`            | Полный экран                              |
| `Mod+Ctrl+F`             | Расширить колонку на доступную ширину     |
| `Mod+R`                  | Переключить preset ширины колонки         |
| `Mod+Shift+R`            | Переключить preset высоты окна            |
| `Mod+Ctrl+R`             | Сбросить высоту окна                      |
| `Mod+[-]`                | Уменьшить/увеличить ширину колонки на 10% |
| `Mod+[.]`                | Уменьшить/увеличить высоту окна на 10%    |
| `Mod+C`                  | Центрировать колонку                      |
| `Mod+Ctrl+C`             | Центрировать все видимые колонки          |
| `Mod+W`                  | Вкладки в колонке (tabbed mode)           |
| `Mod+[` / `Mod+]`        | Втянуть/вытолкнуть окно влево/вправо      |
|                          | **Launch**                                |
| `Mod+T`                  | Терминал (Kitty)                          |
| `Mod+B`                  | Браузер (Zen Browser)                     |
| `Alt+Space`              | Лаунчер приложений                        |
| `Mod+E`                  | Файловый менеджер (spf)                   |
|                          | **System**                                |
| `Mod+O`                  | Overview                                  |
| `Mod+Shift+Slash`        | Шпаргалка по хоткеям                      |
| `Mod+Escape`             | Центр управления                          |
| `Mod+N`                  | История уведомлений                       |
| `Mod+V`                  | История буфера обмена                     |
| `Ctrl+Shift+Escape`      | Монитор ресурсов (btop)                   |
| `Mod+Delete`             | Выйти из niri                             |
| `Mod+Shift+P`            | Выключить мониторы                        |

#### Структура конфигов Niri

```shell
niri/
├── config.kdl          # Основной конфиг
├── noctalia.kdl        # Цвета и интеграция с Noctalia
└── includes/
    ├── binds.kdl       # Горячие клавиши
    ├── input.kdl       # Настройки ввода
    ├── layout.kdl      # Layout: gaps, focus-ring, border, shadow
    ├── outputs.kdl     # Настройки дисплеев
    ├── rules.kdl       # Правила для окон
    ├── startup.kdl     # Автозапуск, cursor, animations
    └── workspaces.kdl  # Настройки рабочих областей
```

### 🐚 ZSH

**Конфиг:** `.zshrc`

Оболочка с плагинами:

- **Oh My Zsh** — фреймворк для zsh
- **zsh-autosuggestions** — автодополнение команд
- **zsh-syntax-highlighting** — подсветка синтаксиса
- **git** — алиасы для git

#### Алиасы

```bash
alias ls=lsd
```

#### Функции

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

#### Плагины

- **tpm** — менеджер плагинов
- **catppuccin/tmux** — тема Catppuccin Mocha
- **vim-tmux-navigator** — навигация vim-style между панелями
- **tmux-which-key** — отображение доступных клавиш

#### Горячие клавиши

| Клавиши            | Действие                   |
| ------------------ | -------------------------- |
| `prefix + r`       | Перезагрузить конфиг       |
| `prefix + \`       | Вертикальное разделение    |
| `prefix + -`       | Горизонтальное разделение  |
| `prefix + c`       | Новое окно                 |
| `prefix + h/j/k/l` | Изменение размера панелей  |
| `prefix + m`       | Zoom панели                |
| `prefix + v`       | Начало выделения (vi-mode) |
| `prefix + y`       | Копирование в буфер        |

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

Если вы нашли проблему или хотите предложить улучшение — создайте issue или pull
request.

---

## 📄 Лицензия

MIT License

---

## 🔗 Полезные ссылки

- [Niri Documentation](https://github.com/YaLTeR/niri)
- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [Catppuccin Theme](https://github.com/catppuccin/catppuccin)
- [Arch Wiki](https://wiki.archlinux.org/)
