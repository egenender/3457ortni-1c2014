#!/bin/bash

IP=$1

openvpn --remote $IP --port 1204 --dev tap4 --ifconfig 10.31.25.3 255.255.255.128 10.134.5.140
