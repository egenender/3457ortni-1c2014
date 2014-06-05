#!/bin/bash

IP=$1

openvpn --remote $IP --port 1203 --dev tap3 --ifconfig 20.64.73.3 255.255.255.0 10.134.5.140
