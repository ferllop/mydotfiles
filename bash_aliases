alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gcamend="git commit --amend"
alias gb="git branch"
alias gch="git checkout"
__git_complete gch _git_checkout

alias gchb="git checkout -b"
alias glo="git log --oneline -5"
alias ll='ls -lah'
alias colors='for i in {0..255}; do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo;fi;done'
