# ngrok-service

### Description

Ngrok exposes local servers behind NATs and firewalls to the public internet over secure tunnels.  I've put together a simple service to make sure you always have a SSH tunnel open.

NOTE.  This has only been tested on Kali Linux 2021.

### Service

The service file has been setup to open connections to SSH, but by editing the `ngrok.service` file, you can expose any other port.  You can also open multiple tunnels.  Please see https://dashboard.ngrok.com/get-started/tutorials for more details.

NOTE.  If you make changes to `ngrok.service` after installation, be sure to run `systemctl daemon-reload` to affect the changes.

### Auto Installation

The script has been setup to download the files to `/opt/ngrok` and open a SSH tunnel.

`sudo ./setup.sh <token_here>`

### Manual Installation

1. Sign up for an account at https://ngrok.com/
2. Download the ngrok binary at https://dashboard.ngrok.com/get-started/setup
3. Get your auth token at https://dashboard.ngrok.com/get-started/your-authtoken
4. Copy `ngrok.yml` to where you would like to keep it
5. Copy `ngrok` binary to where you would like to keep it
6. Edit `ngrok.yml` to include your auth token
7. Copy `ngrok.service` to `/lib/systemd/system/`
8. Edit `ngrok.service` to make sure paths are correct for the binary and the config file
9. `systemctl enable ngrok.service`
10. `systemctl start ngrok.service`
11. `systemctl status ngrok.service`
