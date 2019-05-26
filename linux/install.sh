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

# Add to sources
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Add public key used to verify code signature
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -

# Refresh repository sources and install Insomnia
sudo apt-get update
sudo apt-get install insomnia

# Slack
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb

sudo apt install ./slack-desktop-*.deb

# VS Code
sudo apt updatesudo apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update
sudo apt install code

# Gcloud
# Create environment variable for correct distribution
CLOUD_SDK_REPO="cloud-sdk-$(grep VERSION_CODENAME /etc/os-release | cut -d '=' -f 2)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# Clean up *.deb files
rm -rf ./*.deb
