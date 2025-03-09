#!/bin/zsh

# disable Homebrew environment hints
export HOMEBREW_NO_ENV_HINTS=1

# function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# function to print status messages
print_status() {
    echo "🔍 $1"
}

# function to print success messages
print_success() {
    echo "✅ $1"
}

# function to print error messages
print_error() {
    echo "❌ $1"
}

# check and install Xcode Command Line Tools
if ! command_exists xcode-select; then
    print_status "Installing Xcode Command Line Tools..."
    xcode-select --install
else
    print_success "Xcode Command Line Tools are already installed"
fi

# print Xcode Command Line Tools version to confirm installation
if command_exists xcode-select; then
    version=$(xcode-select -v | sed 's/xcode-select version //' | sed 's/\.$//')
    print_success "xcode-select version: $version"
fi

# check and install Homebrew
if ! command_exists brew; then
    print_status "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    print_success "Homebrew is already installed"
fi

# print Homebrew version to confirm installation
if command_exists brew; then
    version=$(brew --version | sed 's/Homebrew //')
    print_success "brew version: $version"
fi

# function to apply taps
apply_brew_taps() {
  local tap_packages=("$@")
  for tap in "${tap_packages[@]}"; do
    if brew tap | grep "$tap" > /dev/null; then
      print_success "Tap $tap is already applied"
    else
      brew tap "$tap"
    fi
  done
}

# function to install formulas
install_brew_formulas() {
  local formulas=("$@")
  for formula in "${formulas[@]}"; do
    if brew list --formula | grep "$formula" > /dev/null; then
      print_success "Formula $formula is already installed"
    else
      print_status "Installing package < $formula >"
      brew install "$formula"
    fi
    # Display version of installed formula
    if brew list --formula | grep "$formula" > /dev/null; then
      version=$(brew info "$formula" | grep -E "$formula:" | awk '{print $4}')
      print_success "$formula version: $version"
    fi
  done
}

# function to install casks
install_brew_casks() {
  local casks=("$@")
  for cask in "${casks[@]}"; do
    if brew list --cask | grep "$cask" > /dev/null; then
      print_success "Cask $cask is already installed"
    else
      print_status "Installing cask < $cask >"
      brew install --cask "$cask"
    fi
    # Display version of installed cask
    if brew list --cask | grep "$cask" > /dev/null; then
      version=$(brew info --cask "$cask" | grep -E "$cask:" | awk '{print $3}')
      print_success "$cask version: $version"
    fi
  done
}

# apply the taps first
taps=()
apply_brew_taps "${taps[@]}"

# install casks
apps=(cursor docker warp signal notion)
install_brew_casks "${apps[@]}"

# install formulas
packages=(git curl stow mas jq)
install_brew_formulas "${packages[@]}"

# function to install App Store apps
install_mas_apps() {
  local apps=("$@")
  for app in "${apps[@]}"; do
    if mas list | grep "$app" > /dev/null; then
      print_success "App $app is already installed"
    else
      print_status "Installing app < $app >"
      mas install "$app"
    fi
  done
}

# install App Store apps
mas_apps=(
  897283731 # Strongbox Password Manager
  1475387142 # Tailscale
  1461845568 # Gifox
)
install_mas_apps "${mas_apps[@]}"

# install oh-my-zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
  print_success "oh-my-zsh is already installed"
else
  print_status "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
