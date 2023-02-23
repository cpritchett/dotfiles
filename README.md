Dotfiles managed with Chezmoi

* Cross platform -- MacOS, Linux, Windows with WSL2
* Editors -- neovim, nano
* Shell -- zsh (zim plugin manager, spaceship prompt), bash

## Install Chezmoi

On Linux (no snap, with one command):
`sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply $GITHUB_USERNAME`

On Linux (with Snap):
`snap install chezmoi --classic`

On Mac (with homebrew)
`brew install chezmoi`

