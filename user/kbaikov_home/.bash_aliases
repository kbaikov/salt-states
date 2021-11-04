alias ll='ls -l --color=auto'
alias la='ls -a --color=auto'
alias l='ls -CF --color=auto'

alias sudo='sudo '

function docker {
    podman "$@"
}

export -f docker  # to make it available to scripts

function uu {
    sudo apt update
    sudo apt upgrade -y
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar) unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace) unace x ./"$n"      ;;
            *.zpaq)      zpaq x ./"$n"      ;;
            *.arc)       arc e ./"$n"       ;;
            *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                              extract $n.iso && \rm -f $n ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

alias venv='python3 -m venv .venv && echo "*" > .venv/.gitignore && source .venv/bin/activate && pip install --upgrade pip wheel setuptools'
alias pir='pip install --upgrade pip wheel setuptools && pip install -r requirements-dev.txt'

alias grep='rg'
alias cat='bat'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

#

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
