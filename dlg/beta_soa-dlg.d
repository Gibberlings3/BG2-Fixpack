// don't set aerieromanceactive if aerie not a match, pt 1/5
ADD_TRANS_TRIGGER AERIE 4 ~Global("AerieMatch","GLOBAL",1)~ 10 21 25 DO 0 1 2

// don't set aerieromanceactive if aerie not a match, pt 2/5
EXTEND_BOTTOM AERIE 4
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #42158 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                             SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 52
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #58678 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                             SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 52
  IF ~Global("AerieMatch","GLOBAL",0)~ THEN REPLY #42159 DO ~SetInterrupt(FALSE)
                                                             SetGlobal("AerieTransform","GLOBAL",2)
                                                             SetGlobal("AerieJoined","GLOBAL",1)
                                                             JoinParty()
                                                             SetInterrupt(TRUE)~ EXIT
END

// don't set aerieromanceactive if aerie not a match, pt 3/5
EXTEND_BOTTOM AERIE 10
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #42161 DO ~SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 53
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #58677 DO ~SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 56
  IF ~Global("AerieMatch","GLOBAL",0)~ THEN REPLY #42162 DO ~SetGlobal("AerieJoined","GLOBAL",1)
                                                             JoinParty()~ EXIT
END

// don't set aerieromanceactive if aerie not a match, pt 4/5
EXTEND_BOTTOM AERIE 21
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #42168 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                            SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 54
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #58676 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                            SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 56
  IF ~Global("AerieMatch","GLOBAL",0)~ THEN REPLY #42169 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                             SetGlobal("AerieJoined","GLOBAL",1)
                                                             JoinParty()~ EXIT
END

// don't set aerieromanceactive if aerie not a match, pt 5/5
EXTEND_BOTTOM AERIE 25
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #42170 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                            SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 55
  IF ~Global("AerieMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #58674 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                            SetGlobal("AerieJoined","GLOBAL",1)~ GOTO 56
  IF ~Global("AerieMatch","GLOBAL",0)~ THEN REPLY #42171 DO ~SetGlobal("AerieTransform","GLOBAL",2)
                                                             SetGlobal("AerieJoined","GLOBAL",1)
                                                             JoinParty()~ EXIT
END

// anomen's quest breaks for non-romanceable females, pt 1/3
ALTER_TRANS ANOMEN BEGIN 6 10 17 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~Global("AnomenMatch","GLOBAL",1)~
END

// anomen's quest breaks for non-romanceable females, pt 2/3
ALTER_TRANS ANOMEN BEGIN 20 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~Global("AnomenMatch","GLOBAL",1)~
END

// anomen's quest breaks for non-romanceable females, pt 3/3
ALTER_TRANS ANOMEN BEGIN 6 10 17 20 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~!Global("AnomenMatch","GLOBAL",1)~
END

// player still receives profits from playhouse even if sold to higgold
// move setglobal from here...
ALTER_TRANS BDHIGG01 BEGIN 156 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~SetGlobal("ReturnToPositions","AR0523",1)~
END
// ... to here
ADD_TRANS_ACTION BDHIGG01
BEGIN 154 END
BEGIN 1 END
~SetGlobal("BardPlotOn","GLOBAL",5)~

// with bardploton properly going to 6, now need to exclude old triggers to prevent re-selling the playhouse
ADD_STATE_TRIGGER BDHIGG01 140 ~!Global("BardPlotOn","GLOBAL",6)~
ADD_STATE_TRIGGER BDHIGG01 148 ~!Global("BardPlotOn","GLOBAL",6)~
ADD_STATE_TRIGGER BDHIGG01 158 ~!Global("BardPlotOn","GLOBAL",6)~
REPLACE_STATE_TRIGGER BDHIGG01 166
~OR(2)
  Global("BardPlotOn","GLOBAL",5)
  Global("BardPlotOn","GLOBAL",6)~
  
// un-hose multi- and dual-classed druids qualifying for great druid title
REPLACE CECHALLE 
  IF ~~ THEN BEGIN 2 SAY #8697
    IF ~!Class(Player1,DRUID_ALL)~ THEN REPLY #55514 EXIT
    IF ~Class(Player1,DRUID_ALL)
        !Class(Player1,FIGHTER_DRUID)
        LevelGT(Player1,13)
        Global("GreatDruid","GLOBAL",0)
        !Global("GaveTitle","LOCALS",1)~ THEN REPLY #55515 DO ~ClearAllActions()
                                                               StartCutSceneMode()
                                                               StartCutScene("Cut63a")~ EXIT
    IF ~Class(Player1,FIGHTER_DRUID)
        CheckStatGT(Player1,13,LEVEL2)
        Global("GreatDruid","GLOBAL",0)
        !Global("GaveTitle","LOCALS",1)~ THEN REPLY #55515 DO ~ClearAllActions()
                                                               StartCutSceneMode()
                                                               StartCutScene("Cut63a")~ EXIT
    IF ~Class(Player1,DRUID_ALL)
        !Class(Player1,FIGHTER_DRUID)
        LevelLT(Player1,14)
        Global("GreatDruid","GLOBAL",0)
        !Global("GaveTitle","LOCALS",1)~ THEN REPLY #58673 EXIT
    IF ~Class(Player1,FIGHTER_DRUID)
        CheckStatLT(Player1,14,LEVEL2)
        Global("GreatDruid","GLOBAL",0)
        !Global("GaveTitle","LOCALS",1)~ THEN REPLY #58673 EXIT
    IF ~Global("GaveTitle","LOCALS",1)~ THEN REPLY #62151 GOTO 16
  END
END

// dialogue should check live and dead troll DV
REPLACE_TRIGGER_TEXT ~firamb01~ ~Dead("firamb05")~ ~OR(2) Dead("firamb03") Dead("firamb05")~

// infinite xp exploit for juggernait golem-jermien-daar-colette stuff in imnesvale
REPLACE_ACTION_TEXT JUGDAR01 ~\([^,]\)EscapeArea()~ ~\1SetInterrupt(FALSE) DialogueInterrupt(FALSE) EscapeArea()~
REPLACE_ACTION_TEXT JUGJER01 ~EscapeArea()~ ~SetInterrupt(FALSE) DialogueInterrupt(FALSE) EscapeArea()~

// if party already has already gone to spellhold, disable transitions to ask about how to get in
ADD_TRANS_TRIGGER PIRMUR09 15 ~Global("HasAsylumWardstone","GLOBAL",0) Global("PPdeshSend","GLOBAL",0)~ DO 0

// if party already has already gone to spellhold, disable transitions to ask about how to get in
ADD_TRANS_TRIGGER PIRMUR10 12 ~Global("HasAsylumWardstone","GLOBAL",0) Global("PPdeshSend","GLOBAL",0)~ DO 0

// in one branch, desharik not setting var of sending party to spellhold
ADD_TRANS_ACTION PPDESH BEGIN 18 END BEGIN 0 END ~SetGlobal("PPdeshSend","GLOBAL",1)~

// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// last brynnlaw dialogue; destroyself() to avoid ar1600 saemon talking instead of ar1617 one
ALTER_TRANS PPSAEM3 BEGIN 70 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~GiveItemCreate("misc8u",LastTalkedToBy,0,0,0)
          StartCutSceneMode()
          StartCutScene("Cut41q")
          Wait(1) 
          DestroySelf()~
END

// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// give Saemon a true() trigger during gith attack
ADD_STATE_TRIGGER PPSAEM3 59 ~Global("AsylumPlot","GLOBAL",81)~

// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// if player talks to saemon during attack (saemon teleports away), then end dialogue here instead of handing to saemon
EXTEND_BOTTOM PPSAILOR 1
  IF ~Global("AsylumPlot","GLOBAL",200)~ THEN EXIT
END

// prevent dupe CoC items; see also sahkng01.bcs, ar2300.bcs, sahpr4.cre, string sets
REPLACE_ACTION_TEXT SAHPR2 ~GiveItemCreate("key24",LastTalkedToBy,0,0,0)~ ~~
REPLACE_ACTION_TEXT SAHPR2 ~GiveItemCreate("miscbi",LastTalkedToBy,0,0,0)~ ~~

// not paying thieves guild quota fix; see also ar0322.bcs, baldur.bcs, joster.bcs, shthlt01.dlg
ADD_STATE_TRIGGER SHTHLT01 1 ~Global("PGFailed","GLOBAL",0)~ 143 144

// uder mordin shouldn't hand out finished quests
ADD_STATE_TRIGGER UDDUER02 4 ~Global("makeMage","AR2100",0)~
ADD_STATE_TRIGGER UDDUER02 5 ~Global("makeMage","AR2100",0)~

// don't set viconiaromanceactive if viconia not a match, pt 1/3
ADD_TRANS_TRIGGER VICONI 4 ~Global("ViconiaMatch","GLOBAL",1)~ DO 0 1 2
ADD_TRANS_TRIGGER VICONI 5 ~Global("ViconiaMatch","GLOBAL",1)~ DO 1

// don't set viconiaromanceactive if viconia not a match, pt 2/3
EXTEND_BOTTOM VICONI 4
  IF ~Global("ViconiaMatch","GLOBAL",0)
      Global("toldViconiaImoen","LOCALS",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #42195 GOTO 18
  IF ~Global("ViconiaMatch","GLOBAL",0)
      GlobalLT("chapter","GLOBAL",4)~ THEN REPLY #58670 GOTO 27
  IF ~Global("ViconiaMatch","GLOBAL",0)~ THEN REPLY #42196 DO ~JoinParty()~ EXIT
END

// don't set viconiaromanceactive if viconia not a match, pt 3/3
EXTEND_BOTTOM VICONI 5
  IF ~Global("ViconiaMatch","GLOBAL",0)~ THEN REPLY #8246 GOTO 6
END

// sages should offer counsel immediately after love interest kidnapped
ALTER_TRANS WARSAGE BEGIN 0 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~!Dead("c6bodhi")
OR(8)
  Global("AerieVampire","GLOBAL",1)
  Global("AerieVampire","GLOBAL",2)
  Global("AnomenVampire","GLOBAL",1)
  Global("AnomenVampire","GLOBAL",2)
  Global("JaheiraVampire","GLOBAL",1)
  Global("JaheiraVampire","GLOBAL",2)
  Global("ViconiaVampire","GLOBAL",1)
  Global("ViconiaVampire","GLOBAL",2)~
END

// prevent Yoshimo telling you to see Renal when you already have
ADD_STATE_TRIGGER YOSHJ 129 ~Global("TalkedToRenal","GLOBAL",0)~

// No valid replies or links for Cernd
ALTER_TRANS cernd BEGIN 6 END BEGIN 0 END BEGIN TRIGGER
~!Class(Player1,DRUID_ALL) !Class(Player1,RANGER_ALL) !InParty("Jaheira") !InParty("Minsc")~ END

// Romance interests can comment on PhaereInnuendo in chapter 6 if they were not in the party during chapter 5 (the bigg)
ADD_STATE_TRIGGER ~AERIEJ~ 119 ~Global("Chapter","GLOBAL",5)~ 124 126
ADD_STATE_TRIGGER ~JAHEIRAJ~ 437 ~Global("Chapter","GLOBAL",5)~ 441 447
ADD_STATE_TRIGGER ~VICONIJ~ 97 ~Global("Chapter","GLOBAL",5)~ 106 108
