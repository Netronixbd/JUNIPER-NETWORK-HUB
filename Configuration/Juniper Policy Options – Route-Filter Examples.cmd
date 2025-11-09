# -------------------------------
# 1. Default Route Filter Example
# Purpose: Send Default Gateway (0.0.0.0/0) to a client's BGP
# -------------------------------

# Enter configuration mode
configure

# Create policy statement for default route
set policy-options policy-statement DEFAULT-FOR-CLIENT term 1 from route-filter 0.0.0.0/0 exact
set policy-options policy-statement DEFAULT-FOR-CLIENT term 1 then accept
set policy-options policy-statement DEFAULT-FOR-CLIENT term 2 then reject

# Explanation:
# Term 1 -> Accepts the default route (0.0.0.0/0)
# Term 2 -> Rejects everything else
# You can modify terms as per your requirement

# -------------------------------
# 2. Real IP Prefix Route Filter Example (Client-In Filter)
# Purpose: Allow client to receive Internet service through assigned real IPs
# -------------------------------

# Create policy statement for client real IPs
set policy-options policy-statement IMPORT-FROM-Saiful-IIG term 1 from route-filter 114.130.28.12/30 exact
set policy-options policy-statement IMPORT-FROM-Saiful-IIG term 1 from route-filter 114.130.28.16/30 exact
set policy-options policy-statement IMPORT-FROM-Saiful-IIG term 1 then accept
set policy-options policy-statement IMPORT-FROM-Saiful-IIG term 2 then reject

# Explanation:
# Term 1 -> Accepts specific real IP prefixes (client IPs)
# Term 2 -> Rejects all other routes
# Ensures the client receives only intended prefixes
