#!/bin/bash

./finalizarVPNs.sh

IP=$1

openvpn --remote $IP --port 1206 --dev tap6 --ifconfig 201.158.15.1 255.255.255.128 10.134.5.140 &

sleep 25

route add -net 20.86.15.0 netmask 255.255.255.224 gw 201.158.15.6 metric 1
route add -net 10.31.25.128 netmask 255.255.255.240 gw 201.158.15.6 metric 1
route add -net 20.64.73.0 netmask 255.255.255.0 gw 201.158.15.7 metric 1
route add -net 10.31.25.0 netmask 255.255.255.128 gw 201.158.15.5 metric 1
route add -net 20.86.15.32 netmask 255.255.255.224 gw 201.158.15.5 metric 1
route add -net 10.31.25.152 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 10.31.25.156 netmask 255.255.255.252 gw 201.158.15.7 metric 1
route add -net 151.40.3.192 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.196 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.200 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.204 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.208 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.212 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.216 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.220 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.224 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 151.40.3.228 netmask 255.255.255.252 gw 201.158.15.5 metric 1
route add -net 20.86.15.64 netmask 255.255.255.192 gw 201.158.15.5 metric 1
route add -net 10.31.25.144 netmask 255.255.255.248 gw 201.158.15.5 metric 1
route add -net 20.26.29.0 netmask 255.255.255.0 gw 201.158.15.5 metric 1
route add -net 20.86.15.128 netmask 255.255.255.128 gw 201.158.15.7 metric 1
route add -net 10.31.25.192 netmask 255.255.255.224 gw 201.158.15.7 metric 1
route add -net 10.31.25.160 netmask 255.255.255.252 gw 201.158.15.7 metric 1
route add -net 10.31.25.164 netmask 255.255.255.252 gw 201.158.15.7 metric 1
route add -net 10.31.25.168 netmask 255.255.255.252 gw 201.158.15.7 metric 1

cp grupo2.html /var/www/

echo "WebServer esta en el dominio de DNS2"
sudo chattr -i /etc/resolv.conf
sudo chmod 777 /etc/resolv.conf
echo "Agregando la direccion IP de DNS al archivo /etc/resolv.conf..."
echo "# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)" > /etc/resolv.conf
echo "#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN" >> /etc/resolv.conf
echo "nameserver 10.31.25.194" >> /etc/resolv.conf
sudo chmod 644 /etc/resolv.conf
