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

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh)"
export _ZO_ECHO=1
export _ZO_RESOLVE_SYMLINKS=0
# alias cdz='z'

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
# source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

alias run='run_java_test'

_get_java_test_classes() {
    local project_dir="/Users/nickshum/Developer/School/3B/351-ECE/ece351-labs"
    
    # Find all .class files in the build directory that start with "Test"
    find "$project_dir/build" -name "Test*.class" 2>/dev/null | \
    sed "s|$project_dir/build/||" | \
    sed 's|\.class$||' | \
    sed 's|/|.|g' | \
    sort
}

_run_java_test_completion() {
    local -a test_classes
    test_classes=($(_get_java_test_classes))
    
    _describe 'test classes' test_classes
}

compdef _run_java_test_completion run_java_test

# Main function
run_java_test() {
    local project_dir="/Users/nickshum/Developer/School/3B/351-ECE/ece351-labs"
    local current_dir=$(pwd)

    local project_dir_lc=$(echo "$project_dir" | tr '[:upper:]' '[:lower:]')
    local current_dir_lc=$(echo "$current_dir" | tr '[:upper:]' '[:lower:]')   
    # Check if we're in the project directory or a subdirectory
    if [[ "$current_dir_lc" == "$project_dir_lc"* ]]; then
        cd "$project_dir"
        
        # Compile first
        echo "Compiling project..."
        ant compile
        
        if [ $? -eq 0 ]; then
            echo "Compilation successful. Running test: $1"
            java -cp "lib/*:build" -ea org.junit.runner.JUnitCore "$1"
        else
            echo "Compilation failed. Please fix errors before running tests."
            return 1
        fi
    else
        echo "Error: Please run this command from within the ECE351 project directory or its subdirectories."
        echo "Expected project root: $project_dir"
        echo "Current directory: $current_dir"
        return 1
    fi
}
alias ssh-356='ssh -p 2224 n4shum@ece-nebula16.eng.uwaterloo.ca'

scp-356() {
  scp -P 2224 "n4shum@ece-nebula16.eng.uwaterloo.ca:~/$1" \
      ~/Developer/School/3B/356-ECE/output/
}

alias ssh-358='ssh -p 2222 n4shum@ece-nebula16.eng.uwaterloo.ca'


# Auto enable venv
# function chpwd() {
#   if [[ -d "./venv" && -f "./venv/bin/activate" ]]; then
#     source ./venv/bin/activate
#   fi
# }

# Created by `pipx` on 2025-12-18 02:46:13
export PATH="$PATH:/Users/nickshum/.local/bin"

export MANPAGER="nvim +Man!"
