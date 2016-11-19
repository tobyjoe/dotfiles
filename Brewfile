#!/bin/sh

# The basics, first ---
cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'thoughtbot/formulae'
tap 'homebrew/services'
tap 'caskroom/fonts'
tap 'homebrew/dupes'

# Unix
brew 'ctags'
brew 'git'
brew 'openssl'
brew 'rcm'
brew 'reattach-to-user-namespace'
brew 'the_silver_searcher'
brew 'tmux'
brew 'zsh'
brew 'zsh-completions'
# Install GNU core utilities (those that come with macOS are outdated)
brew 'coreutils'

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew 'findutils'

# Install Bash 4
brew 'bash'

# Install more recent versions of some macOS tools
brew 'homebrew/dupes/grep'

# Docker
brew 'docker'
brew 'docker-machine'

# Mac App Store
brew 'mas'

brew 'vim'

brew 'awscli'
brew 'tree'
brew 'wget'

# GitHub
brew 'hub'

# Mackup backup manager for app preferences
brew 'mackup'

# Languages
brew 'go', args: ['--cross-compile-common']
brew 'scala'
brew 'terraform'
brew 'node'

# Virtualbox
cask 'virtualbox'
cask 'virtualbox-extension-pack'

# Veertu
cask 'veertu-desktop'

# Java
cask 'java' unless system '/usr/libexec/java_home --failfast'

# Install quicklook plugins with brew-cask
# (https://github.com/sindresorhus/quick-look-plugins)
cask 'betterzipql'
cask 'qlcolorcode'
cask 'qlimagesize'
cask 'qlmarkdown'
cask 'qlprettypatch'
cask 'qlstephen'
cask 'quicklook-csv'
cask 'quicklook-json'
cask 'suspicious-package'

# Install fonts
cask 'font-inconsolata-dz-for-powerline'
cask 'font-inconsolata'
cask 'font-meslo-lg-for-powerline'
cask 'font-hack'
cask 'font-source-code-pro'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'

# Editors & Dev Tools
cask 'intellij-idea'
cask 'iterm2'
cask 'atom'

# Productivity
cask 'alfred'

# Diff Tools
cask 'kdiff3'
cask 'Kaleidoscope'
cask 'meld'

# Mac App Store
mas 'Xcode', id: 497799835
mas 'magnet', id: 441258766
mas 'disk aid', id: 1007358832
mas 'quiver', id: 866773894
mas 'tweetbot', id: 557168941
mas '1Password', id: 443987910
#mas 'omnigraffle', id: 1142578753
