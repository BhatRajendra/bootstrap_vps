# for go air
export PATH="$HOME/go/bin:$PATH"
export EDITOR='nvim'
export VISUAL='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# for vim binding keys in terminal
# bindkey -v
# for normal keybinding in terminal
bindkey -e

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

# yazi related
alias y="yazi"

# zellij related
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

# Enable git info
autoload -Uz vcs_info
precmd() { vcs_info }

# Git branch format (red)
zstyle ':vcs_info:git:*' formats ' %F{red}(%b)%f'

# Allow prompt substitution
setopt prompt_subst

PROMPT='
%n@%m in %F{cyan}%1~%f on${vcs_info_msg_0_}
%F{green}->%f '

