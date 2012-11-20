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