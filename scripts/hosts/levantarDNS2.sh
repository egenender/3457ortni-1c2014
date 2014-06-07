#!/bin/bash

IP=$1

openvpn --remote $IP --port 1205 --dev tap5 --ifconfig 10.31.25.194 255.255.255.224 10.134.5.140 &

sleep 5

route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.31.25.193 metric 1


HOST_IP="10.31.25.194"

function import {

    echo "Vaciando la carpeta /etc/bind/..."
    sudo rm /etc/bind/*
    echo "Verificando si hacen falta bind.keys y rndc.key.."
    cd ..
    cd ..
    cd DNS/dns2
 
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
