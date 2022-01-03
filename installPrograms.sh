#/bin/bash 

set -e

sudo apt install -y \
    curl \
    git \
    g++ \
    make \
    libhidapi-hidraw0 \
    apt-transport-https \
    ca-certificates \
    network-manager-openconnect \
    network-manager-openconnect-gnome \
    curl \
    gnupg-agent \
    software-properties-common 

sudo add-apt-repository ppa:nextcloud-devs/client
sudo add-apt-repository ppa:phoerious/keepassxc

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update
sudo apt install -y \
    fancontrol \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    g810-led \
    gnome-tweaks \
    gnome-tweak-tool \
    keepassxc \
    lm-sensors \
    moc \
    moc-ffmpeg-plugin \
    nautilus-nextcloud \
    pwgen \
    spotify-client \
    terminator \
    v4l-utils \
    variety \
    vim \
    zsh

sudo groupadd docker
sudo usermod -aG docker $USER

