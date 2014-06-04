#!/bin/bash

openvpn --mktun --dev tap6

openvpn ./hostA.conf &
