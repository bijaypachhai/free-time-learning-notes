# IPTABLES
Let's learn about magic behind linux packet filtering system.

[Reference: Digital Ocean Blog](https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands)

## View Existing Rules
```bash

$ sudo iptables -L
$ sudo iptables -L --line-numbers

$ sudo iptables -L INPUT
$ sudo iptables -L -t nat
$ sudo iptables -L -t mangle
$ sudo iptables -L -t filter

```

## Adding Rules
There are two ways to add new rules. Either insert new rules at the top or append at the bottom. There is a single usecase to append the rule
at the bottom. Since the rules are looked up on top-to-bottom manner, it is essential to append `DENY` rule at the bottom. If the `DENY` rule appears elsewhere in-between rules then, rules below `DENY` are ignored.

```bash

$ sudo iptables -I INPUT -s 192.168.1.0/24 -p tcp --dport 22 -j ACCEPT
$ sudo iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 80 -j DROP

$ sudo iptables -I INPUT 1 -s 192.168.1.0/24 -p tcp --dport 80 -j ACCEPT
## adds rule at index 1 in the rules list

## drop all packets from this source
$ sudo iptables -A INPUT -s 10.123.1.5 -j DROP

## reject connections
$ sudo iptables -A INPUT -s 10.123.1.5 -j REJECT

## specify an interface
$ iptables -A INPUT -i eth0 -s 203.0.113.51 -j DROP

$ sudo iptables -A INPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
$ sudo iptables -A INPUT -p tcp --dport 80 -m conntrack --ctstate NEW,ESTABLISHED -j DROP


$ sudo iptables -A OUTPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT

$ sudo iptables -A INPUT -s 10.1.1.5 -j LOG --log-prefix "iptables dropped packet"


```

## Deleting Rules
It is important to note the line numbers while deleting the rules.

```bash

$ sudo iptables -D INPUT <line-number>

$ sudo iptables -F INPUT # flush INPUT chain
$ sudo iptables -F       # flush ALL chain

```

## Saving and Restoring rules

```bash

$ sudo iptables-save > rules.v4
$ sudo iptables-restore < rules.v4

```

### Targets
A target is what happens after a packet matches a rule criteria.

| Target     | Description       |
|:-----------|------------------:|
| ACCEPT     | Allows the packets to pass through the firewall |
| DROP       | Discards the packet without informing the sender |
| REJECT     | Discards the packet and returns an error response to the sender |
| LOG        | Records packet Information into a log file |
| SNAT       | Source Network Address Translation, Alters the packet's source address |
| DNAT       | Destination Network Address Translation, Changes the packet's destination address |
| MASQUERADE | Alter a packet's source address for dynamically assigned IPs |
