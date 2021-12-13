// ranger stronghold fails if you're in Umar Hills when Delon spawn timer expires; see also ar1100.bcs
ADD_TRANS_ACTION delon BEGIN 21 END BEGIN END ~SetGlobal("CDDelonSpoke","GLOBAL",1)~