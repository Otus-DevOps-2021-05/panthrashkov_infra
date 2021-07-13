#!/bin/bash
echo "deploy.sh"
set -e
APP_DIR=${1:-$HOME}
echo "$APP_DIR"
sudo apt-get install -y git
echo "git installed"
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
echo "clone success"
bundle install
echo "bundle installed"
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
