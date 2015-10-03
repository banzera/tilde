# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="jnrowe"

DISABLE_CORRECTION="true"
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

plugins=(
   adb
   battery
   bower
   brew
   brew-cask
   chucknorris
   cp
   django
   docker
   emoji-clock
   extract
   fasd
   git
   git-delete-history
   git-extras
   github
   gitignore
   gitlab
   gradle
   grails
   heroku
   better-history-search
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
   t
   vagrant
   virtualenv
   web-search
   z
)

PROJECT_PATHS=(
    ~/Development/
    ~/Development/firemon/core/
    ~/Development/firemon/proserv/
    ~/Development/firemon/proserv/clients/
    ~/Development/firemon/proserv/kit/
    ~/Development/3rd_party/
    ~/Development/labs/
)

source $ZSH/oh-my-zsh.sh

# User configuration

for P in \
  /usr/bin \
  /bin \
  /usr/sbin \
  /sbin \
  /usr/local/bin \
  ~/.pythonbrew/bin \
  ~/bin \
  ~/runtimes/gosu/bin \
  /usr/local/heroku/bin \
  ~/.rvm/bin \
  /usr/texbin \
  ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/ \
; do
  if [[ -d $P ]]; then PATH=$PATH:$P ; fi
done

export PATH

export EDITOR="subl --wait"
export VISUAL=$EDITOR

export JAVA_HOME
JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# because the npm plugin doesn't work properly...
eval "$(npm completion 2>/dev/null)"

# eval "$(jenv init -)"

eval "$(boot2docker shellinit 2>/dev/null)"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/bryanbanz/.gvm/bin/gvm-init.sh" ]] && source "/Users/bryanbanz/.gvm/bin/gvm-init.sh"

chuck | cowsay | lolcat