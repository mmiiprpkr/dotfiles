# 📦 My Dotfiles

A modular dotfiles setup managed by [GNU Stow](https://www.gnu.org/software/stow/).

## 🛠 Features

- Clean symlink management with `stow`
- Easy to install/uninstall individual configs
- Organized by tool (e.g., `zsh`, `nvim`, `git`, etc.)
- macOS and Linux compatible

Each directory contains config files for a specific application. Symlinks are created in your `$HOME` directory.

## �� Installation

### 1. Clone Repository

```bash
git clone https://github.com/mmiiprpkr/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install GNU Stow

**macOS (Homebrew):**
```bash
brew install stow
```

**Ubuntu/Debian:**
```bash
sudo apt install stow
```

### 3. Stow Configuration

Run the following in the root of the dotfiles directory:

```bash
# Example: Install zsh and git config
stow zsh git
```

This will create symlinks:

### 4. Unstow (Remove Symlinks)

```bash
stow -D zsh git
```

### 5. Stow All Configs

```bash
stow */
```
