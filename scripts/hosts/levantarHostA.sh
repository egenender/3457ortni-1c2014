#!/bin/bash

IP=$1

openvpn --remote $IP --port 1200 --dev tap0 --ifconfig 201.158.15.2 255.255.255.128 10.134.5.140
