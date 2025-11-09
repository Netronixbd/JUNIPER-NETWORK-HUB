# -------------------------------
# 1. Login & Enter Configuration Mode
# -------------------------------
login: afnan
Password:

configure
# Now you are in configuration mode

# -------------------------------
# 2. Create VLAN on an Interface
# Example: LACP port channel ae2, VLAN ID 321
# -------------------------------
set interfaces ae2 unit 321 vlan-id 321

# Check configuration
commit check
# Save configuration
commit

# Note: 'ae2' is the LACP port channel in this example

# -------------------------------
# 3. Set VLAN Description
# -------------------------------
set interfaces ae2 unit 321 description "<Your Description>"

# Check & commit
commit check
commit

# -------------------------------
# 4. Assign IP Address to VLAN
# -------------------------------
# In Juniper, IP is assigned per unit (unit = VLAN segment)
set interfaces ae2 unit 321 family inet address 10.100.100.49/30

# Check & commit
commit check
commit

# Note: Unit acts as a "room" for VLAN, IP, and description. Each VLAN should have a separate unit.
