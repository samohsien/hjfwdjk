
## NACL CUSTOM RULES
Custom rules can be defined in vpc definion via variable `custom_open_ports`.
```
  # protocol could be tcp/udp/all
  # ingress/egress action could be allow, deny
  # from_port/to_port could be range of ports or single port
  # cidrs can be different for ipv4 and ipv6 not for ingress/egress rules
  custom_open_ports = [{ protocol = "tcp", ingress_action = "allow", egress_action = "allow", ingress_ipv4_cidr = "0.0.0.0/0", ingress_ipv6_cidr = "::/0", egress_ipv4_cidr = "0.0.0.0/0", egress_ipv6_cidr = "::/0", from_port = 8080, to_port = 8080 }]
```
## NACL RULES - PRIVATE SUBNETS

All rules affected IPv4 and IPv6 traffik.

| Ports range  | Ingress | Engress | Rule  | Destination |
|--------------|---------|---------|-------|-------------|
| ALL          |   X     |    X    | ALLOW | 0.0.0.0/0   |
