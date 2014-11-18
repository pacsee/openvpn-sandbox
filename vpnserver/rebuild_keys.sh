#!/usr/bin/env bash

service openvpn stop

cd /etc/openvpn/easy-rsa/
source vars
./clean-all

echo ""
echo ""
echo "***************************************************************"
echo "*** Server Build CA                                         ***"
echo "***************************************************************"
echo ""
./build-ca

echo ""
echo ""
echo ""
echo ""
echo "***************************************************************"
echo "*** Server Build key                                        ***"
echo "***************************************************************"
echo ""
./build-key-server vpnserver

echo ""
echo ""
echo ""
echo ""
echo "***************************************************************"
echo "*** Serverv Build DH                                        ***"
echo "***************************************************************"
echo ""
./build-dh

echo ""
echo ""
echo ""
echo ""
echo "***************************************************************"
echo "*** Build key for webserver client                          ***"
echo "***************************************************************"
echo ""
./build-key webserver

echo ""
echo ""
echo ""
echo ""
echo "***************************************************************"
echo "*** Build key for client1                                   ***"
echo "***************************************************************"
echo ""
./build-key client1

echo ""
echo ""
echo ""
echo ""
echo "***************************************************************"
echo "*** Build key for client2                                   ***"
echo "***************************************************************"
echo ""
./build-key client2

cd keys
cp vpnserver.crt vpnserver.key ca.crt dh2048.pem /etc/openvpn

cp 01.pem serial ca.key /vagrant/vpnserver/keys

cp vpnserver.crt vpnserver.key ca.crt dh2048.pem /vagrant/vpnserver/keys
cp ca.crt webserver.crt webserver.key /vagrant/webserver/keys
cp ca.crt client1.crt client1.key /vagrant/client1/keys
cp ca.crt client2.crt client2.key /vagrant/client2/keys

cp /vagrant/vpnserver/openvpn.conf /etc/openvpn/
service openvpn start