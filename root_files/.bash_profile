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

# Bash Aliases
alias gf='git flow'
alias doc='docker-compose'
alias dockerclean='docker system prune -f & docker volume prune -f'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias sourceme='. ~/.bash_profile'

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/zachcaceres/google-cloud-sdk/path.bash.inc' ]; then . '/Users/zachcaceres/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/zachcaceres/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/zachcaceres/google-cloud-sdk/completion.bash.inc'; fi

[[ -s ~/.bashrc ]] && source ~/.bashrc
export PATH="/usr/local/sbin:$PATH"
