# https://github.com/mattjmorrison/dotfiles/blob/master/install-scripts/Linux/install-packages.sh
# https://github.com/mattjmorrison/dotfiles
log_file=~/install_progress_log.txt

sudo apt-get -y install curl
if type -p curl > /dev/null; then
    echo "curl Installed" >> $log_file
else
    echo "crul FAILED TO INSTALL!!!" >> $log_file
fi