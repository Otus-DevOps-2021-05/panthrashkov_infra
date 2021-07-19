#!/bin/sh
echo 'install mongodb'
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add - # После пайпа sudo не убрано - а то не отработает добавление ключа
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
echo 'wget ok'
apt-get update
echo "apt-get update ok"
sleep 15s
apt install -y mongodb-org
echo "install -y mongodb-org ok"
sleep 15s
systemctl start mongod
echo "started mongodb"
systemctl enable mongod
echo "enabled mongodb"
