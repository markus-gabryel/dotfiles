# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history

# General aliases:
alias \
	ls=exa \
	l='exa -la' \
	ll='exa -l' \
	la='exa -a' \
	vi=nvim \
	sudo='sudo ' \
	yank='xclip -sel c -o' \
	get='sudo apt install' \
	with='apt search' \
	purge='sudo apt purge --autoremove' \
	bc='bc -ql' \
	ip='ip -color=auto' \
	diff='diff --color=auto' \
	yd='yt-dlp' \
	zt='zathura' \
	g='git' \
	gin='git init' \
	gcl='git clone' \
	gd='git diff' \
	gst='git status' \
	gss='git status -s' \
	ga='git add' \
	gc='git commit' \
	gca='git commit --amend' \
	gcan='git commit --amend --no-edit' \
	glo='git log' \
	glg='git log --graph' \
	gr='git remote' \
	gb='git branch' \
	gba='git branch --all' \
	gco='git checkout' \
	gcb='git checkout -b' \
	gcm='git checkout master || git checkout main' \
	grs='git restore' \
	grss='git restore --staged' \
	grh='git reset HEAD' \
	grhh='git reset HEAD --hard' \
	gm='git merge' \
	gl='git pull' \
	ggl='git pull origin $(git branch --show-current)' \
	gp='git push -u' \
	ggp='git push -u origin $(git branch --show-current)'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Open the last directory opened in fff
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}
bindkey -s '^f' 'f\n'

# Use fzf to switch directories and bind it to ctrl-o
ffzf () {
	TARGET="$(find ~ -type d | fzf)" && f $TARGET
}
bindkey -s '^o' 'ffzf\n'

bindkey -s '^r' 'source ~/.zshrc\n'

bindkey -s '^s' 'tmux\n'

bindkey -s '^v' 'vi\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load syntax highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
