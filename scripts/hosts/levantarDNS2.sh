#!/bin/bash

IP=$1

openvpn --remote $IP --port 1205 --dev tap5 --ifconfig 10.31.25.194 255.255.255.224 10.134.5.140 &

sleep 5

route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.31.25.193 metric 1
