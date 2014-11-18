#!/usr/bin/env bash

apt-get -y install easy-rsa

service openvpn stop

rm -rf /etc/openvpn/easy-rsa/
mkdir /etc/openvpn/easy-rsa/
cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa/
patch /etc/openvpn/easy-rsa/vars < /vagrant/vpnserver/vars.patch

cd /vagrant/vpnserver
cp openvpn.conf /etc/openvpn/
cd keys
cp vpnserver.crt vpnserver.key ca.crt dh2048.pem /etc/openvpn

service openvpn start
