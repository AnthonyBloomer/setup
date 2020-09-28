cp .bash_profile ~/
cp .vimrc ~/
cp .gitignore_global ~/
cp .gitconfig ~/

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor
brew update
brew tap caskroom/cask
brew tap caskroom/versions
brew tap heroku/brew
brew bundle

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

sudo easy_install pip
sudo pip install virtualenv

npm install -g peerflix

brew cleanup

sh .macos
