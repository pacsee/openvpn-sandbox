#!/usr/bin/env bash

apt-get -y install easy-rsa

service opnevpn stop

rm -rf /etc/openvpn/easy-rsa/
mkdir /etc/openvpn/easy-rsa/
cp -r /usr/share/easy-rsa/* /etc/openvpn/easy-rsa/

patch /etc/openvpn/easy-rsa/vars < /vagrant/vpnserver/vars.patch

cd /etc/openvpn/easy-rsa/
source vars
./clean-all

export EASY_RSA="${EASY_RSA:-.}"
"$EASY_RSA/pkitool" --initca
"$EASY_RSA/pkitool" --server vpnserver

./build-dh

# However we just created keys, certs we using an exist one
# becuase we don't want to overwrite every time when we provison

cd /vagrant/vpnserver/keys
cp vpnserver.crt vpnserver.key ca.crt dh2048.pem /etc/openvpn/

cp /vagrant/vpnserver/openvpn.conf /etc/openvpn/
service openvpn start