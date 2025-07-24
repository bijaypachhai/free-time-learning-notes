$ sudo ip netns add NS1
$ sudo ip link add veth10 type veth peer name veth11
$ sudo ip link set veth11 netns NS1

$ sudo ip netns exec NS1 ip addr add 172.16.1.2/24 dev veth11
$ sudo ip netns exec NS1 ip link set dev veth11 up

$ sudo ip link add br0 type bridge
$ sudo ip link set dev veth10 master br0

$ sudo ip addr add 172.16.1.1/24 dev br0
$ sudo ip link set dev br0 up

$ sudo ip link set dev veth10 up

$ sudo ip netns exec NS1 ip link set dev lo up

$ sudo ip netns exec NS1 ip r add default via 172.16.1.1 dev veth11

$ sudo ip r add 172.16.0.0/24 via 192.168.1.106 dev <wifi interface> proto static


# In order to reach host-b from namespace NS1 of host-a,
# Add POSTROUTING CHAIN RULE in host-a, with target MASQUERADE and source as SUBNET IP of host-a bridge
#

# AND to reach namespace of host-b from namespace of host-a
# add PREROUTING CHAIN RULE in host-b, with target ACCEPT and input interface (-i) as bridge (br0)

$ sudo iptables -t nat -I PREROUTING -d 172.16.0.0/24 -i br0 -j ACCEPT

# ADD default policy to ACCEPT ALL PACKETS TO ANY CHAIN
$ sudo iptables -P INPUT ACCEPT

# Log the dropped packets
$ sudo iptables -t nat -A PREROUTING -d 172.16.0.2 -j LOG --log-prefix "kera packet"
