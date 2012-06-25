#!/bin/bash
ip_prefix=
for (( i=101 ; i<104; i++ ))
do
echo ">>>>>>>>>>>>>>>>>>> Stop workers on Node - " $((i-100))
echo
echo
ssh root@$ip_prefix.$i "mondo-init stop"
echo
sleep 1
done

for (( i=101 ; i<104; i++ ))
do
echo
sleep 2
echo ">>>>>>>>>>>>>>>>>>> Flush Data on Node - " $((i-100))
echo
echo
ssh root@$ip_prefix.$i "/srv/node/flush.sh"
echo 
sleep 1
done

for (( i=101 ; i<104; i++ ))
do
echo ">>>>>>>>>>>>>>>>>>>  Starting workers on Node - " $((i-100))
echo
echo
ssh root@$ip_prefix.$i "mondo-init start"
echo
sleep 1
done

