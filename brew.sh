#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils --without-parallel

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget`
brew install wget

# Git
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install gitstats

# Install Python
brew install python
brew install python3

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep --with-default-names
brew install openssh
brew install screen


# Install other useful binaries.
brew install ack
brew install nmap
brew install imagemagick --with-webp --with-ghostscript --with-librsvg
brew install pigz
brew install pv
brew install rhino
brew install ssh-copy-id
brew install tree
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
brew install heroku-toolbelt
heroku update

# My List
brew install apache-spark
brew install cassandra@2.1
brew install dos2unix
brew install elasticsearch@2.4
brew install elinks
brew install gawk
brew install gcc
brew install gnu-tar
brew install gnu-time --with-default-names
brew install gzip
brew install htop-osx
brew install httpie
brew install httping
brew install jo
brew install jq
brew install macvim
brew install mas
brew install maven
brew install mdp
brew install ffmpeg --with-fdk-aac --with-libass --with-libsoxr --with-libssh --with-libvidstab --with-opencore-amr --with-openh264 --with-openjpeg --with-openssl --with-rtmpdump --with-rubberband --with-schroedinger --with-snappy --with-tools --with-webp --with-x265 --with-xz --with-zeromq --with-zimg --with-fontconfig --with-freetype --with-frei0r --with-libbluray --with-libbs2b --with-libcaca --with-libvorbis --with-libvpx --with-opus --with-speex --with-theora
brew install youtube-dl
brew install mdv
brew install ncdu
brew install nginx
brew install parallel
brew install reattach-to-user-namespace
brew install redis
brew install ripgrep
brew install sbt
brew install source-highlight
brew install spoof-mac
brew install stow
brew install the_silver_searcher
brew install tig
brew install tmux
brew install watch
brew install curl
echo 'export PATH="/usr/local/opt/curl/bin:$PATH"' >> ~/.bash_profile
brew install ant@1.9
brew install fdupes

# Install Cask
brew tap caskroom/cask
brew tap caskroom/versions

# Core casks
brew cask install iterm2
brew cask install java
brew install gradle
brew cask install xquartz

# Development tool casks
brew cask install sublime-text
brew cask install virtualbox
brew cask install vagrant
brew cask install macdown

# Misc casks
brew cask install google-chrome
brew cask install firefox
brew cask install skype
brew cask install gimp
brew cask install inkscape

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package


# Personal casks
brew cask install the-unarchiver
brew cask install appcleaner
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install hermes
brew cask install opera
brew cask install scansnap-manager
brew cask install skype
brew cask install slimbatterymonitor
brew cask install spectacle
brew cask install transmission
brew cask install virtualbox
brew cask install vlc
brew cask install adobe-acrobat-reader
brew cask install airflow
brew cask install android-sdk
brew cask install android-studio
brew cask install dash
brew cask install diffmerge
brew cask install discord
brew cask install firefoxdeveloperedition
brew cask install insomnia
brew cask install itsycal
brew cask install numi
brew cask install typora
brew cask install visual-studio-code
#brew cask install steam
#brew cask install dropbox

# Need to be manually installed:
# lastpass
# clipmenu
# libreoffice
# Paste beta
# Pixelmator
# Jetbrains pro stuff
# Private internet access
# sgdv
# isg
# Logitech Options
# Microsoft Office


# Remove outdated versions from the cellar.
brew cleanup
