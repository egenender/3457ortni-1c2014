#!/bin/bash

IP=$1

openvpn --remote $IP --port 1203 --dev tap3 --ifconfig 20.64.73.3 255.255.255.0 10.134.5.140 &

sleep 5

route add -net 201.158.15.0  netmask 255.255.255.128 gw 20.64.73.5 metric 1
route add -net 20.86.15.0 netmask 255.255.255.224 gw 20.64.73.5 metric 1
route add -net 10.31.25.128 netmask 255.255.255.240 gw 20.64.73.5 metric 1
route add -net 10.31.25.0 netmask 255.255.255.128 gw 20.64.73.4 metric 1
route add -net 20.86.15.32 netmask 255.255.255.224 gw 20.64.73.4 metric 1
route add -net 10.31.25.152 netmask 255.255.255.252 gw 20.64.73.4 metric 1
route add -net 10.31.25.156 netmask 255.255.255.252 gw 20.64.73.4 metric 1
route add -net 151.40.3.192 netmask 255.255.255.252 gw 20.64.73.5  metric 1
route add -net 151.40.3.196 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.200 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.204 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.208 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.212 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.216 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.220 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.224 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 151.40.3.228 netmask 255.255.255.252 gw 20.64.73.5 metric 1
route add -net 20.86.15.64 netmask 255.255.255.192 gw 20.64.73.5 metric 1
route add -net 10.31.25.144 netmask 255.255.255.248 gw 20.64.73.5 metric 1
route add -net 20.26.29.0 netmask 255.255.255.0 gw 20.64.73.4 metric 1
route add -net 20.86.15.128 netmask 255.255.255.128 gw 20.64.73.4 metric 1
route add -net 10.31.25.192 netmask 255.255.255.224 gw 20.64.73.4 metric 1
route add -net 10.31.25.160 netmask 255.255.255.252 gw 20.64.73.4 metric 1
route add -net 10.31.25.164 netmask 255.255.255.252 gw 20.64.73.4 metric 1
route add -net 10.31.25.168 netmask 255.255.255.252 gw 20.64.73.4 metric 1


HOST_IP="20.64.73.3"
	
function import {

    echo "Vaciando la carpeta /etc/bind/..."
    sudo rm /etc/bind/*
    echo "Verificando si hacen falta bind.keys y rndc.key.."
    cd ..
    cd ..
    cd DNS/root
 
    echo "Copiando el contenido en la carpeta /etc/bind/..."
    sudo cp ./* /etc/bind/

    cd ..
    cd ..

    sudo chattr -i /etc/resolv.conf
    sudo chmod 777 /etc/resolv.conf
    echo "Agregando la direccion IP de DNS al archivo /etc/resolv.conf..."
    echo "# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)" > /etc/resolv.conf
    echo "#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN" >> /etc/resolv.conf
    echo "domain cordoba.dc.fi.uba.ar" >> /etc/resolv.conf
    echo "search cordoba.dc.fi.uba.ar" >> /etc/resolv.conf
    echo "nameserver 127.0.0.1" >> /etc/resolv.conf
    echo "nameserver ${HOST_IP}" >> /etc/resolv.conf
    sudo chmod 644 /etc/resolv.conf

    echo "Reiniciando bind9 con la nueva configuracion..."
    /etc/init.d/bind9 restart
}

##### MAIN #####

echo "DNS: Importando nuestros archivos de configuracion..."
import
echo "DNS: Importación finalizada!"
exit 0
