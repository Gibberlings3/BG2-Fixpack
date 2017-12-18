// force-talking draconis can cause bad things; see also bazdra01.bcs
ADD_TRANS_ACTION BAZDRA01 BEGIN 5 END BEGIN END ~SetGlobal("cd_transform","LOCALS",1)~

// love talk could repeat as variable not bumped
ADD_TRANS_ACTION BVICON25 BEGIN 125 END BEGIN END ~IncrementGlobal("ExpLoveTalk","LOCALS",1)~

// solo players w/o remove curse can get permanently screwed with high priestess draw
EXTEND_BOTTOM GORCAMB 62
  IF ~RandomNum(2,1) NumInParty(1)~ THEN DO ~SetGlobal("PlayerDraw","GLOBAL",4)~ GOTO 35 // sub strife for high priestess, but only for solo players
END