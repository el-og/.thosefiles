# Handle Mac platforms
# CPU=$(uname -p)
# if [[ "$CPU" == "arm" ]]; then
#     export PATH="/opt/homebrew/bin:$PATH"
#     export EDITOR=/opt/homebrew/bin/nano
#     alias nano=/opt/homebrew/bin/nano
#     alias oldbrew=/usr/local/bin/brew
# else
#     export PATH="/usr/local/bin:$PATH"
#     export EDITOR=/usr/local/bin/nano
#     alias nano=/usr/local/bin/nano
# fi


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export EDITOR=nvim

# TSserver logs
set TSS_LOG=-level verbose -file  $HOME/tsserver.log

# # DISABLE CHROMIUM INSTALLATION WITH PUPETEER
# export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


# Detect nvmrc
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
#
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# COMMENTED OUT
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# Powerlevel10k no prompt
typeset -g POWERLEVEL10K_INSTANT_PROMPT=off


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
# zsh autosuggest removed
plugins=(git brew fzf vi-mode yarn zsh-interactive-cd nvm node urltools jira copyfile copypath web-search)

# auto suggestions colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias lg="lazygit"
alias v="nvim"
#alias vi="nvim"
alias vim="nvim"

alias tog="tmux attach -d -t og || tmux new -s og"
alias tssenv='tmux attach -d -t synthetic-state || tmux new-session -d -s synthetic-state \; send-keys "cd ~/Projects/data_server/nest-server/ && nvim" C-m \; split-window -v -l 30\% \; send-keys "cd ~/Projects/data_server/nest-server/ && clear" C-m \; attach-session -t synthetic-state'
alias tlizzr='tmux attach -d -t trading-journal || tmux new-session -d -s trading-journal \; send-keys "cd ~/Projects/tjog-monorepo/ && nvim" C-m \; split-window -v -l 30\% \; send-keys "cd ~/Projects/tjog-monorepo/ && clear" C-m \; attach-session -t trading-journal'
alias tnote='tmux attach -d -t notes || tmux new-session -d -s notes \; send-keys "cd ~/Obsidian/ && nvim" C-m \; split-window -v -l 30\% \; send-keys "cd ~/Obsidian/ && clear" C-m \; attach-session -t notes'


alias cls="clear"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#brew install jump for line below to work
eval "$(jump shell zsh)"

# vi mode
bindkey -v


MODE_INDICATOR="%F{yellow}--- NORMAL ---%f"
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/oskarasg/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/oskarasg/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/oskarasg/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/oskarasg/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#SuperCollider
# alias sclang=/Volumes/SuperCollider/SuperCollider.app/Contents/MacOS/sclang
# alias scsynth=/Volumes/SuperCollider/SuperCollider.app/Contents/Resources/scsynth



#Plek
export NPM_PLEK_TOKEN=

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# zsh sugar
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

eval "$(fnm env --use-on-cd)"

# fzf key bindings
eval "$(fzf --zsh)"

# Get world clock
alias world_clock="sh $HOME/.thosefiles/bin/world_clock.sh"

# SSH Agent Add
# eval "$(ssh-add --apple-use-keychain ~/.ssh/id_ed25519; ssh-add --apple-use-keychain ~/.ssh/plek_gitlab;)"
