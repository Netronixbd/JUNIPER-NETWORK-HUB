# 1. Create a New User
set system login user <username> authentication plain-text-password
# OR using encrypted password
set system login user <username> authentication encrypted-password "<encrypted-password>"

# 2. Change Root Password
set system root-authentication plain-text-password <new-password>

# 3. Setup Hostname & Management IP
set system host-name <new-hostname>
set interfaces ge-0/0/0 unit 0 family inet address <management-IP>/24

# 4. Configure Interfaces
set interfaces ge-0/0/2 unit 0 family inet address 192.168.1.1/24

# 5. Configure Default Route
set routing-options static route 0.0.0.0/0 next-hop <next-hop-IP>

# 6. Set Time Zone
set system time-zone Asia/Dhaka

# 7. Configure DNS Servers
set system name-server <primary-DNS-IP>
set system name-server <secondary-DNS-IP>

# 8. Create VLAN & Assign IP
set interfaces ae2 flexible-vlan-tagging
set interfaces ae2 unit 321 description NIS-Erricssion2-IIG
set interfaces ae2 unit 321 vlan-id 321
set interfaces ae2 unit 321 family inet address 10.100.100.49/30

# 9. Bandwidth Management & Control
set firewall policer Client1-IIG-BW if-exceeding bandwidth-limit 600m
set firewall policer Client1-IIG-BW if-exceeding burst-size-limit 1m
set firewall policer Client1-IIG-BW then discard

set interfaces ae2 unit 3011 family inet policer input Client1-IIG-BW
set interfaces ae2 unit 3011 family inet policer output Client1-IIG-BW

# 10. Commit Configuration
commit check
commit
