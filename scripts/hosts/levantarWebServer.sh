#!/bin/bash

IP=$1

openvpn --remote $IP --port 1206 --dev tap6 --ifconfig 201.158.15.1 255.255.255.128 10.134.5.140
