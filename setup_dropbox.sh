#!/bin/bash

if [ -z "$1" ]; then
    echo "./setup_dropbox.sh <your_authtoken>"
    exit 1
fi

cp ngrok.service /lib/systemd/system/
mkdir -p /opt/ngrok
cp ngrok.yml /opt/ngrok
sed -i "s/<token_here>/$1/g" /opt/ngrok/ngrok.yml

cd /opt/ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.tgz
tar zxvf ngrok-stable-linux-arm.tgz
chmod +x ngrok

systemctl enable ngrok.service
systemctl start ngrok.service