export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git 
  macos
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-completions 
)

source $ZSH/oh-my-zsh.sh

export EDITOR="nano"

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"

export NVM_DIR=~/.nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"

eval "$(starship init zsh)"
