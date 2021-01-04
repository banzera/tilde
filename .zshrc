# Uncomment to profile shell startup
# taken from https://esham.io/2018/02/zsh-profiling
#
# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '

# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile

# setopt XTRACE
# ------------------------------------
zmodload zsh/zprof

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

HIST_STAMPS="yyyy-mm-dd"

# ZSH_TMUX_AUTOSTART=true
# ZSH_TMUX_ITERM2=tue

# zplug "plugins/better-history-search", from:oh-my-zsh
# zplug "plugins/git-delete-history",    from:oh-my-zsh
# zplug "zsh-users/zsh-completions"
zplug "joshuarubin/zsh-homebrew"

zplug "Tarrasch/zsh-autoenv"

zplug "robbyrussell/oh-my-zsh",        use:"lib/*.zsh"

zplug "mafredri/zsh-async",            from:github
# zplug "denysdovhan/spaceship-prompt",  from:github, use:spaceship.zsh, as:theme
# zplug "sindresorhus/pure",             from:github, use:pure.zsh, as:theme
# zplug "~/.tilde/zsh", from:local, as:theme

zplug "plugins/aws",                   from:oh-my-zsh
zplug "plugins/bundler",               from:oh-my-zsh
zplug "plugins/common-aliases",        from:oh-my-zsh
zplug "plugins/chucknorris",           from:oh-my-zsh
# zplug "plugins/cp",                    from:oh-my-zsh
zplug "plugins/docker",                from:oh-my-zsh
zplug "plugins/docker-compose",        from:oh-my-zsh
# zplug "plugins/extract",               from:oh-my-zsh
# zplug "plugins/fasd",                  from:oh-my-zsh
zplug "plugins/fzf",                   from:oh-my-zsh
# zplug "plugins/gem",                   from:oh-my-zsh
zplug "plugins/git",                   from:oh-my-zsh
zplug "plugins/git-extras",            from:oh-my-zsh
zplug "plugins/git-flow-avh",          from:oh-my-zsh
zplug "plugins/github",                from:oh-my-zsh
zplug "plugins/gitignore",             from:oh-my-zsh
zplug "plugins/heroku",                from:oh-my-zsh
# zplug "plugins/mix",                   from:oh-my-zsh
# zplug "plugins/mix-fast",              from:oh-my-zsh
# zplug "plugins/perms",                 from:oh-my-zsh
zplug "plugins/pj",                    from:oh-my-zsh
zplug "plugins/postgres",              from:oh-my-zsh
# # zplug "plugins/osx",                   from:oh-my-zsh
# zplug "plugins/rsync",                 from:oh-my-zsh
zplug "plugins/rails",                 from:oh-my-zsh
# zplug "plugins/rake-fast",             from:oh-my-zsh
# zplug "plugins/ruby",                  from:oh-my-zsh
zplug "plugins/rvm",                   from:oh-my-zsh
zplug "plugins/sublime",               from:oh-my-zsh
# zplug "plugins/themes",                from:oh-my-zsh
# zplug "plugins/tmux",                  from:oh-my-zsh
# zplug "plugins/tmuxinator",            from:oh-my-zsh
# zplug "plugins/vagrant",               from:oh-my-zsh
# zplug "plugins/web-search",            from:oh-my-zsh
# zplug "plugins/yarn",                  from:oh-my-zsh

zplug "DhavalKapil/luaver"
zplug "lukechilds/zsh-nvm"
zplug 'wfxr/forgit'

zplug "~/.tilde/zsh", from:local

PROJECT_PATH_BASE=~/Projects/
PROJECT_PATHS=($PROJECT_PATH_BASE `ls -1d $PROJECT_PATH_BASE*/`)

zplug check --verbose || zplug install
zplug load

unalias rm

export EDITOR="/usr/local/bin/subl --wait"
export VISUAL=$EDITOR

export JRUBY_OPTS="--debug"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

export DISABLE_SPRING=1

[ -f ~/.iterm2_shell_integration.zsh ] && . ~/.iterm2_shell_integration.zsh

export FZF_DEFAULT_COMMAND='
  (git ls-tree -r --name-only HEAD ||
   find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
      sed s/^..//) 2> /dev/null'

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_OPTS
export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'bat --style=numbers --color=always {}'"

export HOMEBREW_GITHUB_API_TOKEN_=539ebfe1f10a686d45c3fcd381287321326411cf
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"


timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

export STARSHIP_CONFIG=~/.starship
eval "$(starship init zsh)"

# Uncomment to profile shell startup
#
# unsetopt XTRACE
# exec 2>&3 3>&-
#

# zprof
