if test ! "$(uname)" = "Linux"
  then
  echo "Not Linux"
  echo $(uname)
  exit 0
fi

# https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/install-packages.sh
# https://github.com/mattjmorrison/dotfiles
log_file=~/install_progress_log.txt

# Curl
sudo apt-get -y install curl

if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "crul FAILED TO INSTALL!!!" >> $log_file
fi

# htop
sudo apt-get install htop

if type -p htop > /dev/null; then
    echo "htop Installed" >> $log_file
else
    echo "htop FAILED TO INSTALL!!!" >> $log_file
fi

# tmux
sudo apt-get install tmux

if type -p tmux > /dev/null; then
    echo "tmux Installed" >> $log_file
else
    echo "tmux FAILED TO INSTALL!!!" >> $log_file
fi

# google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb


# Insomnia

# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

# Install neofetch
sudo apt install neofetch

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb

sudo apt install ./slack-desktop-*.deb

# Pyenv
curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

# Install VsCode
if [ -f installVscode.sh ]; then
   echo "Install Viusual Studio Code"
   installGcloud.sh
fi

# Install Gcloud SDK
if [ -f installGcloud.sh ]; then
   echo "Install gCloud SDK"
   installGcloud.sh
fi


# Remove Libre office
if [ -f removeLibre.sh ]; then
   echo "Remove Libre Office"
   removeLibre.sh
fi

# Clean up *.deb files
rm -rf ./*.deb
