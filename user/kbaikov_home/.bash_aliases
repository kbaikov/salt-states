alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias sudo='sudo '

alias docker='podman'
alias uu='sudo apt update && sudo apt upgrade -y'

alias venv='python3 -m venv .venv && echo "*" > .venv/.gitignore && source .venv/bin/activate && python3 -m pip install --upgrade pip wheel setuptools'
alias pir='python3 -m pip install --upgrade pip wheel setuptools && python3 -m pip install -r requirements.txt'