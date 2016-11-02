#!/bin/bash

if [ ! -f /etc/network/interfaces.d/100-openvpn-jenkins.cfg ]; then
    sudo echo $'iface jenkins-vpn inet manual\nopenvpn jenkins' > /etc/network/interfaces.d/100-openvpn-jenkins.cfg
fi

if [ ! -f /etc/openvpn/jenkins.cfg ]; then
    sudo cp $1 /etc/openvpn/jenkins.cfg
fi

sudo ifup jenkins-vpn
