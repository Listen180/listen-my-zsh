# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-10-19 17:30
# * Last modified : 2018-12-24 14:34
# * Filename      : .zshrc
# * Description   : 
# *********************************************************


# echo """
#           ...         
#       -sdNMMMMmy/.    
#     -dMMMMMMMMMMMN+   
#    -NMMMMMMMMMMMMMMo  
#    hMMMMMMMMMMMMMMMM. 
#    dMMMMMMMMMMMMMMMM. 
#    +MMMMMMMMMMMMMMMd  
#     +NMMMMMMMMMMMMh.  
#      .smMMMMMMMNy:    
#         .:/++/-       
#                       
#                       
#           ...         
#        .sNMMMMh:      
#       .NMMMMMMMM/     
#       -MMMMMMMMMs     
#        sMMMMMMMd.     
#         -oyhhs:       
#                                         
# """






# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH


# Some basic path
export PATH=$HOME/.local/bin:$PATH

# Path to Anacond
export ANACONDA_HOME=$HOME/anaconda3
export PATH=$ANACONDA_HOME/bin:$PATH

# pandoc path
export PATH=/usr/local/Cellar/pandoc/2.5/bin:$PATH

# Path to defult Python
# export PYTHON_PATH=/usr/local/bin/
# export PATH=$PYTHON_PATH:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="LEISen"
# ZSH_THEME="mytheme-2"
# ZSH_THEME="random"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="ys"
# ZSH_THEME="fino-time"
# ZSH_THEME="sonicradish"
# ZSH_THEME="strug"
# ZSH_THEME="emotty"
# ZSH_THEME="frontcube"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="bullet-train"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_DISABLE_COMPFIX=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source $HOME/.rvm/scripts/rvm

# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
##### Aliases #####
# make python3 as defult
# alias python=python3
# Some basic aliases
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -a -l"
alias cc="clear"
# ZSH aliases
alias actzsh="source ~/.zshrc"
alias configzsh="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Git aliases
alias gadd="git add"
alias gs="git status"
alias gc="git commit -m"
alias gpush="git push"
alias gpull="git pull"
alias gr="git reset HEAD"
alias configgit="vim ~/.gitconfig"
# tmux aliases
alias tnew="tmux new -s"
alias topen="tmux a -t"
alias tls="tmux ls"
alias tkill="tmux kill-session -t"
alias configtmux="vim ~/.tmux.conf"
alias acttmux="tmux source ~/.tmux.conf"
# other configuration aliases
alias configvim="vim ~/.vimrc"
alias actvim="source ~/.vimrc"
alias configconda="vim ~/.condarc"

alias pf="ps -ef|grep"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"



# function powerline_precmd() {
#     PS1="$(powerline-shell --shell zsh $?)"
# }
# function install_powerline_precmd() {
#     for s in "${precmd_functions[@]}"; do
# 	if [ "$s" = "powerline_precmd" ]; then
# 	    return
# 	fi
#     done
#     precmd_functions+=(powerline_precmd)
# }
# if [ "$TERM" != "linux" ]; then
#     install_powerline_precmd
# fi


#fpath=(~/.zsh/completion $fpath)

#autoload -Uz compinit && compinit -i


#etc=/Applications/Docker.app/Contents/Resources/etc
#ln -s $etc/docker.zsh-completion /usr/local/share/zsh/site-functions/_docker
#ln -s $etc/docker-machine.zsh-completion /usr/local/share/zsh/site-functions/_docker-machine
#ln -s $etc/docker-compose.zsh-completion /usr/local/share/zsh/site-functions/_docker-compose
