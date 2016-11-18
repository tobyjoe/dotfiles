#!/usr/bin/env bash

echo "Resetting $HOME"
cd
rcdn
rm -rf .atom
rm -rf .zprezto
rm .rcrc
rm .zcompdump
rm .zcompdump.zwc
rm .gitconfig
rm -rf .dotfiles
echo ""
ls -la
echo "All clean..."
echo ""

echo "Prepping for setup..."
export DOTFILES_HOME="$HOME/.dotfiles"
git clone git://github.com/tobyjoe/dotfiles.git $DOTFILES_HOME
cd $DOTFILES_HOME
