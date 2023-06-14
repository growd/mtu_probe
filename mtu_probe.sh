#!/bin/bash
if [ "$1"x == ""x ]
then
    echo "you shuold config one ip such as ./mtu_probe.sh 192.1680.1"
    exit 0
fi
ip=$1
lens=(64 128 256 512 1024 1200 1400)
while true
do
    for l in ${lens[@]}
    do
        result=`ping ${ip} -s $l -M do -c 1 2>/dev/null | grep "100% packet loss"`
        if [ $? -eq 0 ] && [ "${result}"x != ""x  ]
        then
            echo "$(date) network to ${ip}'s mtu is less than $l" >> mtu_${ip}.log
        fi
    done
    sleep 60
done

