#!/bin/bash

sudo rndc-confgen -a -c /etc/bind/rndc.key
sudo chmod a+r /etc/bind/rndc.key

exit 0 ;
