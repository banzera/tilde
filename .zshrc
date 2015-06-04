source ~/.tilde/.antigen.zsh

ANTIGEN_DEFAULT_REPO_URL=https://github.com/banzera/oh-my-zsh.git

HIST_STAMPS="mm/dd/yyyy"

DISABLE_CORRECTION="true"
DISABLE_AUTO_UPDATE="true"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle --loc=custom/plugins/git-delete-history
antigen bundle --loc=custom/plugins/better-history-search
# antigen bundle custom/plugins/t
   
antigen bundles <<EOBUNDLES
   adb
   battery
   bower
   brew
   # bundler
   # coffee
   colored-man
   cp
   django
   docker
   emoji-clock
   extract
   fasd
   git
   git-extras
   github
   gitignore
   gradle
   grails
   heroku
   jsontools
   mvn
   nyan
   pip
   pj
   postgres
   python
   osx
   rsync
   ruby
   rvm
   scd
   sprunge
   sublime
   svn
   themes
   vagrant
   virtualenv
   z
EOBUNDLES

# Load the theme.
antigen theme jnrowe

# Tell antigen that you're done.
antigen apply

PROJECT_PATHS=(
    ~/Development/
    ~/Development/firemon/core/
    ~/Development/firemon/proserv/
    ~/Development/firemon/proserv/clients/
    ~/Development/firemon/proserv/kit/
    ~/Development/3rd_party/
    ~/Development/exploratorium/
)

# User configuration

PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

PATHS=(
   ~/.pythonbrew/bin
   ~/bin
   ~/runtimes/gosu/bin
   /usr/local/heroku/bin
   ~/.rvm/bin # Add RVM to PATH for scripting
   /usr/texbin
)

for P in $PATHS; do
   PATH=$PATH:$P
done

export PATH

export EDITOR=vim
export JAVA_HOME=$(/usr/libexec/java_home)

# because the npm plugin doesn't work properly...
eval "$(npm completion 2>/dev/null)"

eval "$(jenv init -)"

eval "$(boot2docker shellinit 2>/dev/null)"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/bryanbanz/.gvm/bin/gvm-init.sh" ]] && source "/Users/bryanbanz/.gvm/bin/gvm-init.sh"


fortune | cowsay | lolcat
