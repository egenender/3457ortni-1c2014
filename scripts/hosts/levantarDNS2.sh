#!/bin/bash

IP=$1

openvpn --remote $IP --port 1205 --dev tap5 --ifconfig 10.31.25.194 255.255.255.224 10.134.5.140
