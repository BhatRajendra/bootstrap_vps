# for go air
export PATH="$PATH:$HOME/go/bin"
export EDITOR='nvim'
export VISUAL='nvim'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bhatraj/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bhatraj/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bhatraj/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bhatraj/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for vim binding keys in terminal
# bindkey -v
# for normal keybinding in terminal
bindkey -e


#for starship plugin for alacritty
# ~/.zshrc
eval "$(starship init zsh)"
export PATH="$PATH:/Library/PostgreSQL/16/bin"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# my personal shortcuts
# fzf directories
fdd() {
  local dir
  dir=$(fd --type d --exclude .git | fzf) || return
  cd "$dir"
}

# fzf files
alias fdf="fd --type f --exclude .git | fzf --preview='bat --color=always {}' | xargs nvim"

# fzf terminal history
fdt-widget() {
  # 1. Clear the error state to prevent Starship loops
  emulate -L zsh
  
  local cmd
  # Fetch history, remove duplicates, and open fzf
  # cmd=$(history -n 1 | awk '!seen[$0]++' | fzf --height 40% --reverse)
  cmd=$(fc -r -n -l 1| awk '!seen[$0]++' | fzf --height 40% --reverse)

  # 2. Only modify the buffer if a command was actually selected (not ESC)
  if [[ -n "$cmd" ]]; then
    LBUFFER="$cmd"
  fi

  # 3. Use 'zle redisplay' instead of 'reset-prompt' 
  # This is much safer with Starship and avoids the nesting error
  zle redisplay
}

# Register the widget
zle -N fdt-widget
# DO NOT bind it to 'fdt' or 'c' - that causes the infinite typing loop
bindkey '^u' fdt-widget
alias z="zellij"
alias nvimconf="cd ~/.config/nvim && nvim ."
alias n="nvim ."
alias c="clear"

# main project
alias m="cd /Users/bhatraj/Yuddhaa/LedgerIt_backend/"

# side project 
alias s="cd /Users/bhatraj/Yuddhaa/backwater/"

# alias g="cd ~/pgm\ files/go && nvim main.go"
# alias gt="cd ~/pgm\ files/go"

# alias r="cd ~/pgm\ files/rust_cargo && nvim ."

# alias psql="/Library/PostgreSQL/16/scripts/runpsql.sh; exit"


# always change to the current project

# alias p="cd ~/pgm\ files/my\ projects/DistributedFileStorage && nvim main.go"
# alias pt="cd ~/pgm\ files/my\ projects/DistributedFileStorage"

# alias p2="cd ~/pgm\ files/my\ projects/Monkey_interpreter && nvim main.go"
# alias p2t="cd ~/pgm\ files/my\ projects/Monkey_interpreter"
#
# alias p="cd ~/pgm\ files/my\ projects/real_estate && nvim ."
# alias pt="cd ~/pgm\ files/my\ projects/real_estate"

# alias c="cd ~/Yuddhaa/CoverDrive && nvim main.go"
# alias ct="cd ~/Yuddhaa/CoverDrive"


# yazi related
alias y="yazi"
# function y() {
# 	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
# 	yazi "$@" --cwd-file="$tmp"
# 	IFS= read -r -d '' cwd < "$tmp"
# 	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
# 	rm -f -- "$tmp"
# }
#
#

# function zl() {
#     cmd=$(z ls -s | fzf) || return
#     z a "$cmd"
# }
function zl() {
    # Check if the first argument is -n and a session name is provided
    if [[ "$1" == "-n" && -n "$2" ]]; then
        # Use 'attach --create' to start a new session with your layout
        # or attach to it if you accidentally run it twice.
        zellij --layout ~/.config/zellij/dev.kdl attach -c "$2"
    else
        # Your original logic: Pick an existing session using fzf
        # 'z ls -s' lists sessions, 'z a' attaches to the selection
        cmd=$(zellij list-sessions -s | fzf) || return
        zellij attach "$cmd"
    fi
}


#source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt appendhistory
# setopt sharehistory
# setopt histignoredups
# setopt histignorespace
