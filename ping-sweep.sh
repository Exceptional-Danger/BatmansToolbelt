#!/bin/bash
#
#This script is intended to conduct a host discovery ping sweep once inside a target.
#This can circumvent a firewall and be used on a target that does not have nmap installed.
#
#Usage: ping-sweep.sh $1[network] $2[First IP to sweep] $3[Last Ip to sweep through]
#Note this can take a hot-minute

for ((x = $2 ; x <= $3 ; x++))

do
	ping -c 1 -w 1 -b $1.$x | grep "ttl" | cut -d " " -f4 >> ips.txt

done

ips=$(wc --lines < ips.txt)
echo "The ping-sweep discovered $ips hosts"
echo "This ping-sweep took $SECONDS seconds."