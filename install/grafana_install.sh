#!/bin/bash
# Purpose : Installation of Grafana
# This performs all required steps on server .

sudo cat << EOF > /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

echo "Grafana installation is in progress .."
sudo yum install grafana -y

echo "Enabling Grafana service to start at server reboot .."
sudo systemctl daemon-reload
sudo systemctl enable grafana-server > /dev/null 2>&1
echo "Grafana start in progress .."
sudo systemctl start grafana-server
sleep 2
echo "Grafana Status .."
sudo systemctl status grafana-server
