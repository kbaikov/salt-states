alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'

alias sudo='sudo '

alias docker='podman'
alias uu='sudo apt update && sudo apt upgrade -y'

alias venv='python3 -m venv .venv && echo "*" > .venv/.gitignore && source .venv/bin/activate && pip install --upgrade pip wheel setuptools'
alias pir='pip install --upgrade pip wheel setuptools && pip install -r requirements-dev.txt'

alias grep='rg'
alias cat='bat'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'


## git alias
alias gca='git commit --amend'
alias gs='git status -s'
alias ga='git add'
alias gc='git checkout'
alias gln='git log --name-only'
alias gl='git log --oneline --graph'
alias gd='git diff'
alias grc='git rebase --continue'
alias gra='git rebase --abort'

alias grm='git rebase -i master'
alias grs='git rebase -i 2.0.0_check_mk'
alias gro='git rebase -i 1.6.0_check_mk'

alias gprm='gc master; git pull; gc -;'
alias gprs='gc 2.0.0_check_mk; git pull; gc -;'
alias gpro='gc 1.6.0_check_mk; git pull; gc -;'

alias gpm='git push --no-thin origin HEAD:refs/for/master'
alias gpo='git push --no-thin origin HEAD:refs/for/1.6.0'
alias gps='git push --no-thin origin HEAD:refs/for/2.0.0'

## site control
alias suheute="sudo su - heute"
alias suold="sudo su - old"
alias sustable="sudo su - stable"