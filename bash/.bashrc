#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
fi

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export HISTCONTROL='ignoreboth'
export EDITOR='nvim'
alias ll='eza -lag --icons -s type'
alias cd..='cd ..'
alias lports='ss -lunt'
alias cat="bat"
alias trim_img="mogrify -trim"

# Docker
alias dc-stats="docker container stats --no-stream"
alias ds-stats="docker system df -v"

# Git
alias gspull="git stash && git pull && git stash pop"
alias glog="git log --graph --show-signature --format=fuller"
alias grcad="git rebase -i --committer-date-is-author-date"

# YT-dl
alias ytdl_vid='yt-dlp --no-mark-watched --geo-bypass --no-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata --merge-output-format mp4 -f "bestvideo[height<=1080]+bestaudio[ext=m4a]"'
alias ytdl_au='yt-dlp --no-mark-watched --geo-bypass --no-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata -f "bestaudio[ext=m4a]"'
alias ytdl_playlist_vid='yt-dlp --ignore-errors --no-mark-watched --geo-bypass --yes-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata --merge-output-format mp4 -f "bestvideo[height<=1080]+bestaudio[ext=m4a]" --output "%(playlist_index)s. %(title)s.%(ext)s"'
alias ytdl_playlist_au='yt-dlp --ignore-errors --no-mark-watched --geo-bypass --yes-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata -f "bestaudio[ext=m4a]" --output "%(playlist_index)s. %(title)s.%(ext)s"'

#eval "$(thefuck --alias --enable-experimental-instant-mode)"
eval "$(pandoc --bash-completion)"
eval "$(starship init bash)"
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

if [ -f "$HOME/.acme.sh/cloudflare" ]; then
    . "$HOME/.acme.sh/cloudflare"
fi

export PATH="/home/handz/.deta/bin:$PATH"

export PATH="/home/handz/.detaspace/bin:$PATH"
