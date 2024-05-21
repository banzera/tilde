function push-key {
  ssh $1 "echo '`cat ~/.ssh/id_rsa.pub`' >> ~/.ssh/authorized_keys"
}

function push-key-d {
  ssh $1 "echo '`cat ~/.ssh/id_dsa.pub`' >> ~/.ssh/authorized_keys"
}

# # echo the paths in $PATH, in the order they're searched
function pp {
  PATHS_ARRAY=("${(s/:/)PATH}")

  for PA in $PATHS_ARRAY; do
    echo $PA
  done

  unset PATHS_ARRAY
}

function bak {
  mv $1{,.bak}
}

function unbak {
  mv $1 ${1%.bak}
}

function mfcat {
  unzip -q -c $1 META-INF/MANIFEST.MF
}

#Get IP
function ip-addr() {
    wget -qO- http://ipecho.net/plain
    echo
}

# Time ZSH startup
function zsh-time() {
    time zsh -i -c exit
}

function workon {
  export HEROKU_APP=$HEROKU_PROJECT_NAME-dev-pr-$1
}

function seecert () {
  nslookup $1
  (openssl s_client -showcerts -servername $1 -connect $1:443 <<< "Q" | openssl x509 -text )
}
