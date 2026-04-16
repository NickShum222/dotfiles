if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
bindkey -v


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

# Git Shortcuts
alias gaa='git add .'
alias gca='git commit -a -m'
alias gp='git push '
alias gsw='git switch'

alias lg='lazygit'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
export _ZO_ECHO=1
export _ZO_RESOLVE_SYMLINKS=0

export EDITOR="nvim"

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
setopt inc_append_history       # append to history, don’t overwrite
setopt hist_ignore_space        # ignore commands starting with space
setopt hist_reduce_blanks       # remove superfluous blanks
setopt hist_find_no_dups        # skip duplicates in history search

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias reload="source ~/.zshrc"
alias ls="ls -lh --color=auto"

export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export PATH=$JAVA_HOME/bin:$PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2025-12-18 02:46:13
export PATH="$PATH:/Users/nickshum/.local/bin"

export MANPAGER="nvim +Man!"
