# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
plugins=(git rails ruby rake-fast tmux gitfast zsh-lazyload)

source $ZSH/oh-my-zsh.sh

# User configuration
lazyload kubectl -- 'source <(kubectl completion zsh)'
eval '[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"'
lazyload asdf -- 'autoload -Uz compinit && compinit'
lazyload docker -- 'sudo systemctl start docker'

path=(~/bin $HOME/.yarn/bin
      $HOME/.asdf/installs/golang/1.18/packages/bin $HOME/Documents/tools/puma-dev
      $HOME/.dotnet $HOME/.local/share/neovim/bin $ASDF_DIR/completions
      $HOME/Documents/projects/pico/picoruby/bin #picoruby
      $HOME/Documents/tools/zig-0.11.0-dev #zig
      $HOME/.asdf/shims # asdf
      $HOME/.cargo/bin
      $HOME/.local/bin # python
      $HOME/.fly/bin # flyctl
      $path
)

# . "$HOME/.asdf/asdf.sh"
# eval "$(rtx activate zsh)"
eval "$(~/.local/bin/mise activate zsh)"


# Export environment variables.
export EDITOR="subl -w"
export GPG_TTY=$TTY
export NOTES_DIR="/home/egor/Documents/notes"
export BW_SESSION=AC/TsuzH8fwspo+EI6yj1dmugUAwze6X88OTBC7HHjQuWMv/A09AvBA8DpMKepyiS+13rbuKFUwEJj2+gpq58w==
export SDKMAN_DIR="$HOME/.sdkman"
export CLOUDSDK_PYTHON_SITEPACKAGES=1
export AndroidSdkDirectory=/home/egor/Android/Sdk
export FLYCTL_INSTALL="$HOME/.fly"

ALIASES_PATH="$HOME/.aliases"
if [ -f "$ALIASES_PATH" ]; then
  source "$ALIASES_PATH"
fi

alias tree='tree -a -I .git'

if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias la="exa --long --all --group"
fi

if [ -x "$(command -v xclip)" ]; then
  alias c="tr -d '\n' | xclip -selection clipboard"
  alias cn="xclip -selection clipboard"
  #alias v="xclip -o -selection clipboard"
fi

if [ -x "$(command -v duf)" ]; then
  alias df="duf"
fi

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

#source /etc/profile.d/modules.sh
#module load mpi/openmpi-x86_64
