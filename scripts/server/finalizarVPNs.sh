#!/bin/bash

killall openvpn
openvpn --rmtun --dev tap0
openvpn --rmtun --dev tap1
openvpn --rmtun --dev tap2
openvpn --rmtun --dev tap3
openvpn --rmtun --dev tap4
openvpn --rmtun --dev tap5
openvpn --rmtun --dev tap6
openvpn --rmtun --dev tap7
openvpn --rmtun --dev tap8
openvpn --rmtun --dev tap9
