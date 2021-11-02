#!/bin/bash
# assuming the system is Debian
sudo apt-get update
sudo apt-get install vim -y
sudo apt-get install tmux -y

# assuming git is installed, pull config files and copy them to home directory
# Generate a private/public key pair and print the public key
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ""
echo "Here is the generated public key: add it to your github account"
cat ~/.ssh/id_ed25519.pub
read "Press [Enter] to continue..."

# Checkout bootstrap repo in a temp folder
tmpdir=$(mktemp -d)
pushd $tmpdir
git clone git@github.com:smanilov/bootstrap.git
popd

# copy config files to home
cp -R $tmpdir/home/* ~
rm -rf $tmpdir

# install vim plugins
vim +PluginInstall +qall

# install docker
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor \
  -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
