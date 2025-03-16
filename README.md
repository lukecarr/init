# init

> My personal setup scripts for macOS.

This repository contains scripts to automate the setup process for (my) new macOS systems.

The scripts are designed to be idempotent, meaning they can be safely run multiple times on the same system without causing issues.

## Features

- Installs Xcode Command Line Tools
- Installs Homebrew package manager
- Installs applications and tools via Homebrew
- Installs oh-my-zsh
- Sets up macOS preferences and configurations
- Provides clear status messages during installation
- Safe to run on existing systems

## Installed Software

### Homebrew Formulas

The following command-line tools are installed:

- **git** - Distributed version control system
- **curl** - Command line tool for transferring data with URLs
- **stow** - Symlink farm manager for managing [dotfiles](https://github.com/lukecarr/dotfiles)
- **mas** - Mac App Store command-line interface
- **jq** - Command-line JSON processor

> [!NOTE]
> `git`, `curl`, and `jq` are installed by default on macOS, but I like to ensure they are up to date by installing them via Homebrew.

### Homebrew Casks

The following desktop applications are installed:

- **Cursor** - My preferred code editor
- **Docker** - Containerisation platform (includes Docker Desktop)
- **Warp** - Terminal emulator
- **Gifox** - GIF screen recorder
- **Signal** - Instant messaging
- **Notion** - Note taking
- **UTM** - Virtual machines (e.g. Windows)
- **Steam** - Games
- **Cloudflare Warp** - DNS

### Mac App Store Apps

The following applications are installed from the App Store:

- **Strongbox** - KeePass-compatible password manager
- **Tailscale** - WireGuard-based VPN

## Requirements

- macOS operating system
- Internet connection for downloading packages

## Usage

1. Clone the repository and navigate to the directory:

   ```bash
   git clone https://github.com/lukecarr/init.git
   cd init
   ```

1. Make the init script executable:

   ```bash
   chmod +x init.sh
   ```

1. Run the init script:

   ```bash
   ./init.sh
   ```

## License

This repository is licensed under the [MIT license](LICENSE).
