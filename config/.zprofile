prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}



export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

export PYTHONPATH="~/Library/Python/3.6/bin"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
export CLICOLOR=1

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/redis@3.2/bin:$PATH"

# added by Miniconda3 installer
export PATH="/Users/zachcaceres/miniconda3/bin:$PATH"
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/zachcaceres/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/zachcaceres/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/zachcaceres/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/zachcaceres/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# GOPATH binaries for convenience
export PATH=$PATH:$(go env GOPATH)/bin

export PATH="/usr/local/sbin:$PATH"

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.zshrc ]] && source ~/.zshrc

# Aliases
alias ll="ls -1a"
alias ssh="echo 'You should consider using mosh instead' && ssh"
alias yarn-update="curl --compressed -o- -L https://yarnpkg.com/install.sh | bash"
alias man="echo 'You should consider using tldr instead' && man $1"
alias gf='git flow'
alias doc='docker-compose'
alias dockerclean='docker system prune -f & docker volume prune -f'
alias brewup='npm update -g & yarn global upgrade & softwareupdate -l & tldr --update & brew update; brew upgrade; brew cleanup; brew doctor; conda update -n base -c defaults conda;'
alias pythonup='pip install --upgrade pip; pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U'
alias sourceme='. ~/.zprofile'
# serve current directory on port 80
alias servedir='python -m http.server 8080'

export NPM_TOKEN='ae81c50d-9612-4bba-afe0-d468f2c5235f'
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
