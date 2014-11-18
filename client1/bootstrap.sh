#!/usr/bin/env bash

service openvpn stop

cp /vagrant/client1/openvpn.conf /etc/openvpn/
cp /vagrant/client1/keys/ca.crt /etc/openvpn/
cp /vagrant/client1/keys/client1.crt /etc/openvpn/
cp /vagrant/client1/keys/client1.key /etc/openvpn/

service openvpn start