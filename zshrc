# This borrows from my .bashrc, of course, and also heavily from
#  claytron: http://github.com/claytron/dotfiles

UNAME=$(uname)
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my.zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/sbin:/usr/local/bin
export EDITOR=vim

# set up dir hashes
hash -d CCM=$HOME/code/chacha.me
hash -d ALN=$HOME/code/askedlastnight.com

# use vi mode
bindkey -v

# use home and end in addition to ^e and ^a
bindkey -M viins '^A' vi-beginning-of-line
bindkey -M viins '^E' vi-end-of-line
if [ $UNAME = "Linux" ]; then
  bindkey -M viins '^[OH' vi-beginning-of-line
  bindkey -M viins '^[OF' vi-end-of-line
else
  bindkey -M viins '^[[H' vi-beginning-of-line
  bindkey -M viins '^[[F' vi-end-of-line
fi
# use delete as forward delete
bindkey -M viins '\e[3~' vi-delete-char
# line buffer
bindkey -M viins '^B' push-line-or-edit
# change the '-' for up in history, always kills my command editing.
bindkey -M vicmd '^[OA' vi-up-line-or-history
# change the shortcut for expand alias
bindkey -M viins '^X' _expand_alias

# edit current command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# tetris!!
autoload -U tetris
zle -N tetris
bindkey "^t" tetris

setopt NO_BEEP
# Changing Directories
setopt AUTO_CD
setopt CDABLE_VARS
setopt AUTO_PUSHD
# History
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

source ~/.zsh/globals.sh
source ~/.zsh/aliases.sh
source ~/.zsh/git.sh
# RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
