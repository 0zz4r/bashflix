#!/usr/bin/env bash
echo "The password will be used to install third-party software (run apt and pip3 with sudo)"
echo ""
echo -n "Please enter your password: "
read -s password
echo ""

# run a command as superuser
run-with-sudo() {
  echo "${password}" | sudo -S "${@}"
}

# installation will not work without git installed
install_git() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Looking for Homebrew ..."
    if ! which brew &>/dev/null; then
      echo "Preparing to install Homebrew ..."
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew install git
    fi
  else
    run-with-sudo apt-get update -y
    run-with-sudo apt-get install -y git curl software-properties-common build-essential libssl-dev
  fi
}

# installs dependencies with homebrew
install_deps_mac() {
  brew update
  brew upgrade node
  brew upgrade python3
  brew upgrade python
  # brew upgrade mpv

  brew install npm
  brew install python3
  brew cask install vlc
  # brew install mpv
}

# installs dependencies with apt for Debian and Ubuntu
install_deps_debian() {
  run-with-sudo apt-get -y update
  run-with-sudo apt-get install -y software-properties-common
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

  run-with-sudo apt-get install -y nodejs
  run-with-sudo apt-get install -y vlc
  run-with-sudo apt-get install -y python3 python3-pip

  #run-with-sudo add-apt-repository -y ppa:mc3man/mpv-tests
  run-with-sudo apt-get -y update
  run-with-sudo apt-get install -y libxslt1-dev libxml2-dev
  #run-with-sudo apt-get install -y mpv
}

# installs dependencies with pip
install_python_deps() {
  run-with-sudo python3 -m pip install --upgrade pip
  run-with-sudo python3 -m pip install --upgrade pirate-get
  run-with-sudo python3 -m pip install --upgrade subliminal
  run-with-sudo pip install git+https://github.com/rachmadaniHaryono/we-get
  # TODO: Install rarbgapi through pip when there's a stable package there
  #run-with-sudo git clone https://github.com/verybada/rarbgapi.git
  #cd rarbgapi
  #run-with-sudo python3 setup.py install
  #cd ..
  #run-with-sudo rm -r rarbgapi
}

# install dependencies with npm
install_node_deps() {
  run-with-sudo npm install npm@latest -g
  run-with-sudo npm install -g peerflix
  #run-with-sudo npm install webtorrent-cli -g
}

# install bashflix for user
install_bashflix() {
  cd ~
  rm -rf bashflix
  git clone https://github.com/astavares/bashflix.git
  cd bashflix
  script_directory="$(pwd)"
  chmod +x ${script_directory}/bashflix.sh
  run-with-sudo ln -fs ${script_directory}/bashflix.sh /usr/local/bin/bashflix
  run-with-sudo echo >$HOME/.bashflix_history
}

# install package managers
install_git

# install system dependencies like python and node
if [[ "$OSTYPE" == "darwin"* ]]; then
  install_deps_mac
else
  # TODO: support more distros such as Fedora and Arch
  install_deps_debian
fi

# install packages with npm and pip
install_python_deps
install_node_deps
