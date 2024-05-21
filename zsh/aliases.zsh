alias zshconfig="st ~/.zshrc"
alias ohmyzsh="st ~/.oh-my-zsh/"
alias lookhosts="less /etc/hosts"
alias nvimconfig="nvim ~/.config/nvim/"
alias sshconfig='vi ~/.ssh/config'

# handy file conversion tools
alias dos2unix="perl -pi -e 's/\r\n/\n/;'"
alias unix2dos="perl -pi -e 's/\n/\r\n/;'"
alias bomstrip="sed -i -s -e '1s/^\xef\xbb\xbf//'"

# enable color support of ls and also add handy aliases
#eval `dircolors -b`
#alias ls='ls -h --color=auto'
alias ll='ls -hl'
alias la='ls -hlA'
alias l='ls -hla'
alias l.='ll -d .*'
alias __='sudo !!'

alias jb='jobs -l'

# alias duh='du -h'
alias duh='diskus --size-format binary'
alias df='df -h'

alias vim='nvim'
alias lg='lazygit'

alias hgrep='history|grep'

alias gosp='cd ~/.config/sublime-text-2/Packages'

alias obliterate='rm -Rf'

alias ns='sudo netstat -nlpt'

# taken from http://unix.stackexchange.com/questions/39961/zsh-alias-s-with-parameter
background() { "$@" & }

alias veewee='bundle exec veewee'

alias sz='unzip -ql'

alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias hero='heroku'
alias hrrc='heroku run rails console'
alias hrb='heroku run bash'

alias grbom='git rebase --onto master'
alias gmnff='git merge --no-ff'

alias pbar='/Applications/PandaBar.app/Contents/MacOS/PandaBar'

unalias rm
