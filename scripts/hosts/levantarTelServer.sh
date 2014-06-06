#!/bin/bash

IP=$1

openvpn --remote $IP --port 1208 --dev tap8 --ifconfig 20.26.29.129 255.255.255.0 10.134.5.140
openvpn --remote $IP --port 1209 --dev tap9 --ifconfig 20.86.15.130 255.255.255.128 10.134.5.140

sleep 5

route add -net 201.158.15.0  netmask 255.255.255.128 gw 20.26.29.2 metric 1
route add -net 20.86.15.0 netmask 255.255.255.224 gw 20.26.29.2 metric 1
route add -net 10.31.25.128 netmask 255.255.255.240 gw 20.26.29.2 metric 1
route add -net 20.64.73.0 netmask 255.255.255.0 gw 20.26.29.1 metric 1
route add -net 10.31.25.0 netmask 255.255.255.128 gw 20.86.15.133 metric 1
route add -net 20.86.15.32 netmask 255.255.255.224 gw 20.86.15.133 metric 1
route add -net 10.31.25.152 netmask 255.255.255.252 gw 20.86.15.133 metric 1
route add -net 10.31.25.156 netmask 255.255.255.252 gw 20.26.29.1 metric 1
route add -net 151.40.3.192 netmask 255.255.255.252 gw 20.26.29.2  metric 1
route add -net 151.40.3.196 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.200 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.204 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.208 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.212 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.216 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.220 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.224 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 151.40.3.228 netmask 255.255.255.252 gw 20.26.29.2 metric 1
route add -net 20.86.15.64 netmask 255.255.255.192 gw 20.26.29.3 metric 1
route add -net 10.31.25.144 netmask 255.255.255.248 gw 20.86.15.133 metric 1
route add -net 10.31.25.192 netmask 255.255.255.224 gw 20.86.15.133 metric 1
route add -net 10.31.25.160 netmask 255.255.255.252 gw 20.86.15.132 metric 1
route add -net 10.31.25.164 netmask 255.255.255.252 gw 20.86.15.132 metric 1
route add -net 10.31.25.168 netmask 255.255.255.252 gw 20.86.15.132 metric 1
	