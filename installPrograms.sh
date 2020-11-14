#/bin/bash 

set +e

sudo apt install -y 
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

cat <<EOT >> /etc/apt/sources.list.d/vivaldi.list
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb http://repo.vivaldi.com/stable/deb/ stable main
EOT

cat <<EOT >> /etc/apt/sources.list.d/opera-stable.list
# This file makes sure that Opera Browser is kept up-to-date
# as part of regular system upgrades

deb https://deb.opera.com/opera-stable/ stable non-free #Opera Browser (final releases)
EOT

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
    keepassx \
    keepassxc \
    lm-sensors \
    nautilus-nextcloud \
    opera \
    pwgen \
    spotify-client \
    terminator \
    v4l-utils \
    variety \
    vim \
    vivaldi \
    zsh

sudo groupadd docker
sudo usermod -aG docker $USER

snap install rambox

cat <<EOT >> /etc/g810-led/profile
# Install your g810-led profile here
# (applied at boot or keyboard connection)
# See /usr/share/doc/g810-led/examples/sample_profiles

# Blue Profile

#a 0000ff # Set all keys blue
#g fkeys FFD500 # Yellow for group f Keys
#g numeric 009600 # Green for group num block

# Wave Profile

fx cwave all 40 #  Wave all Keys in 40 ms


c # Commit changes
EOT
