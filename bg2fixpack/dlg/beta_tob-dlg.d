// solo players w/o remove curse can get permanently screwed with high priestess draw
EXTEND_BOTTOM GORCAMB 62
  IF ~RandomNum(2,1) NumInParty(1)~ THEN DO ~SetGlobal("PlayerDraw","GLOBAL",4)~ GOTO 35 // sub strife for high priestess, but only for solo players
END