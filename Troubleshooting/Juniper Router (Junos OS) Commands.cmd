| Command / Configuration                                                                       | Purpose / Description           | When to Use                                         |
| --------------------------------------------------------------------------------------------- | ------------------------------- | --------------------------------------------------- |
| `set system login user <username> authentication plain-text-password`                         | Create a new user with password | When adding network engineers or admins             |
| `set system root-authentication plain-text-password <password>`                               | Set/change root password        | Initial setup or security update                    |
| `set system host-name <hostname>`                                                             | Change router hostname          | During initial setup or rebranding                  |
| `set interfaces <intf> unit 0 family inet address <IP>/24`                                    | Assign IP to an interface       | When setting up management IP or VLAN IP            |
| `set routing-options static route 0.0.0.0/0 next-hop <IP>`                                    | Configure default route         | To enable internet connectivity or upstream routing |
| `set system time-zone Asia/Dhaka`                                                             | Set time zone                   | For correct logs and monitoring                     |
| `set system name-server <IP>`                                                                 | Set DNS servers                 | When router needs DNS resolution                    |
| `set interfaces <intf> flexible-vlan-tagging` + `unit <VLAN_ID>` + `family inet address <IP>` | VLAN creation & IP assignment   | For internal LAN or client segmentation             |
| `set firewall policer <name> if-exceeding bandwidth-limit <value>`                            | Bandwidth control               | To limit bandwidth per client or VLAN               |
| `commit`                                                                                      | Save configuration              | After making any configuration changes              |
| `show` / `show configuration`                                                                 | Verify config                   | Always before commit                                |
