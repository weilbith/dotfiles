# Load oh-my-zsh as base.
antigen use oh-my-zsh

# Bundle plugins
antigen bundle vi-mode
antigen bundle wd
antigen bundle git
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle npm
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

# Active everything
antigen apply
