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
plugins=(git)

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

eval "$(rbenv init -)"

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"

alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gdn="git diff --name-only"
alias gl="git log"
alias gp="git pull"
alias gpr="git pull --rebase"
alias glo="git fetch && git log HEAD..origin"
alias gca='git commit --amend'

run_per_dir()
{
    for d in ./*/ ; do (cd "$d" && $1); done
}

# Set correct MediaCreate/Modify dates from file properties (For Apple Photos, mostly)
function fix_date() {
	exiftool -overwrite_original -r -ext "$1" "-FileModifyDate>CreateDate" ./
	exiftool -overwrite_original -r -ext "$1" "-CreateDate>MediaCreateDate" ./
	exiftool -overwrite_original -r -ext "$1" "-CreateDate>MediaModifyDate" ./
	exiftool -overwrite_original -r -ext "$1" "-CreateDate>FileModifyDate" ./	
}

# Convert any format to mp4
function convert_to_mp4() {
	for file in *; do ffmpeg -i "$file" -c:v libx264 -crf 23 -c:a aac -map_metadata 0 "${file}_output.mp4"; done
}

# Convert any format to mp4
function convert_to_mp4_without_reencoding() {
	for file in *; do ffmpeg -i "$file" -c copy "${file}_output.mp4"; done
}

# Download an mp3 from a YouTube link
function download_mp3() {
	yt-dlp -x --audio-format mp3 --prefer-ffmpeg "$1"
}

# Download an mp4 from a YouTube link
function download_mp4() {
  yt-dlp -f 'bv[height=1080][ext=mp4]+ba[ext=m4a]' --merge-output-format mp4 "$1"
}

function split_tracks() {
	mp3splt -c *.cue *.mp3
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"
export FZF_CTRL_T_COMMAND="fd --type file --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"
export FZF_ALT_C_COMMAND="fd --type directory --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"

alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"
