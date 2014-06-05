#!/bin/bash

IP=$1

openvpn --remote $IP --port 1202 --dev tap2 --ifconfig 20.86.15.34 255.255.255.224 10.134.5.140
