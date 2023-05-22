# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
PATH="$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/code/other/lua-language-server/bin"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="nvim"

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL "
}

export PS1="\[\e[33m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\] \[\e[34m\]\\$\[\e[m\] "
. "$HOME/.cargo/env"

alias luamake=/home/sheodox/code/other/lua-language-server/3rd/luamake/luamake

function find_projects() {
	local PROJECT_DIR="$(fd .git$ --base-directory $HOME/code -H -E node_modules -t d --prune | sed 's/\.git.*$//' | fzf)"
	if [[ $PROJECT_DIR != "" ]]; then
		cd "$HOME/code/$PROJECT_DIR"
	fi
}
alias pj="find_projects"
alias pjn="find_projects && nvim"
alias pjdf="cd ~/dotfiles"

# short command to update sheodox-ui in a project
# sheodox-ui update -> s-u up -> suup -> soup
alias soup="npm i sheodox-ui@latest"

# used for projects where the frontend is set up in a src/static directory and i need to often go there for npm installing stuff etc.
alias static="cd src/static"
alias server="cd src/server"

alias oitsuku="~/code/go/oitsuku/oitsuku"
alias sshmon="~/code/python/sshmon/sshmon"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


