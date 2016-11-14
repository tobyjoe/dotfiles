#!/usr/bin/env zsh
if [ -f "$(brew --prefix)/share/antigen/antigen.zsh" ]; then
  source "$(brew --prefix)/share/antigen/antigen.zsh"
  antigen bundle git
  antigen bundle command-not-found

  # Syntax highlighting bundle.
  antigen bundle zsh-users/zsh-syntax-highlighting

  # Load the theme.
  antigen theme robbyrussell

  # Tell antigen that you're done.
  antigen apply
fi
