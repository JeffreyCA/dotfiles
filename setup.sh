#!/bin/bash

# Copy .gitconfig to the home directory
cp gitconfig ~/.gitconfig

# Append contents of shell_aliases to ~/.bashrc
if [ -f shell_aliases ]; then
    echo "" >> ~/.bashrc
    cat shell_aliases >> ~/.bashrc
fi

# Append contents of exports to ~/.bashrc
if [ -f exports ]; then
    echo "" >> ~/.bashrc
    cat exports >> ~/.bashrc
fi

# Source the updated .bashrc
source ~/.bashrc

# If $MSFT_EMAIL and $MSFT_NAME are defined, set them in .gitconfig
if [ -n "$MSFT_EMAIL" ] && [ -n "$MSFT_NAME" ]; then
    git config --global user.email "$MSFT_EMAIL"
    git config --global user.name "$MSFT_NAME"
fi
