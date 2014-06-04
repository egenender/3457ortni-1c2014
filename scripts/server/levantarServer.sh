#!/bin/bash

openvpn --mktun --dev tap0
ifconfig tap0 0.0.0.0 promisc up

openvpn ./server.conf &
