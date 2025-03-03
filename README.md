# init

> My personal setup scripts for macOS.

This repository contains scripts to automate the setup process for (my) new macOS systems.

The scripts are designed to be idempotent, meaning they can be safely run multiple times on the same system without causing issues.

## Features

- Installs Xcode Command Line Tools
- Installs Homebrew package manager
- Installs applications and tools via Homebrew
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

> [!NOTE]
> `git` and `curl` are installed by default on macOS, but I like to ensure they are up to date by installing them via Homebrew.

### Homebrew Casks

The following desktop applications are installed:

- **Cursor** - My preferred code editor

### Mac App Store Apps

No Mac App Store apps are currently configured for installation.


## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/lukecarr/init.git
   cd init
   ```

2. Make the init script executable:
   ```bash
   chmod +x init.sh
   ```

3. Run the init script:
   ```bash
   ./init.sh
   ```

## Requirements

- macOS operating system
- Internet connection for downloading packages

## License

This repository is licensed under the [MIT license](LICENSE).
