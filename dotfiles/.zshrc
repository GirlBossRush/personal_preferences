# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

TERM=xterm-256color
LC_ALL=en_US.UTF-8

# Saner word deletion
# bindkey -M emacs '^[[3~' kill-word
# bindkey -M emacs '^H' backward-kill-word
# bindkey -M emacs '^[[3;5~' kill-word
# Aliases
alias be='bundle exec'
alias rr='bundle exec rails s'
alias resume='tmux attach'
alias gitg='tig status'
alias qqqq='exit'
alias git='noglob git'
alias thing1='bundle exec unicorn -p 3000'
alias thing2='bundle exec unicorn -p 3001'
EDITOR=/usr/bin/vim

# Frozen terminal
alias vim="stty stop '' -ixoff ; vim"
ttyctl -f

# Fixes tmux tab issues.
DISABLE_AUTO_TITLE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=$PATH:/home/eric/.oh-my-vim/bin
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# Fix tmux fork issues with RVM.
cd .

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
PATH="$HOME/.pollev/bin:$PATH"
