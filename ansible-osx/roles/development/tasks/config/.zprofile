copy_to_clipboard() {
    local file_name=$1
    if command -v pbcopy &> /dev/null; then
        cat "$file_name" | pbcopy
    elif command -v xclip &> /dev/null; then
        cat "$file_name" | xclip -selection clipboard
    elif command -v clip &> /dev/null; then
        cat "$file_name" | clip
    elif command -v wl-copy &> /dev/null; then
        cat "$file_name" | wl-copy
    else
        echo "Clipboard tool not found, couldn't save $file_name"
    fi
}

copy_diff() {
    local file_name=$1
    local exclusions=()

    # List of lock files to potentially exclude
    local lock_files=(
        "package-lock.json" "yarn.lock" "pnpm-lock.yaml" "composer.lock"
        "Gemfile.lock" "Cargo.lock" "Pipfile.lock" "poetry.lock"
        "packages.lock.json" "go.sum" "build.sbt.lock" "mix.lock"
        "pubspec.lock" "Package.resolved" "cabal.project.freeze" "deps.edn"
        "rebar.lock" "opam.locked" "gradle.lockfile"
    )

    # Build exclusion list based on existing files
    for lock_file in "${lock_files[@]}"; do
        if git ls-files "$lock_file" --error-unmatch &> /dev/null; then
            exclusions+=("':!$lock_file'")
        fi
    done

    # Construct and execute the git diff command
    if [ ${#exclusions[@]} -eq 0 ]; then
        git diff --cached > "$file_name"
    else
        eval "git diff --cached ${exclusions[*]}" > "$file_name"
    fi

    if [ -s "$file_name" ]; then
        echo "Generating commit message..."
    else
        echo "No changes detected. Please stage some files before using magic_diff."
        rm "$file_name"  # Clean up the empty diff file
    fi
}

magic_diff() {
    local timestamp=$(date +"%Y%m%d_%H%M%S")
    local diff_file_name=$(mktemp /tmp/magic_diff_staged_diff.$timestamp.txt)
    local commit_file_name=$(mktemp /tmp/magic_diff_commit.$timestamp.txt)
    copy_diff $diff_file_name

    if [ -f "$diff_file_name" ]; then
        diff_content=$(<"$diff_file_name")

        # Check llm command existence
        if ! command -v llm &> /dev/null; then
            echo "llm command not found. Please ensure it's installed and in your PATH."
        fi

        llm "Generate a git commit message based on the following diff. Do NOT include any backticks (\`) or quotation marks of any kind because that will BREAK the message. DO NOT INCLUDE BACKTICK OR QUOTATION MARK CHARACTERS. You can use formatting like lists if needed. Do NOT say comments like 'here is a commit message'. Do not include the diff in your commit message. Just write the commit message based on this diff: $diff_content" > "$commit_file_name"

        # Replace backticks with single quotes in the commit file. Models often include backticks and this breaks the git commit message.
        sed -i.bak "s/\`/'/g" "$commit_file_name" && rm "${commit_file_name}.bak"

        copy_to_clipboard "$commit_file_name"
        echo "Message copied to clipboard"

        rm "$diff_file_name"

        if [ -f "$commit_file_name" ]; then
            rm "$commit_file_name"
        fi
    else
        echo "Failed to create or find diff file."
    fi
}


git_diff() {
    # with credit to Chong-U Lim
    local file_name=${1:-staged_diff.txt}
    git diff --cached > "$file_name"
    if command -v pbcopy &> /dev/null; then
        git diff --cached | pbcopy
        echo "Diff saved to $file_name and copied to clipboard (macOS)."
    elif command -v xclip &> /dev/null; then
        git diff --cached | xclip -selection clipboard
        echo "Diff saved to $file_name and copied to clipboard (Linux)."
    elif command -v clip &> /dev/null; then
        git diff --cached | clip
        echo "Diff saved to $file_name and copied to clipboard (Windows)."
    else
        echo "Clipboard tool not found. Diff saved to $file_name."
    fi
}

prompt_git() {
  local s=''
  local branchName=''

  # Check if the current directory is in a Git repository.
  if [ $(
    git rev-parse --is-inside-work-tree &>/dev/null
    echo "${?}"
  ) == '0' ]; then

    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]; then

      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?'
      fi

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi

    fi

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2>/dev/null ||
      git rev-parse --short HEAD 2>/dev/null ||
      echo '(unknown)')"

    [ -n "${s}" ] && s=" [${s}]"

    echo -e "${1}${branchName}${2}${s}"
  else
    return
  fi
}

[[ -s ~/.zshrc ]] && source ~/.zshrc

# Aliases
alias ll="ls -1a"
alias ssh="echo 'You should consider using mosh instead' && ssh"
alias yarn-update="curl --compressed -o- -L https://yarnpkg.com/install.sh | bash"
alias man="echo 'You should consider using tldr instead' && man $1"
alias doc='docker-compose'
alias dockerclean='docker system prune -f & docker volume prune -f'
alias brewup='tldr --update && bun upgrade --stable && bun update -g && softwareupdate -l && brew update; brew upgrade --require-sha; brew cleanup; brew doctor; bun upgrade; brew upgrade --casks --greedy --require-sha --dry-run'
alias pythonup='pip install --upgrade pip; pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U'
alias sourceme='. ~/.zprofile'
# serve current directory on port 80
alias servedir='python -m http.server 8080'
alias c='clear'

# Cargo (needed before eza alias)
export PATH="$HOME/.cargo/bin:$PATH"

alias ls='eza'
alias la='eza -la'
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
alias b='bun'
alias copilot='gh copilot'
alias spot='ncspot'

copilot_what-the-shell() {
  TMPFILE=$(mktemp)
  trap 'rm -f $TMPFILE' EXIT
  if /opt/homebrew/bin/github-copilot-cli what-the-shell "$@" --shellout $TMPFILE; then
    if [ -e "$TMPFILE" ]; then
      FIXED_CMD=$(cat $TMPFILE)
      print -s "$FIXED_CMD"
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    fi
  else
    return 1
  fi
}
alias '??'='copilot_what-the-shell'

copilot_git-assist() {
  TMPFILE=$(mktemp)
  trap 'rm -f $TMPFILE' EXIT
  if /opt/homebrew/bin/github-copilot-cli git-assist "$@" --shellout $TMPFILE; then
    if [ -e "$TMPFILE" ]; then
      FIXED_CMD=$(cat $TMPFILE)
      print -s "$FIXED_CMD"
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    fi
  else
    return 1
  fi
}
alias 'git?'='copilot_git-assist'

copilot_gh-assist() {
  TMPFILE=$(mktemp)
  trap 'rm -f $TMPFILE' EXIT
  if /opt/homebrew/bin/github-copilot-cli gh-assist "$@" --shellout $TMPFILE; then
    if [ -e "$TMPFILE" ]; then
      FIXED_CMD=$(cat $TMPFILE)
      print -s "$FIXED_CMD"
      eval "$FIXED_CMD"
    else
      echo "Apologies! Extracting command failed"
    fi
  else
    return 1
  fi
}
alias 'gh?'='copilot_gh-assist'
alias 'wts'='copilot_what-the-shell'
alias 'md'='magic_diff'

eval "$(/opt/homebrew/bin/brew shellenv)"


