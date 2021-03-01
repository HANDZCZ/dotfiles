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

export EDITOR='nvim'
alias ll='ls -lah'
alias cd..='cd ..'
alias lports='ss -lunt'

alias ytdl_vid='youtube-dl --no-mark-watched --geo-bypass --no-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata --merge-output-format mp4 -f "bestvideo[height<=1080]+bestaudio[ext=m4a]"'
alias ytdl_au='youtube-dl --no-mark-watched --geo-bypass --no-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata -f "bestaudio[ext=m4a]"'
alias ytdl_playlist_vid='youtube-dl --ignore-errors --no-mark-watched --geo-bypass --yes-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata --merge-output-format mp4 -f "bestvideo[height<=1080]+bestaudio[ext=m4a]" --output "%(playlist_index)s. %(title)s.%(ext)s"'
alias ytdl_playlist_au='youtube-dl --ignore-errors --no-mark-watched --geo-bypass --yes-playlist --cache-dir ~/.cache/youtube-dl --embed-thumbnail --add-metadata -f "bestaudio[ext=m4a]" --output "%(playlist_index)s. %(title)s.%(ext)s"'

eval "$(thefuck --alias --enable-experimental-instant-mode)"
eval "$(pandoc --bash-completion)"
