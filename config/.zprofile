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
