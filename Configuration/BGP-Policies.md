set logical-systems IIG-RT policy-options policy-statement NTX-CCR-INT-IN term 1 from route-filter 1.1.1.1/30 exact
set logical-systems IIG-RT policy-options policy-statement NTX-CCR-INT-IN term 1 then accept
set logical-systems IIG-RT policy-options policy-statement NTX-CCR-INT-IN term 100 then reject

