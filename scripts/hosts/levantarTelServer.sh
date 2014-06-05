#!/bin/bash

IP=$1

openvpn --remote $IP --port 1208 --dev tap8 --ifconfig 20.26.29.129 255.255.255.0 10.134.5.140
openvpn --remote $IP --port 1209 --dev tap9 --ifconfig 20.86.15.130 255.255.255.128 10.134.5.140
