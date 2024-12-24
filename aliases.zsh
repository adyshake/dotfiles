# Run per directory
run_per_dir()
{
    for d in ./*/ ; do (cd "$d" && $1); done
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

# Git
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gdn="git diff --name-only"
alias gl="git log"
alias gp="git pull"
alias gpr="git pull --rebase"
alias glo="git fetch && git log HEAD..origin"
alias gca='git commit --amend'

# Flush DNS
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

# Preview Files Before Selecting Them
alias fzfp="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
