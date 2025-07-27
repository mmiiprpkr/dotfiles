#!/bin/bash

set -e  # Exit on error
set -u  # Treat unset variables as errors

echo "📦 Checking Homebrew..."
if ! command -v brew &> /dev/null; then
  echo "🛠 Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Installing brew packages from Brewfile..."
brew bundle --file="$HOME/dotfiles/Brewfile"

echo "📦 Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "🔌 Installing Zsh plugins..."
ZSH_PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
plugin_sources=(
  "zsh-autosuggestions=https://github.com/zsh-users/zsh-autosuggestions"
  "zsh-syntax-highlighting=https://github.com/zsh-users/zsh-syntax-highlighting"
  "zsh-history-substring-search=https://github.com/zsh-users/zsh-history-substring-search"
  "zsh-completions=https://github.com/zsh-users/zsh-completions"
  "zsh-autopair=https://github.com/hlissner/zsh-autopair"
  "fzf-tab=https://github.com/Aloxaf/fzf-tab"
)

for entry in "${plugin_sources[@]}"; do
  plugin="${entry%%=*}"
  url="${entry#*=}"
  target_dir="$ZSH_PLUGIN_DIR/$plugin"

  if [ ! -d "$target_dir" ]; then
    echo "🔌 Installing $plugin..."
    git clone "$url" "$target_dir"
  else
    echo "✅ $plugin already installed."
  fi
done

echo "🔗 Checking for GNU stow..."
if ! command -v stow &> /dev/null; then
  echo "🛠 'stow' not found. Installing..."
  brew install stow
fi

echo "🔗 Stowing dotfiles..."

DOTFILES=("zsh" "git")
for dir in "${DOTFILES[@]}"; do
  if [ -d "$HOME/$dir" ]; then
    echo "⚠️  Skipping $dir (folder exists in home)"
    continue
  fi

  dotfile="$HOME/.$dir"
  if [ -f "$dotfile" ] && [ ! -L "$dotfile" ]; then
    echo "⚠️  Backing up existing $dotfile to $dotfile.backup"
    mv "$dotfile" "$dotfile.backup"
  fi

  echo "📂 Stowing $dir..."
  stow "$dir"
done

echo "✅ Setup complete!"
