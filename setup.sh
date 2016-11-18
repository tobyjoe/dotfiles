#!/bin/bash

# Based on the thoughtbot laptop script, but tweaked pretty heavily...

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT
set -e

# Pull the env vars into this script from the rcm source if rcup isn't run yet
RCM_SRC_DIR="$PWD/rcm"
PROFILE="$HOME/.profile"
RCM_PROFILE="$RCM_SRC_DIR/profile"
if [ -r "$PROFILE" ]; then
  source "$PROFILE"
else
  if [ -r "$RCM_PROFILE" ]; then
    source "$RCM_PROFILE"
  fi
fi

##########################################################
# FUNCTIONS
##########################################################
fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

change_shell() {
  case "$SHELL" in
    */zsh) : ;;
    *)
      fancy_echo "Changing your shell to zsh ..."
        chsh -s "$(which zsh)"
      ;;
  esac
}

install_brew() {
  HOMEBREW_PREFIX="/usr/local"

  if [ -d "$HOMEBREW_PREFIX" ]; then
    if ! [ -r "$HOMEBREW_PREFIX" ]; then
      sudo chown -R "$LOGNAME:admin" /usr/local
    fi
  else
    sudo mkdir "$HOMEBREW_PREFIX"
    sudo chflags norestricted "$HOMEBREW_PREFIX"
    sudo chown -R "$LOGNAME:admin" "$HOMEBREW_PREFIX"
  fi

  if ! command -v brew >/dev/null; then
    fancy_echo "Installing Homebrew ..."
      curl -fsS \
        'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

      # Bring the brew PATH into this script scope
      export PATH="/usr/local/bin:$PATH"
  fi

  if brew list | grep -Fq brew-cask; then
    fancy_echo "Uninstalling old Homebrew-Cask ..."
    brew uninstall --force brew-cask
  fi
}

bundle_brew() {
  fancy_echo "Updating Homebrew formulae ..."
  brew update
  brew upgrade
  brew cleanup
  brew cask cleanup
  brew bundle
}

clone_prezto() {
  if [ ! -d "$ZDOTDIR/.zprezto" ]; then
    fancy_echo "Cloning zprezto ..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$ZDOTDIR/.zprezto"
  fi
}

clean_brew() {
  fancy_echo "Cleaning up old Homebrew formulae ..."
  brew update
  brew cleanup
  brew cask cleanup
}

run_rcup() {
  fancy_echo "Running rcup ..."
  if [ ! -r "$HOME/.rcrc" ]; then
    cp "$PWD/rcrc" "$HOME/.rcrc"
  fi

  env RCRC="$HOME/.rcrc" rcup # Once the .rcrc file is in ~, we use it
}

create_directories() {
  fancy_echo "Setting up directories ..."
  if [ ! -d "$PROJECTS_HOME" ]; then
    fancy_echo " -> Creating $PROJECTS_HOME ..."
    mkdir -p "$PROJECTS_HOME"
  fi

  if [ ! -d "$GOPATH" ]; then
    fancy_echo " -> Creating $GOPATH ..."
    mkdir -p "$GOPATH"
  fi
}

configure_git() {
  # Set git preferences
  fancy_echo "Setting up git ..."
  /bin/bash ./git.sh
}

configure_golang(){
  # Setup go
  fancy_echo "Setting up golang ..."
  /bin/bash ./golang.sh
}

configure_mac() {
  # Set macOS preferences
  # We will run this last because this will reload the shell
  fancy_echo "Configuring macOS settings ..."
  /bin/bash ./macos.sh
}
##########################################################
# Runbook
##########################################################
install_brew
bundle_brew
clean_brew
clone_prezto
run_rcup # After this, profile, zshrc, etc will be in ~ and path vars will be set
create_directories
configure_git
change_shell
configure_mac

fancy_echo "Finished ..."
