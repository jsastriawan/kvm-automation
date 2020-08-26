#!/bin/sh
blocked_ips=" \
13.35.20.85 \
13.35.20.3 \
13.35.20.27 \
13.35.20.22 \
13.227.241.128 \
13.227.241.30 \
13.227.241.61 \
13.227.241.104 \
13.35.20.36 \
13.35.20.103 \
13.35.20.115 \
13.35.20.95 \
99.84.230.25 \
99.84.230.27 \
99.84.230.126 \
99.84.230.16 \
13.224.29.30 \
13.224.29.31 \
13.224.29.112 \
13.224.29.123 \
"
for ip in $blocked_ips
do
	echo "Blocking $ip"
	/sbin/iptables -I INPUT -s ${ip} -j DROP
	/sbin/iptables -I OUTPUT -d ${ip} -j DROP
	/sbin/iptables -I FORWARD -d ${ip} -j DROP
done