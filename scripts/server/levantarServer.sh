#!/bin/bash

IP1=$1
IP2=$2
IP3=$3
IP4=$4
IP5=$5

openvpn --remote $IP1 --port 1200 --dev tap0 --ifconfig 10.134.5.140 255.255.255.240 201.158.15.2 &
openvpn --remote $IP1 --port 1201 --dev tap1 --ifconfig 10.134.5.140 255.255.255.240 20.86.15.129 &
openvpn --remote $IP1 --port 1202 --dev tap2 --ifconfig 10.134.5.140 255.255.255.240 20.86.15.34 &
openvpn --remote $IP2 --port 1203 --dev tap3 --ifconfig 10.134.5.140 255.255.255.240 20.64.73.3 &
openvpn --remote $IP3 --port 1204 --dev tap4 --ifconfig 10.134.5.140 255.255.255.240 10.31.25.3 &
openvpn --remote $IP4 --port 1205 --dev tap5 --ifconfig 10.134.5.140 255.255.255.240 10.31.25.194 &
openvpn --remote $IP5 --port 1206 --dev tap6 --ifconfig 10.134.5.140 255.255.255.240 201.158.15.1 &
openvpn --remote $IP5 --port 1207 --dev tap7 --ifconfig 10.134.5.140 255.255.255.240 10.31.25.1 &
openvpn --remote $IP5 --port 1208 --dev tap8 --ifconfig 10.134.5.140 255.255.255.240 20.26.29.129 &
openvpn --remote $IP5 --port 1209 --dev tap9 --ifconfig 10.134.5.140 255.255.255.240 20.86.15.130 &
