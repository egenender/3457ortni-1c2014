#!/bin/bash

IP=$1

openvpn --remote $IP --port 1201 --dev tap1 --ifconfig 20.86.15.129 255.255.255.128 10.134.5.140
