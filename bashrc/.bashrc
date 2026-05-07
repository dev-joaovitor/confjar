#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- Visual --- #

PS1="\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\$ "

# --- NeoVim --- #

export NVIM_DIR="$HOME/.config/nvim"
[ ! -d "$NVIM_DIR" ] && echo "NeoVim not installed"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# --- Node Version Manager (nvm) --- #

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" || echo "nvm not installed"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" || echo "nvm not installed"

# --- tmux --- #

TMUX_DEFAULT_SESSION="$HOME/tmux-scripts/main.sh"
[ -s "$TMUX_DEFAULT_SESSION" ] && "$TMUX_DEFAULT_SESSION" || echo "tmux default session not defined"

# --- Mise --- #
eval "$(~/.local/bin/mise activate bash)"

# --- Docker --- #
alias dclean="docker system prune -f"
alias dlog="docker logs -f --tail 50"
alias dstopall="([[ -z \"\$(docker ps -q)\" ]] && echo \"No containers are running\") || (docker stop \$(docker ps -q) && docker ps -a)"

# VNET ONLY
alias dvnet="docker-compose -f ~/ueek/vnet-redo/dev-env/docker-compose.dev.yml"
alias dvnetconfig="cd ~/ueek/vnet-redo/dev-env && vim"

# --- Git --- #

git_development() {
    CURRENT_BRANCH=$(git branch --show-current)

    if [[ $CURRENT_BRANCH == "development" ]]; then
        echo "Already on 'development'. Pulling..."
        git pull
        return
    fi

    git checkout development \
        && git pull \
        && git branch -d "$CURRENT_BRANCH"
}

alias gdevelopment="git_development"

# --- Aliases --- #

nvim_func() {
    # if no arguments,
    # open the current directory
    nvim ${@:-.}
}

alias ls="ls --color=auto"
alias ll="ls -lhA"
alias grep="grep --color=auto"
alias vim="nvim_func"
alias vi="vim"

# --- OK --- #
echo Everything OK with your .bashrc
echo
