#!/usr/bin/env bash

set -e

# System

echo 
echo "####"
echo "#### Updating System"
echo "####"
echo

sudo apt update && sudo apt upgrade
sudo snap refresh

# Docker

echo
echo "####"
echo "#### Updating docker compose from github"
echo "####"
echo

INSTALLED_DC_VERSION=$(docker-compose --version | cut -d" " -f4)
DC_VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | jq .name -r )

echo "current docker-compose version is ${INSTALLED_DC_VERSION}"

if [ "${INSTALLED_DC_VERSION}" != "${DC_VERSION}" ]; then
  DESTINATION=/usr/local/bin/docker-compose
  sudo curl -L "https://github.com/docker/compose/releases/download/${DC_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o $DESTINATION
  sudo chmod 755 $DESTINATION

  UPDATED_DC_VERSION=$(docker-compose --version | cut -d" " -f4)
  echo "Updated docker-compose to version ${UPDATED_DC_VERSION}"
fi

echo
echo "####"
echo "#### Pulling new docker container"
echo "####"
echo

docker-compose -f ~/apps/ies-environments/.share/traefik/docker-compose.yaml pull
docker pull portainer/portainer-ce:alpine
docker pull mailhog/mailhog
docker pull mariadb:10.5-focal

# Tools

echo
echo "####"
echo "#### Updating PHP Tools"
echo "####"
echo

sudo composer selfupdate

zsh -ic "omz update"

