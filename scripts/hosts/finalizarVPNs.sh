#!/bin/bash

killall openvpn
openvpn --rmtun --dev tap0
