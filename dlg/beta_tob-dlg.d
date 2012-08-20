// fix anomen's banter linking to non-present party members
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Korgan")~ DO 1
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Mazzy")~ DO 2
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Jaheira")~ DO 3
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Keldorn")~ DO 4

// keldorn should link back to one last anomen retort
ALTER_TRANS BKELDO25 BEGIN 33 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN BANOME25 52~
END

// yet more garren windspear
ADD_TRANS_ACTION FIRKRA02 BEGIN 34 END BEGIN END ~AddXPObject(Player1,40500)~
ADD_TRANS_ACTION GARREN BEGIN 45 END BEGIN 1 END ~ActionOverride("firban01",DestroySelf())
ActionOverride("firban02",DestroySelf())
ActionOverride("firban03",DestroySelf())
ActionOverride("firban04",DestroySelf())
ActionOverride("firban05",DestroySelf())
ActionOverride("garjum",DestroySelf())
SetGlobal("DomainPaladinBattle","GLOBAL",5)~