alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gdn="git diff --name-only"
alias gl="git log"
alias gp="git pull"
alias gpr="git pull --rebase"
alias glo="git fetch && git log HEAD..origin"
alias gca='git commit --amend'

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

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

# Download an mp3 from a YouTube link
function download_mp3() {
	yt-dlp -x --audio-format mp3 --prefer-ffmpeg "$1"
}

# Download an mp4 from a YouTube link
function download_mp4() {
  yt-dlp -f 'bv[height=1080][ext=mp4]+ba[ext=m4a]' --merge-output-format mp4 "$1"
}

# Split an mp3 with a cue track
function split_tracks() {
	mp3splt -c *.cue *.mp3
}

export FZF_DEFAULT_COMMAND="fd --type file --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"
export FZF_CTRL_T_COMMAND="fd --type file --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"
export FZF_ALT_C_COMMAND="fd --type directory --follow --exclude .git --exclude node_modules --exclude build --exclude env --exclude Library"

alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
