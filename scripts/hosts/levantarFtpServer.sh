#!/bin/bash

IP=$1

openvpn --remote $IP --port 1207 --dev tap7 --ifconfig 10.31.25.1 255.255.255.128 10.134.5.140
