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
alias doc='docker-compose'
alias c='clear'
alias dockerclean='docker system prune -f & docker volume prune -f'
alias brewup='tldr --update && bun update -g && softwareupdate -l && brew update; brew upgrade --require-sha; brew cleanup; brew doctor && bun upgrade && brew upgrade --casks --greedy --require-sha'
alias pythonup='pip install --upgrade pip; pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U'
alias sourceme='. ~/.zprofile'
# serve current directory on port 80
alias servedir='python -m http.server 8080'
alias c='clear'
alias ls='exa'
alias la='exa -la'
alias glog='git log'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias gpu='git push upstream'
alias gpv='git push -v'
alias gr='git remote'
alias gcm='git commit -m'
alias gra='git remote add'
alias grb='git rebase'
alias gco='git checkout'
alias gf='git flow'
alias gp='git push'
alias gst='git status'
alias gcb='git checkout -b'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbs='git rebase --skip'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'
alias gsb='git status -sb'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='git stash --include-untracked'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gunignore='git update-index --no-assume-unchanged'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias v='vi'
alias copilot='gh copilot'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(/opt/homebrew/bin/brew shellenv)"

export OPEN_AI_API_KEY="PUT_API_KEY_HERE"
