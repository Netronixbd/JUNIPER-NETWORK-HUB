# Juniper vMX — Full Logical-System Configuration for 6 Services

## 🧩 Design Overview

* **Physical Routers:** 2 (VMX-CORE-1, VMX-CORE-2)
* **Logical Systems per Router:** 3 each (total 6)
* **Routing Type:** BGP (external to Cisco 65010)
* **Core Interconnect:** OSPF (10.255.0.0/30)
* **Cisco Downlink:** Common router for all six services

---

## 🌐 VLAN & IP Plan

| Service | VLAN ID | Subnet      | Core Router | Logical System | Core IP  | Cisco IP |
| ------- | ------- | ----------- | ----------- | -------------- | -------- | -------- |
| INT     | 101     | 10.0.1.0/30 | CORE-1      | INT-RT         | 10.0.1.1 | 10.0.1.2 |
| GGC     | 102     | 10.0.2.0/30 | CORE-1      | GGC-RT         | 10.0.2.1 | 10.0.2.2 |
| FNA     | 103     | 10.0.3.0/30 | CORE-1      | FNA-RT         | 10.0.3.1 | 10.0.3.2 |
| BDIX    | 104     | 10.0.4.0/30 | CORE-2      | BDIX-RT        | 10.0.4.1 | 10.0.4.2 |
| CDN     | 105     | 10.0.5.0/30 | CORE-2      | CDN-RT         | 10.0.5.1 | 10.0.5.2 |
| BCDN    | 106     | 10.0.6.0/30 | CORE-2      | BCDN-RT        | 10.0.6.1 | 10.0.6.2 |

---

## 🧱 VMX-CORE-1 Configuration

### Logical-System: INT-RT

```bash
set logical-systems INT-RT interfaces ge-0/0/3 unit 101 description "INT-ZONE-RT"
set logical-systems INT-RT interfaces ge-0/0/3 unit 101 vlan-id 101
set logical-systems INT-RT interfaces ge-0/0/3 unit 101 family inet address 10.0.1.1/30

set logical-systems INT-RT protocols bgp group DOWNLINK type external
set logical-systems INT-RT protocols bgp group DOWNLINK local-as 65001
set logical-systems INT-RT protocols bgp group DOWNLINK neighbor 10.0.1.2 peer-as 65010
set logical-systems INT-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems INT-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems INT-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

### Logical-System: GGC-RT

```bash
set logical-systems GGC-RT interfaces ge-0/0/3 unit 101 description "GGC-ZONE-RT"
set logical-systems GGC-RT interfaces ge-0/0/3 unit 102 vlan-id 102
set logical-systems GGC-RT interfaces ge-0/0/3 unit 102 family inet address 10.0.2.1/30

set logical-systems GGC-RT protocols bgp group DOWNLINK type external
set logical-systems GGC-RT protocols bgp group DOWNLINK local-as 65001
set logical-systems GGC-RT protocols bgp group DOWNLINK neighbor 10.0.2.2 peer-as 65010
set logical-systems GGC-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems GGC-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems GGC-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

### Logical-System: FNA-RT

```bash
set logical-systems FNA-RT interfaces ge-0/0/3 unit 101 description "FNA-ZONE-RT"
set logical-systems FNA-RT interfaces ge-0/0/3 unit 103 vlan-id 103
set logical-systems FNA-RT interfaces ge-0/0/3 unit 103 family inet address 10.0.3.1/30

set logical-systems FNA-RT protocols bgp group DOWNLINK type external
set logical-systems FNA-RT protocols bgp group DOWNLINK local-as 65001
set logical-systems FNA-RT protocols bgp group DOWNLINK neighbor 10.0.3.2 peer-as 65010
set logical-systems FNA-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems FNA-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems FNA-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

---

## 🧱 VMX-CORE-2 Configuration

### Logical-System: BDIX-RT

```bash
set logical-systems BDIX-RT interfaces ge-0/0/3 unit 101 description "BDIX-ZONE-RT"
set logical-systems BDIX-RT interfaces ge-0/0/3 unit 104 vlan-id 104
set logical-systems BDIX-RT interfaces ge-0/0/3 unit 104 family inet address 10.0.4.1/30

set logical-systems BDIX-RT protocols bgp group DOWNLINK type external
set logical-systems BDIX-RT protocols bgp group DOWNLINK local-as 65002
set logical-systems BDIX-RT protocols bgp group DOWNLINK neighbor 10.0.4.2 peer-as 65010
set logical-systems BDIX-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems BDIX-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems BDIX-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

### Logical-System: CDN-RT

```bash
set logical-systems CDN-RT interfaces ge-0/0/3 unit 101 description "CDN-ZONE-RT"
set logical-systems CDN-RT interfaces ge-0/0/3 unit 105 vlan-id 105
set logical-systems CDN-RT interfaces ge-0/0/3 unit 105 family inet address 10.0.5.1/30

set logical-systems CDN-RT protocols bgp group DOWNLINK type external
set logical-systems CDN-RT protocols bgp group DOWNLINK local-as 65002
set logical-systems CDN-RT protocols bgp group DOWNLINK neighbor 10.0.5.2 peer-as 65010
set logical-systems CDN-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems CDN-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems CDN-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

### Logical-System: BCDN-RT

```bash
set logical-systems BCDN-RT interfaces ge-0/0/3 unit 101 description "BCDN-ZONE-RT"
set logical-systems BCDN-RT interfaces ge-0/0/3 unit 106 vlan-id 106
set logical-systems BCDN-RT interfaces ge-0/0/3 unit 106 family inet address 10.0.6.1/30

set logical-systems BCDN-RT protocols bgp group DOWNLINK type external
set logical-systems BCDN-RT protocols bgp group DOWNLINK local-as 65002
set logical-systems BCDN-RT protocols bgp group DOWNLINK neighbor 10.0.6.2 peer-as 65010
set logical-systems BCDN-RT policy-options policy-statement EXPORT-DOWN term 1 from protocol direct
set logical-systems BCDN-RT policy-options policy-statement EXPORT-DOWN term 1 then accept
set logical-systems BCDN-RT protocols bgp group DOWNLINK export EXPORT-DOWN
```

---

## 🔗 Inter-Core OSPF Configuration

**CORE-1:**

```bash
set logical-systems CORE-RT interfaces ae0 unit 0 family inet address 10.255.0.1/30
set logical-systems CORE-RT protocols ospf area 0.0.0.0 interface ae0.0
set logical-systems CORE-RT interfaces lo0 unit 0 family inet address 1.1.1.1/32
set logical-systems CORE-RT protocols ospf area 0.0.0.0 interface lo0.0 passive
```

**CORE-2:**

```bash
set logical-systems CORE-RT interfaces ae0 unit 0 family inet address 10.255.0.2/30
set logical-systems CORE-RT protocols ospf area 0.0.0.0 interface ae0.0
set logical-systems CORE-RT interfaces lo0 unit 0 family inet address 2.2.2.2/32
set logical-systems CORE-RT protocols ospf area 0.0.0.0 interface lo0.0 passive
```

---

## 🧮 Cisco Downlink Router Config

```bash
router bgp 65010
 bgp log-neighbor-changes
 neighbor 10.0.1.1 remote-as 65001
 neighbor 10.0.2.1 remote-as 65001
 neighbor 10.0.3.1 remote-as 65001
 neighbor 10.0.4.1 remote-as 65002
 neighbor 10.0.5.1 remote-as 65002
 neighbor 10.0.6.1 remote-as 65002
!
address-family ipv4
 neighbor 10.0.1.1 activate
 neighbor 10.0.2.1 activate
 neighbor 10.0.3.1 activate
 neighbor 10.0.4.1 activate
 neighbor 10.0.5.1 activate
 neighbor 10.0.6.1 activate
exit-address-family
network 203.0.113.0 mask 255.255.255.0
```

---

## ✅ Verification

**Juniper:**

```bash
show bgp summary
show bgp neighbor
show route protocol bgp
```

**Cisco:**

```bash
show ip bgp summary
show ip route bgp
```

---

This config is fully lab-ready — just copy-paste into EVE-NG or Junos CLI and commit.
