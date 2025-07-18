xcode-select --install

if ! type brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

for plugin in "${plugins[@]}"; do
  git clone "https://github.com/zsh-users/$plugin" ~/.oh-my-zsh/custom/plugins/$plugin
done

curl -L -o ~/.zshrc https://raw.githubusercontent.com/elmarvr/mac/main/.zshrc
curl -L -o ~/.zprofile https://raw.githubusercontent.com/elmarvr/mac/main/.zprofile

packages=(
  nvm
  starship
  git
  oven-sh/bun/bun
)

brew install ${packages[@]}
brew cleanup

git config --global user.name "Elmar van Riet"
git config --global user.email "elmarvriet@gmail.com"

mkdir ~/.nvm
nvm install --lts
nvm use --lts

curl -L -o ~/.config/starship.toml https://raw.githubusercontent.com/elmarvr/mac/main/starship.toml

apps=(
  raycast
  visual-studio-code
  ghostty
  betterdisplay
  spotify
  docker
  whatsapp
  zen-browser
  superhuman
  obsidian
)

brew install --cask --appdir="/Applications" ${apps[@]}
brew cleanup

defaults write com.apple.dock orientation left

defaults write com.apple.dock tilesize -int 36

defaults write com.apple.dock minimize-to-application -bool false
defaults write com.apple.dock effect -string "scale"

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write com.apple.screencapture type -string "png"

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{enabled = 0;}"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

killall Dock
killall Finder

