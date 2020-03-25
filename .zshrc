# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
## WIP
export PATH="/usr/local/sbin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="/Users/artem.grytsaienko/.oh-my-zsh"
# Add Visual Studio Code (code)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

func ivc() {
    VERSION_UPDATE=$(python ~/bin/iv.py ./project.clj | tr -d  '\n')
    git add project.clj
    git commit -m $VERSION_UPDATE
}

function ssh-fab() {
  PROFILES=`fab profiles:short`
  if [ -n "${1}" ]; then
    MATCHED=`echo "${PROFILES}"|grep ${1}`
    NUM_MATCHED=`echo "${PROFILES}"|grep -c ${1}`
    if [ $(( NUM_MATCHED )) = 1 ]; then
      HOST=`echo "${MATCHED}" | head -n 1 | sed -e 's/: /:/g' | cut -f 2 -d : `
      echo "${MATCHED}" | grep --color=always ${1}
      ssh ${HOST} ${@:2}
    elif [ $(( NUM_MATCHED )) = 0 ]; then
      echo "Not found: ${1}"
      echo "${PROFILES}"
    else
      echo "Found many:"
      echo "${MATCHED}" | grep --color=always ${1}
    fi
  else
    echo "Usage: ${0} PROFILE [SSH-OPTS]\nProfiles:"
    echo "${PROFILES}"
  fi
}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
         git 
         osx 
         brew
	 z
	 cloudapp
         extract
         zsh-autosuggestions
         zsh-syntax-highlighting
	 )

autoload -U compinit && compinit

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
  alias chromium-browser="open -a /Applications/Chromium.app/Contents/MacOS/Chromium"
  alias dk='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
  alias branch-sort='git branch --sort=-committerdate'

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
