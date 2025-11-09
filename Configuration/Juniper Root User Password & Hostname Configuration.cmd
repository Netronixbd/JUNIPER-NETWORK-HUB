# -------------------------------
# Step 1: Configure Root User Password
# -------------------------------
# Enter configuration mode
configure

# Set root password (plain-text)
set system root-authentication plain-text-password
# You will be prompted to enter the new password twice

# Save configuration
commit

# -------------------------------
# Step 2: Change Junos Hostname
# -------------------------------
# Example: Change hostname to NIS-Core
set system host-name NIS-Core

# Compare changes (optional)
show | compare

# Check configuration syntax
commit check

# Commit changes
commit

# -------------------------------
# Notes:
# - Setting root password ensures secure access to Juniper device
# - Changing hostname helps identify the router easily in the network
# - Always verify configuration with 'commit check' before saving
