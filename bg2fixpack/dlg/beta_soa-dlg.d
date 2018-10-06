// prophet and gaal dialogue variable sets for nallabir, oisig, arval

// two demons in area use same dialogue; using absolute coords for minions results in two sets at same place even though one demon is across the map
ALTER_TRANS ABYDEM01 BEGIN 0 END BEGIN 0 END BEGIN
ACTION ~ReallyForceSpell(Myself,RED_PILLAR_VISUAL) // SPIN867.SPL (No such index)
        CreateCreatureObjectOffset("imp01",Myself,[127.-171]) // Imp
        CreateCreatureObjectOffset("imp01",Myself,[-60.201]) // Imp
        CreateCreatureObjectOffset("imp01",Myself,[-158.231]) // Imp
        CreateCreatureObjectOffset("impqua01",Myself,[-310.150]) // Quasit
        CreateCreatureObjectOffset("impqua01",Myself,[199.-162]) // Quasit
        CreateCreatureObjectOffset("mepfir01",Myself,[89.189]) // Fire Mephit
        CreateCreatureObjectOffset("mepfir01",Myself,[255.13]) // Fire Mephit
        Enemy()~ END

// other "i'm leaving " replies lead here
ALTER_TRANS ACOLYTE2 BEGIN 2 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 4~ END // originally went to 3

// make aerie's ogre transformation uninterrruptale
ALTER_TRANS AERIE BEGIN 2 END BEGIN 0 END BEGIN ACTION
~SetInterrupt(FALSE)
DialogInterrupt(FALSE)
TakePartyItem("MISC4Q")
DestroyItem("MISC4Q")
AddexperienceParty(18500)
SetGlobal("AerieTransform","GLOBAL",1)
Wait(1)
Polymorph(MAGE_FEMALE_ELF)
ApplySpell(Myself,AERIE_PORTRAIT)
Wait(2)
SetInterrupt(TRUE)
DialogInterrupt(TRUE)
StartDialogueNoSet([PC])~
END

// samia's party can spawn even if she's dead; see also ar1202.bcs
ADD_TRANS_ACTION AKAE BEGIN 0 END BEGIN END ~EraseJournalEntry(7167) AddJournalEntry(7168,QUEST_DONE)~

// restore one more line about bodhi
ALTER_TRANS ARAN BEGIN 24 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 11~ END

// prevent haz from dying from dead grimwarders; see also arnfgt06.bcs
ADD_STATE_TRIGGER ARNFGT06 2 ~!NumDead("bodfgt01",2)~ // two bodfgt01s trying to kill haz; don't die if they're not already dead

// missy has more coat dialogues
ALTER_TRANS ARNGRL01 BEGIN 5 END BEGIN END BEGIN EPILOGUE ~GOTO 6~ END // one more state and some dialogue

// no valid links
REPLACE_STATE_TRIGGER ARNMAN06 8 ~RandomNum(5,2)~ // has dupe 5,3 state triggers and no 5,2

// restore aerie-jan banter
ADD_STATE_TRIGGER BAERIE 44 ~InParty("Jan") See("Jan") !StateCheck("Jan",STATE_SLEEPING) Global("CDAerieJanBanter","LOCALS",0)~
ADD_TRANS_ACTION BAERIE BEGIN 44 END BEGIN END ~SetGlobal("CDAerieJanBanter","LOCALS",1)~

// restore aerie-minsc banter
ADD_STATE_TRIGGER BAERIE 76 ~InParty("Minsc") See("Minsc") !StateCheck("Minsc",STATE_SLEEPING) Global("CDAerieMinscBanter","LOCALS",0) AreaType(FOREST)~
ADD_TRANS_ACTION BAERIE BEGIN 76 END BEGIN END ~SetGlobal("CDAerieMinscBanter","LOCALS",1)~

// give aerie a slightly different line if quayle is dead; see also ar0607.bcs
ADD_TRANS_TRIGGER BAERIE 120 ~!Dead("quayle")~ DO 1

// blank exit trigger just cuts dialogue short; has three perfectly valid responses
ADD_TRANS_TRIGGER BANOMEN 178 ~False()~ DO 3

// another double partyrested() trigger; removing partyrested from trigger, adding !city and CC(0) to match script; see also anomen.bcs
REPLACE_STATE_TRIGGER BANOMEN 27 ~AreaType(OUTDOOR) !AreaType(CITY) See(Player1) !StateCheck(Player1,STATE_SLEEPING) CombatCounter(0) Global("BAnomen4","LOCALS",1)~ // bring in line with script trigger, purge unnecessary global
ALTER_TRANS BANOMEN BEGIN 27 END BEGIN END BEGIN ~ACTION~ ~SetGlobal("BAnomen4","LOCALS",2)~ END
SET_WEIGHT BANOMEN 27  #31 // after lovetalks, quest but before other random banters
SET_WEIGHT BANOMEN 10  #32 // after lovetalks, quest but before other random banters

// one more line
ALTER_TRANS BANOMEN BEGIN 257 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 258~ END // originally just exited

// jenna has no comment for play quality 1 or 2
REPLACE_STATE_TRIGGER BDACT03 0
~GlobalLT("PlayQuality","GLOBAL",6)
GlobalGT("PlayQuality","GLOBAL",0) // was 2 here
!Global("BardPlotOn","GLOBAL",2)~

// send improvisation bitch down different path than zaren's rewrite path
ALTER_TRANS BDACT04 BEGIN 26 END BEGIN END BEGIN EPILOGUE ~EXTERN BDACT05 17~ END // send to different chain through dialogue

// missing cutscene during bard play rehearsal
ALTER_TRANS BDACT08 BEGIN 14 END BEGIN END BEGIN
  ACTION ~StartCutSceneMode() StartCutScene("Cut31r2")~ 
  EPILOGUE ~EXIT~
END

// council member doesn't have 1000 gp to give
REPLACE_ACTION_TEXT BDCOUN01 ~GivePartyGold(1000)~ ~GiveGoldForce(1000)~

// edwin-jan banter going to wrong reply
ALTER_TRANS BEDWIN BEGIN 58 END BEGIN END BEGIN EPILOGUE ~EXTERN BJAN 101~ END // wrong reply

// edwin's low-hp banter with aerie uses wrong var, hp threshold... see also edwin.bcs
REPLACE_TRIGGER_TEXT ~BEDWIN~ ~HPPercentLT(Myself,15)~ ~HPPercentLT(Myself,25)~

APPEND BEDWIN // banters for female edwin pass along to unused bedwinwo; see bminsc.dlg and bjaheir.dlg

  IF ~~ THEN BEGIN BedwinwoReplace7064 SAY #7064
    IF ~~ THEN EXTERN BMINSC 70
  END

  IF ~~ THEN BEGIN BedwinwoReplace7066 SAY #7066
    IF ~~ THEN EXTERN BMINSC 71
  END

  IF ~~ THEN BEGIN BedwinwoReplace7403 SAY #7403 = #37519
    IF ~~ THEN EXIT
  END

END

// better bernard response
ALTER_TRANS BERNARD BEGIN 8 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 3~ END // originally to 5 (can get there from 3)

// if you just kill lehtinan, you can say "hendak promised a discout" to bernard even though you've never met hendak
ADD_TRANS_TRIGGER BERNARD 22 ~GlobalGT("HendakReleased","AR0406",2)~ DO 2 // only if you know

// restore haer'dalis-mazzy banter
ADD_STATE_TRIGGER BHAERDA 2 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",STATE_SLEEPING) Global("CDHaerdalisMazzyBanter","LOCALS",0)~
ADD_TRANS_ACTION BHAERDA BEGIN 2 END BEGIN END ~SetGlobal("CDHaerdalisMazzyBanter","LOCALS",1)~

// haer'dalis-aerie breakup banter could repeat
ADD_STATE_TRIGGER BHAERDA 154 ~!Global("HaerDalisRomanceActive","GLOBAL",3)~

// can ask about imoen and/or ST-Bodhi war even after both are resolved
// should be able to report progress to temple officials; see also gaal.dlg, prophet1-4.dlg
ADD_TRANS_TRIGGER BHNALLA 23 ~Global("KnowBeholder","GLOBAL",1)~ DO 0 // only if you know
ADD_TRANS_TRIGGER BHNALLA 47 ~Global("chapter","GLOBAL",2)~ DO 0 1 // limit ST/Imoen questions
ADD_TRANS_TRIGGER BHNALLA 53 ~Global("chapter","GLOBAL",2)~ DO 0   // limit ST/Imoen questions

// oisig has more to say; can ask about imoen and/or ST-Bodhi war even after both are resolved
ALTER_TRANS BHOISIG BEGIN 55 END BEGIN END BEGIN EPILOGUE ~GOTO 56~ END // one last line
ADD_TRANS_TRIGGER BHOISIG 50 ~Global("chapter","GLOBAL",2)~ DO 0 1 // limit ST/Imoen questions (also gatekeeper on same questions in states 53, 56)

// dual-classing to a non-neutral cleric during the Unseeing Eye quest breaks the quest; see also ar0900.bcs, ar0901.bcs, ar0902.bcs, ar0904.bcs
EXTEND_BOTTOM BHOISIG 0
  IF ~Global("cd_beholder_dc_shenanigans","GLOBAL",1)~ GOTO 1
END

EXTEND_BOTTOM BHOISIG 30
  IF ~Global("cd_beholder_dc_shenanigans","GLOBAL",1)~ GOTO 32
END

APPEND BHOISIG

  IF WEIGHT #1 ~InPartySlot(LastTalkedToBy,0)
                !NumberOfTimesTalkedTo(0)
                ReputationGT(Player1,14)
                Global("BeholderPlot","GLOBAL",0)
                Global("NoHelpBeholder","GLOBAL",0)
                Global("cd_beholder_dc_shenanigans","GLOBAL",1)~ THEN BEGIN cd_oisig_shenanigans1 SAY #28281
    IF ~~ THEN GOTO 10
  END

  IF WEIGHT #1 ~InPartySlot(LastTalkedToBy,0)
                !NumberOfTimesTalkedTo(0)
                ReputationLT(Player1,15)
                Global("BeholderPlot","GLOBAL",0)
                Global("NoHelpBeholder","GLOBAL",0)
                Global("cd_beholder_dc_shenanigans","GLOBAL",1)~ THEN BEGIN cd_oisig_shenanigans2 SAY #28282
    IF ~~ THEN GOTO 10
  END

END

// banters for female edwin pass along to unused bedwinwo; see bminsc.dlg and bedwin.dlg
ALTER_TRANS BJAHEIR BEGIN 13 END BEGIN END BEGIN EPILOGUE ~EXTERN BEDWIN BedwinwoReplace7403~ END // strref 7403

// jaheira wounded banters can repeat due to var type; also missing See() check for Mazzy one
REPLACE_ACTION_TEXT ~bjaheir~ ~SetGlobal("JaheriaBelow15","LOCALS",1)~ ~SetGlobal("JaheiraBelow15","LOCALS",1)~
ADD_STATE_TRIGGER   ~bjaheir~ 31 ~See("Mazzy")~

// adds a cernd response to jaheira's interjection; originally > cernd 16, now cernd 78 > 16
ALTER_TRANS BJAHEIR BEGIN 15 END BEGIN END BEGIN ~EPILOGUE~ ~EXTERN CERND 78~ END

// banter with edwin mentions being in jaheira's domain and traveling back to the city
ADD_STATE_TRIGGER BJAHEIR 36 ~AreaType(FOREST)~

// but wait, there's more... of this jan-aerie banter
ALTER_TRANS BJAN BEGIN 73 END BEGIN END BEGIN EPILOGUE ~EXTERN BAERIE 49~ END // wrong reply

// one line missing from mazzy-haer'dalis
ALTER_TRANS BMAZZY BEGIN 42 END BEGIN END BEGIN EPILOGUE ~EXTERN BHAERDA 3~ END // wrong reply

// third keldorn-minsc berserk banter should end the series, since there's no fourth
ALTER_TRANS BMINSC BEGIN 46 END BEGIN END BEGIN ACTION ~SetGlobal("MinscBerserker","GLOBAL",2) IncrementGlobal("MinscKeldorn","LOCALS",1)~ END

// banters for female edwin pass along to unused bedwinwo; see bedwin.dlg and bjaheir.dlg
ALTER_TRANS BMINSC  BEGIN 69 END BEGIN END BEGIN EPILOGUE ~EXTERN BEDWIN BedwinwoReplace7064~ END // strref 7064
ALTER_TRANS BMINSC  BEGIN 70 END BEGIN END BEGIN EPILOGUE ~EXTERN BEDWIN BedwinwoReplace7066~ END // strref 7066

// restore minsc-mazzy banter; see minsc.bcs
ADD_STATE_TRIGGER BMINSC 30 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",STATE_SLEEPING) Global("CDMinscMazzyBanter","LOCALS",2)~
ADD_TRANS_ACTION BMINSC BEGIN 30 END BEGIN END ~SetGlobal("CDMinscMazzyBanter","LOCALS",3)~

// one more nalia complaint before handoff to mazzy
ALTER_TRANS BNALIA BEGIN 0 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 47~ END // originally went to bmazzy 3, now bnalia 47 > bmazzy 3

// restoring one more line makes a better response from Bodhi here
ALTER_TRANS BODHI BEGIN 11 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 14~ END

// if you work for bodhi, two journal entries about gaelan never go away
ADD_TRANS_ACTION BODHI BEGIN 18 END BEGIN 0 1 2 END ~EraseJournalEntry(34183) EraseJournalEntry(34187)~

// restores one more line about STs
ALTER_TRANS BODHI BEGIN 85 END BEGIN END BEGIN ~EPILOGUE~ ~GOTO 86~ END

// valygar speaks as though lavok has already been taken care of
ADD_STATE_TRIGGER BVALYGA 41 ~Dead("Lavok02")~

// restore valygar-korgan banter
ADD_STATE_TRIGGER BVALYGA 65 ~InParty("Korgan") See("Korgan") !StateCheck("Korgan",STATE_SLEEPING) Global("CDValygarKorganBanter","LOCALS",0)~
ADD_TRANS_ACTION BVALYGA BEGIN 65 END BEGIN END ~SetGlobal("CDValygarKorganBanter","LOCALS",1)~

// restore viconia-mazzy banter
ADD_STATE_TRIGGER BVICONI 7 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",STATE_SLEEPING) Global("CDViconiaMazzyBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 7 END BEGIN END ~SetGlobal("CDViconiaMazzyBanter","LOCALS",1)~

// restore viconia-yoshimo banter
ADD_STATE_TRIGGER BVICONI 8 ~InParty("Yoshimo") See("Yoshimo") !StateCheck("Yoshimo",STATE_SLEEPING) Global("CDViconiaYoshimoBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 8 END BEGIN END ~SetGlobal("CDViconiaYoshimoBanter","LOCALS",1)~

// restore viconia-jan banter
ADD_STATE_TRIGGER BVICONI 24 ~InParty("Jan") See("Jan") !StateCheck("Jan",STATE_SLEEPING) Global("CDViconiaJanBanter","LOCALS",0)~
ADD_TRANS_ACTION BVICONI BEGIN 24 END BEGIN END ~SetGlobal("CDViconiaJanBanter","LOCALS",1)~

// extra lines, better order in viconia's banter about husbands, now 156 > 158 > 159 > 157 > 87, was 156 > 157 > 87
ALTER_TRANS BVICONI BEGIN 156 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 158~ END // originally went straight to 157
ALTER_TRANS BVICONI BEGIN 159 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 157~ END // originally to 87

// restores extra exposition line re: lolth
ALTER_TRANS BVICONI BEGIN 332 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 433~ END // originally went to 336, now 433 > 336
ALTER_TRANS BVICONI BEGIN 341 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 433~ END // originally went to 336, now 433 > 336

// restore yoshimo-aerie and yoshimo-minsc banters; see yoshimo.bcs
ADD_STATE_TRIGGER BYOSHIM 0 ~InParty("Aerie") See("Aerie") !StateCheck("Aerie",STATE_SLEEPING) Global("CDYoshimoAerieBanter","LOCALS",2)~
ADD_TRANS_ACTION BYOSHIM BEGIN 0 END BEGIN END ~SetGlobal("CDYoshimoAerieBanter","LOCALS",3)~
REPLACE_STATE_TRIGGER BYOSHIM 71 ~InParty("Minsc") See("Minsc") HPLT("Minsc",20) !StateCheck("Minsc",STATE_SLEEPING) CombatCounter(0) Global("BYoshimo13","LOCALS",1)~ // triggers present, but commented out and false'd

// change hot mess of imoen triggers to IVFPD for bodhi's first spellhold maze dialogue
ALTER_TRANS C6BODHI  BEGIN   0 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("JAHEIRA") !IsValidForPartyDialog("ANOMEN") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS C6BODHI  BEGIN   0 END BEGIN 6 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("JAHEIRA") !IsValidForPartyDialog("ANOMEN") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS JAHEIRAJ BEGIN 488 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("ANOMEN") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS JAHEIRAJ BEGIN 488 END BEGIN 5 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("ANOMEN") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS ANOMENJ  BEGIN 278 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS ANOMENJ  BEGIN 278 END BEGIN 4 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("HAERDALIS") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS HAERDAJ  BEGIN 128 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS HAERDAJ  BEGIN 128 END BEGIN 3 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("KORGAN") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS KORGANJ  BEGIN 158 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS KORGANJ  BEGIN 158 END BEGIN 2 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2") !IsValidForPartyDialog("MINSC")~ END
ALTER_TRANS MINSCJ   BEGIN 184 END BEGIN 0 END BEGIN TRIGGER ~!IsValidForPartyDialog("imoen2")~ END
ALTER_TRANS MINSCJ   BEGIN 184 END BEGIN 1 END BEGIN TRIGGER ~IsValidForPartyDialog("imoen2")~ END

// 'tracking irenicus' journal entry never goes away
ADD_TRANS_ACTION C6ELHAN2 BEGIN 0 END BEGIN END ~EraseJournalEntry(57515)~
ALTER_TRANS UDDUER01 BEGIN 10 END BEGIN END BEGIN "UNSOLVED_JOURNAL" ~~ "JOURNAL" ~#57515~ END // also make sure it's set as a generic journal entry consistently

// journal entry only being added on 1/3 entries
ALTER_TRANS CLGLIN01 BEGIN 8 END BEGIN 1 2 END BEGIN "UNSOLVED_JOURNAL" ~#55571~ END

// corgeig axehand can be exploited for infinte xp
ADD_STATE_TRIGGER CORGEIG 28 ~Global("NaliaIsaeaPlotDone","GLOBAL",0)~
APPEND CORGEIG

  IF ~True()~ THEN BEGIN corgeig_generic SAY #36777 // Good day to you, <CHARNAME>.
    IF ~~ THEN EXIT
  END

END

// more prophets for the Unseeing Eye; see also ar0500.bcs, ar0700.bcs, prophet.bcs
ADD_TRANS_ACTION CSGAAL BEGIN 11 END BEGIN END ~SetGlobal("GaalSpoke","GLOBAL",1)~

// handmaiden not actually taking your money
ADD_TRANS_ACTION DADROW12 BEGIN 24 END BEGIN 1 END ~TakePartyGold(2000)~

// freedom may cost a buck oh five, but umber hulks should be 1500
ADD_TRANS_ACTION DADROW16 BEGIN 8 END BEGIN 3 END ~TakePartyGold(1500)~

// one more line for ust natha githyanki
ALTER_TRANS DAGITH1 BEGIN 6 END BEGIN 0 END BEGIN EPILOGUE ~GOTO 7~ END

// strref #20986 should be an unsolved journal entry, not generic journal
ALTER_TRANS DALESON  BEGIN 42 43 END BEGIN 0 END BEGIN "JOURNAL" ~~ "UNSOLVED_JOURNAL" ~#20986~ END
ALTER_TRANS KPCAPT01 BEGIN 11    END BEGIN 0 END BEGIN "JOURNAL" ~~ "UNSOLVED_JOURNAL" ~#20986~ END

// additional line about Nalia
ALTER_TRANS DALESON BEGIN 5 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 32~ END // originally went to 11, but other Nalia questions go through 32 then 11

// threatening the beggar goes to correct response
ALTER_TRANS DBEGGAR BEGIN 1 END BEGIN 4 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // originally went to 7

// restores an extra insult of Delcia's
ALTER_TRANS DELCIA BEGIN 38 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // original went to 7, now 6 > 7

// demson handing out waaaaay too much XP here
ALTER_TRANS DEMSON BEGIN 21 END BEGIN END BEGIN ACTION ~AddexperienceParty(7500)~ END // was 75k; only get 10k if all three survive

// various dead/alive checks on the farmers missing half of them; see also direct copy-and-patch in main tp2
ADD_TRANS_TRIGGER DEMSON 47 ~!Dead("plfarm04") !Dead("plfarm05") !Dead("plfarm06")~ DO 0 1 2 4
REPLACE_TRIGGER_TEXT DEMSON ~Global("PaladinPlot","GLOBAL",11)~ ~Global("PaladinPlot","GLOBAL",10)~ // value of 11 can't be reached

// restore one more line for Edwin rejoining
ALTER_TRANS EDWINP BEGIN 4 8 END BEGIN 0 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 1~ END

// elgea deleting mae'var journal entry due to transposed numbers; just remove outright since she erases the correct entry a few states later
ALTER_TRANS ELGEA BEGIN 8 END BEGIN 0 END BEGIN ACTION ~~ END

// restore missing branch for spellhold apparition
ALTER_TRANS ELEARB06 BEGIN 0 END BEGIN 3 END BEGIN EPILOGUE ~GOTO 6~ END // one more state and some dialogue

// if you steal the deed from garren and give it to firkraag, garren has wrong responses; see also garren.dlg
REPLACE_ACTION_TEXT FIRKRA02 ~SetGlobal("FirkraagDeal","GLOBAL",0)~ ~SetGlobal("FirkraagDeal","GLOBAL",2)~
REPLACE_STATE_TRIGGER FIRKRA02 26 ~!Global("FirkraagDeal","GLOBAL",1)~ // to allow for new FirkraagDeal=2 value

// sort out journal entries for attacking firkraag; see also dragred.bcs
ALTER_TRANS FIRKRA02 BEGIN 21 END BEGIN 0 END BEGIN ~UNSOLVED_JOURNAL~ ~#15724~ END // change from 22917
ALTER_TRANS FIRKRA02 BEGIN 25 END BEGIN END BEGIN ~UNSOLVED_JOURNAL~ ~~ ~SOLVED_JOURNAL~ ~#22197~ END // change from unsolved to solved
ADD_TRANS_ACTION FIRKRA02 BEGIN 25 END BEGIN END ~EraseJournalEntry(15724)~ // erase the new unsolved journal

// should be able to report progress to temple officials; see also bhnalla.dlg, prophet1-4.dlg
ADD_TRANS_ACTION GAAL BEGIN 14 END BEGIN END ~SetGlobal("KnowBeholder","GLOBAL",1)~ // getting job from gaal reveals beholder

// journal madness if you have 20k gold when you meet gaelan, and give it to him
ALTER_TRANS GAELAN BEGIN 26 33 END BEGIN 3 END BEGIN ACTION ~AddXPObject(Player1,45000)
                                                             AddXPObject(Player2,45000)
                                                             AddXPObject(Player3,45000)
                                                             AddXPObject(Player4,45000)
                                                             AddXPObject(Player5,45000)
                                                             AddXPObject(Player6,45000)
                                                             TakePartyGold(20000)
                                                             DestroyGold(20000)~ END // added destroy gold; can't use A_T_A since it adds is at the top of the stack
ALTER_TRANS GAELAN BEGIN 29 30 END BEGIN 2 END BEGIN ACTION ~AddXPObject(Player1,45000)
                                                             AddXPObject(Player2,45000)
                                                             AddXPObject(Player3,45000)
                                                             AddXPObject(Player4,45000)
                                                             AddXPObject(Player5,45000)
                                                             AddXPObject(Player6,45000)
                                                             TakePartyGold(20000)
                                                             DestroyGold(20000)~ END // added destroy gold; can't use A_T_A since it adds is at the top of the stack
ALTER_TRANS GAELAN BEGIN 31 END BEGIN 0 END BEGIN ACTION ~IncrementChapter("")
                                                          SetGlobal("ShadowWork","GLOBAL",1)
                                                          SetGlobal("WorkingForAran","GLOBAL",1)
                                                          SetGlobal("Chapter2Journal","AR0311",1)
                                                          AddJournalEntry(23458,INFO)~ END // added chap2journal var and journal entry; can't use A_T_A since these actions should be last

// if you steal the deed from garren and give it to firkraag, garren has wrong responses; see also firkra02.dlg
ADD_STATE_TRIGGER GARREN 38 ~!Dead("garkid01") !Dead("garkid02")~

// polite response from player leads to response implying rudeness from player
ALTER_TRANS GERETH BEGIN 3 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 1~ END // originally went to 4
ALTER_TRANS GERETH BEGIN 3 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 4~ END // actual impolite response went to 6

// once slaving exposed, copper cornoet guards shouldn't be turning patrons hostile
ADD_TRANS_ACTION GUARD3 BEGIN 1 3 END BEGIN END ~ChangeAIScript("",CLASS)~ // blanks shout script when turning hostile like copguard.bcs

// asking about the play misses two lines of prior exposition
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 53~ END // originally to 9, now 53 > 54 > 9

// asking for the long version also gets a few more lines
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 50~ END // originally to 7, now 50 > 51 > 7

// gives raelis a few more lines before asking for help
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 2 3 END BEGIN ~EPILOGUE~ ~EXTERN RAELIS 64~ END // originally to raelis 9, now raelis 64 > 65 > 9

// asking about young conduit goes to completely unrelated state
ALTER_TRANS HAERDAJ BEGIN 15 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 57~ END // originally to 8

// hendak not consistently adding 'refused' journal entry
ALTER_TRANS HENDAK BEGIN 13 END BEGIN END BEGIN "UNSOLVED_JOURNAL" ~#16553~ END

// more kangaxx-proofing; see also klkang.bcs
ALTER_TRANS HLKANG BEGIN 3 END BEGIN 0 END BEGIN ACTION ~SetGlobal("cd_change","LOCALS",1)~ END

// hurgis has another line; extend dialogue
ALTER_TRANS HURGISF BEGIN 11 END BEGIN 1 END BEGIN EPILOGUE ~GOTO 12~ ACTION ~~ END // state 12 already has the Enemy() call
ALTER_TRANS HURGISR BEGIN 11 END BEGIN 1 END BEGIN EPILOGUE ~GOTO 12~ ACTION ~~ END // state 12 already has the Enemy() call

// add journal entry for opening doors in opening dungeon
ALTER_TRANS IGOLEM1 BEGIN 13 END BEGIN END BEGIN "SOLVED_JOURNAL" ~#47522~ END

// bypass the wander part of ilyich's script once combat starts; see also ilyich.bcs
ADD_TRANS_ACTION ILYICH BEGIN 0 END BEGIN END ~SetGlobal("duergarleader","LOCALS",9)~

// jaheira can leave if PC is jerk about dead khalid; imoen's dialogue should check she's not leaving before trying to comfort her; see imoen.bcs
ADD_STATE_TRIGGER IMOENJ 29 ~InParty("jaheira")~

// checking for wrong item
REPLACE_TRANS_TRIGGER INSPECT BEGIN 31 END BEGIN 0 END ~PartyHasItem("MISC5J")~ ~PartyHasItem("MISC5G")~

// add mention of option to ask about mages in gov't district (jaheira-ployer quest) to match other dialogue branch
ALTER_TRANS JAHEIRAJ BEGIN 45 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 80~ END // originally went straight to 44, now 80 > 44

// jaheira not setting correct vars in the ployer curse quest
ALTER_TRANS JAHEIRAJ BEGIN 53 END BEGIN 1 2 3 4 END BEGIN ACTION ~SetGlobal("JaheiraCursed","GLOBAL",5)~ END // only transition 0 sets right var
ALTER_TRANS JAHEIRAJ BEGIN 62 END BEGIN 1 2 END BEGIN ACTION ~SetGlobal("JaheiraCursed","GLOBAL",7)~ END // only transition 0 sets right var

// jaheira should start her 'i'm cured' dialogue even if not present when you get her hair; see also jaheira.bcs
REPLACE_STATE_TRIGGER JAHEIRAJ 71 ~Global("JaheiraCursed","GLOBAL",8) PartyHasItem("MISC5V")~ // removes dead ployer condition

// viconia has an interjection available here before aerie
EXTEND_BOTTOM JAHEIRAJ 391
  IF ~IsValidForPartyDialog("Viconia")~ EXTERN ~VICONIJ~ 56
END

// if you piss off jan and he leaves, he's perfectly happy when you try to get him back
ADD_TRANS_ACTION JANJ BEGIN 7 END BEGIN END ~SetGlobal("KickedOut","LOCALS",1) SetGlobal("LeaveJan","GLOBAL",1)~ // set proper leaving vars
ADD_STATE_TRIGGER JANP 24 ~!Global("JanPissed","GLOBAL",1)~ // prevent happy welcome if pissed
ADD_STATE_TRIGGER JANP 34 ~Global("JanPissed","GLOBAL",1)~  // new pissed off dialogue

// should be setting to 2 here, though it appears to be harmless
REPLACE_TRANS_ACTION KELDORP BEGIN 9 END BEGIN 0 END ~SetGlobal("LadyMaria","GLOBAL",4)~ ~SetGlobal("LadyMaria","GLOBAL",2)~

// restore one more line for Keldorn rejoining
ALTER_TRANS KELDORP BEGIN 30 END BEGIN 0 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 31~ END // delete joinparty from 30, as 31 already has it

// olma's dialogue not properly checking she's speaking to the lord of the manor
ADD_STATE_TRIGGER KPCOOK01 0 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 1 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 2 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 3 ~InPartySlot(LastTalkedToBy,0)~
REPLACE_STATE_TRIGGER KPCOOK01 4 ~!InPartySlot(LastTalkedToBy,0)~

// if you ask about taxes first time you speak to the majordomo, you can never see the initial dialogue questions ever again (when merged into core, can dump domo's A_T_T); also keeps delcia from leaving
EXTEND_BOTTOM KPDOMO01 30
  IF ~!NumTimesTalkedToGT(1)~ DO ~GiveGoldForce(1000) IncrementGlobal("KPRevolt","GLOBAL",1)~ GOTO 8 // route back to block 8 instead of 25
END
EXTEND_BOTTOM KPDOMO01 31
  IF ~!NumTimesTalkedToGT(1)~ GOTO 8 // route back to block 8 instead of 25
END

// NVLOR for keep majordomo
ALTER_TRANS KPDOMO01 BEGIN 110 111 END BEGIN 0 END BEGIN TRIGGER ~GlobalLT("KPRevolt","GLOBAL",1)~ END // was < 0; NVLOR for =0

// happiest farmers should go to happiest finish to dialogue
ALTER_TRANS KPFARM01 BEGIN 3 END BEGIN 0 END BEGIN ~EPILOGUE~ ~EXTERN KPFARM04 2~ END // originally went to kpfarm02 4 (happy, but not perfect ending)

// if party saves glaicas after torgal's dead, they never get the flail head
ADD_TRANS_ACTION KPGLAI01 BEGIN 2 END BEGIN 1 END ~GiveItem("blun14c",LastTalkedToBy)~

// goes to nicer, thanks for the money response
ALTER_TRANS KPMERC01 BEGIN 12 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 9~ END // originally went to 14

// lavok has some valygar-specific dialogue here if he's talked about him before
ADD_TRANS_TRIGGER LAVOK 23 ~!Global("vgMentionLavok","GLOBAL",1)~ DO 1

// lavok's pair of post-attack dialogues (states 3, 15) don't have complementary triggers
REPLACE_STATE_TRIGGER LAVOK 3 ~Global("TalkedLavok","GLOBAL",1) IsValidForPartyDialog("Valygar")~

// lehtinan removing wrong journal entry (state 20)
REPLACE_ACTION_TEXT ~lehtin~ ~EraseJournalEntry(16533)~ ~EraseJournalEntry(16553)~

// maevar won't direct you to steal from the lathander temple if a party member is a morninglord, but only checked in 1/3 branches (making replies in states 7 and 10 to be in line with replies from 8)
ADD_TRANS_TRIGGER MAEVAR 7 ~!Kit(Player1,GODLATHANDER) !Kit(Player2,GODLATHANDER) !Kit(Player3,GODLATHANDER) !Kit(Player4,GODLATHANDER) !Kit(Player5,GODLATHANDER) !Kit(Player6,GODLATHANDER)~ 10 DO 0
ALTER_TRANS MAEVAR BEGIN 7 10 END BEGIN 1 END BEGIN TRIGGER ~OR(7) ReputationGT(Player1,9) Kit(Player1,GODLATHANDER) Kit(Player2,GODLATHANDER) Kit(Player3,GODLATHANDER) Kit(Player4,GODLATHANDER) Kit(Player5,GODLATHANDER) Kit(Player6,GODLATHANDER)~ END // exit w/o imoen info

// gives Mazzy a bit more exposition, same routing now as state 0
ALTER_TRANS MAZZY BEGIN 15 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 45~ END

// if you agree to help Mazy and Pala in Danno's talk, then later back out, initial journal entries never cleared
ADD_TRANS_ACTION MAZZYJ BEGIN 13 21 END BEGIN END ~EraseJournalEntry(34673)~
ADD_TRANS_ACTION MAZZYJ BEGIN 34 END BEGIN END ~EraseJournalEntry(34673) EraseJournalEntry(34683)~

// There's a valid morul-sole-survivor transition here, but it's covered by an always-true transition.
// enable that line by adding a trigger to make it not-always true
// (only get to 10 if at least one apprentice is dead)
ADD_TRANS_TRIGGER MGBILL01 10 ~!Dead("mgappr02") OR(2) !Dead("mgappr01") !Dead("mgappr03")~ DO 1 // turn existing 1 (previously always true) to alive morul (but not lone survivor)

// apprenti can sometimes not do actions from dialogue if in process of using their scripted visual spells
ADD_TRANS_ACTION MGAPPR02 BEGIN 42 END BEGIN 0 END ~ClearActions("MGAPPR01") ClearActions("MGAPPR03") ClearActions(Myself)~
ADD_TRANS_ACTION MGAPPR02 BEGIN 72 END BEGIN 0 END ~ActionOverride("MGAPPR01",DialogInterrupt(FALSE)) ActionOverride("MGAPPR03",DialogInterrupt(FALSE)) DialogInterrupt(FALSE)~

// fix teos' non-sequitir endings in state 56
ADD_TRANS_ACTION MGTEOS01  BEGIN 10 END BEGIN 0 END ~SetGlobal("CDAskedTeosImoen","LOCALS",1)~
ADD_TRANS_ACTION MGTEOS01  BEGIN 30 END BEGIN 3 END ~SetGlobal("CDAskedTeosImoen","LOCALS",1)~
ADD_TRANS_ACTION MGTEOS01  BEGIN 50 END BEGIN 1 END ~SetGlobal("CDAskedTeosImoen","LOCALS",1)~

// rebranch 38 depending on whether you've asked about imoen
ALTER_TRANS MGTEOS01 BEGIN 38 END BEGIN 0 END BEGIN TRIGGER ~Global("AsylumPlot","GLOBAL",0) Global("CDAskedTeosImoen","LOCALS",1)~
                                                    "REPLY" ~#61138~ END // add reply too (blocks solamnic knights question if chap < 4)
ALTER_TRANS MGTEOS01 BEGIN 38 END BEGIN 1 END BEGIN TRIGGER ~OR(2) GlobalGT("AsylumPlot","GLOBAL",0) !Global("CDAskedTeosImoen","LOCALS",1) Global("SolamnicKnights","GLOBAL",0) !Dead("obssol01") !Dead("obssol02") !Dead("obssol03")~ END // exit w/o imoen info
ALTER_TRANS MGTEOS01 BEGIN 38 END BEGIN 2 END BEGIN TRIGGER ~OR(2) GlobalGT("AsylumPlot","GLOBAL",0) !Global("CDAskedTeosImoen","LOCALS",1)~ END // exit w/o imoen info
ALTER_TRANS MGTEOS01 BEGIN 53 END BEGIN 0 END BEGIN TRIGGER ~Global("AsylumPlot","GLOBAL",0) Global("CDAskedTeosImoen","LOCALS",1)~ END // blocks solamnic knights question if chap < 4
ALTER_TRANS MGTEOS01 BEGIN 53 END BEGIN 1 END BEGIN TRIGGER ~OR(2) GlobalGT("AsylumPlot","GLOBAL",0) !Global("CDAskedTeosImoen","LOCALS",1)~
                                                    ACTION ~SetGlobalTimer("TeolMessenger","GLOBAL",TWO_DAYS) ForceSpell(Myself,DRYAD_TELEPORT)~ // also change transition here for non-imoen, as state 56 makes no sense
                                                    EPILOGUE ~EXIT~ END // exit w/o imoen info
ALTER_TRANS MGTEOS01 BEGIN 82 83 END BEGIN 0 END BEGIN TRIGGER ~Global("AsylumPlot","GLOBAL",0) Global("CDAskedTeosImoen","LOCALS",1)~ END // only offer imoen info if asked before
ALTER_TRANS MGTEOS01 BEGIN 82 83 END BEGIN 1 END BEGIN TRIGGER ~OR(2) GlobalGT("AsylumPlot","GLOBAL",0) !Global("CDAskedTeosImoen","LOCALS",1)~ END // exit w/o imoen info

// typo in teos' variable set
REPLACE_ACTION_TEXT MGTEOS01
~SetGlobalTimer("TeolMessanger","GLOBAL",SEVEN_DAYS)~ ~SetGlobalTimer("TeolMessenger","GLOBAL",SEVEN_DAYS)~

// minsc injured dialogues need better triggers, see also minsc.bcs
ADD_STATE_TRIGGER MINSCJ 17 ~Global("MinscComplain","LOCALS",0)~ // new var to tighten trigger
REPLACE_STATE_TRIGGER MINSCJ 21 ~HPLT(Myself,20) Global("MinscInjured","LOCALS",1) Global("MinscComplain","LOCALS",0)~ // was !0 !2, new var
ADD_STATE_TRIGGER MINSCJ 22 ~Global("MinscComplain","LOCALS",0)~ // new var to tighten trigger

// mourners never leave, often have nothing to say; see also mourner3.cre, ar0800.bcs
ADD_STATE_TRIGGER     MOURNER3 4 ~True()~ // have something to say, always
REPLACE_STATE_TRIGGER MOURNER4 4 ~True()~ // have something to say, always
ADD_TRANS_ACTION MOURNER4 BEGIN 3 END BEGIN END ~SetGlobalTimer("CDMourner3Timer","ar0800",300)~ // five minutes real time

// can't offer rampah a few coins unless you have a few coins
ADD_TRANS_TRIGGER MURDBEGG 0 ~PartyGoldGT(2)~ DO 2

// close infinite cash exploit for nalia
ADD_TRANS_TRIGGER NALIA 5 ~!Global("NaliaCash","GLOBAL",1)~ DO 5

// restore one more line for Nalia rejoining
ALTER_TRANS NALIAP BEGIN 6 END BEGIN 1 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 14~ END

// other "I'm leaving" replies go here
ALTER_TRANS NEVAZIAH BEGIN 23 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 5~ END // originally went to 4, where he goes hostile

// brings lord ophal's trigger in line with all his other triggers
ADD_STATE_TRIGGER NOBLEM3 5 ~!Dead("noblew3")~

// missing journal entry
ALTER_TRANS PALERN BEGIN 1 END BEGIN 0 END BEGIN ~UNSOLVED_JOURNAL~ ~#11854~ END

// re-enable False()d response
REPLACE_TRANS_TRIGGER PELANNA BEGIN 13 END BEGIN 3 END ~False()~ ~~ // enable this response

// move up tassa spawn one state so she can appear next to pelanna and not use the existing tassa across the map
ALTER_TRANS PELANNA BEGIN 14 20 END BEGIN 0 END BEGIN ~ACTION~ ~~ END                                          // move from here...
ALTER_TRANS PELANNA BEGIN 13 END BEGIN 2 3 END BEGIN ~ACTION~ ~CreateCreatureObject("TASSA",Myself,0,0,0)~ END // .. to here

// player1's various monologues in spellhold maze links to wrong HD & Minsc states
ALTER_TRANS PLAYER1 BEGIN 3 END BEGIN  8 END BEGIN EPILOGUE ~EXTERN HAERDAJ 137~ END // was 140
ALTER_TRANS PLAYER1 BEGIN 5 END BEGIN 15 END BEGIN EPILOGUE ~EXTERN MINSCJ 202~ END // was 203

// move bounding var to dialogue for better reliability; see ppbhaal.bcs
ADD_TRANS_ACTION PPBHAAL BEGIN 5 END BEGIN END ~SetGlobal("spoke","LOCALS",1)~

// make bodhi's friends' escape less awkward
ALTER_TRANS PPBODHI4 BEGIN 21 END BEGIN END BEGIN ACTION ~SetGlobal("AsylumPlot","GLOBAL",43) ActionOverride("vam1514b",ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)) ActionOverride("vam1514a",ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE))~ END // was escape area

// getting into the asylum via perth doesn't purge two journal entries
ADD_TRANS_ACTION PPCOWLED BEGIN 3 END BEGIN 0 END ~EraseJournalEntry(11681) EraseJournalEntry(11884)~

// dace's apparition has nothing to say; using wrong flame strike if you're a dick
REPLACE_STATE_TRIGGER PPJOYE2 2 ~Global("JoyeMove","GLOBAL",2) !Global("Coffin1","AR1513",2)~ // removes !Global("deadjoye","AR1513",1)
ALTER_TRANS PPJOYE2 BEGIN 7 END BEGIN 0 END BEGIN ACTION ~ReallyForceSpell(Myself,DACE_FLAME)~ END // replaces generic cleric flame strike that he was casting

// was 9 > 14, now 9 > 13 > 14 for better reply
ALTER_TRANS PPSAEM2 BEGIN 9 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 13~ END

// can offer lonk more gold than you have
ADD_TRANS_TRIGGER PPWORKER 27 ~PartyGoldGT(1999)~ DO 2
ADD_TRANS_TRIGGER PPWORKER 27 ~PartyGoldGT(9999)~ DO 3
ADD_TRANS_TRIGGER PPWORKER 30 ~PartyGoldGT(9999)~ DO 2

// prophet now answers the question before demanding worship
ALTER_TRANS PROPHET1 BEGIN 1 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 10~ END // used to go directly to state 3, now passes through 10 first
ALTER_TRANS PROPHET1 BEGIN 2 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 10~ END
ALTER_TRANS PROPHET1 BEGIN 5 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 10~ END

// should be able to report progress to temple officials; see also bhnalla.dlg, gaal.dlg
ADD_TRANS_ACTION PROPHET1 BEGIN 0             END BEGIN END ~SetGlobal("TalkedToCult","GLOBAL",1)~ // speaking to street prophets now sets variable
ADD_TRANS_ACTION PROPHET2 BEGIN 0             END BEGIN END ~SetGlobal("TalkedToCult","GLOBAL",1)~ // speaking to street prophets now sets variable
ADD_TRANS_ACTION PROPHET3 BEGIN 0             END BEGIN END ~SetGlobal("TalkedToCult","GLOBAL",1)~ // speaking to street prophets now sets variable
ADD_TRANS_ACTION PROPHET4 BEGIN 0 1 2 3 5 6 7 END BEGIN END ~SetGlobal("TalkedToCult","GLOBAL",1)~ // speaking to street prophets now sets variable

// raelis not always setting var that she has the gem; this results in wrong kick out dialogue for Haer'Dalis
ADD_TRANS_ACTION RAELIS BEGIN 5 31 END BEGIN END ~SetGlobal("RaelisHasGem","GLOBAL",1)~

// player can get trapped in planar prison if they do something stupid like kick HD during the conduit summoning
ADD_STATE_TRIGGER     RAELIS 17 ~AreaCheckObject("AR0516","Haerdalis")~ // make sure HD is present, too
REPLACE_STATE_TRIGGER RAELIS 71 ~Global("PlanarPrison","GLOBAL",1) AreaCheck("AR0516")~ // removed dead HD check; this is now a failsafe option

// wrong answer to statement
ALTER_TRANS RGRWLF01 BEGIN 6 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 18~ END

// should always get XP for defeating avatar; XP only present on 1/3 replies
ADD_TRANS_ACTION RIFTG03 BEGIN 0 END BEGIN 1 2 END ~AddexperienceParty(25750)~

// response only appropriate for player1
ADD_STATE_TRIGGER SAHKNG01 62 ~InPartySlot(LastTalkedToBy,0)~

// shouldn't be able to ask jerlia about ore if you've already given sarles real/fake ore
ADD_STATE_TRIGGER SCJERLIA 38 ~OR(2) Global("SarlesPissed","GLOBAL",1) GlobalGT("SculptorPlot","GLOBAL",3)~

// player reply about commission goes to comment about nobles; this reply appropriately talks about gold offered instead
ALTER_TRANS SCSARLES BEGIN 2 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 7~ END // originally went to 5

// same question from 2 leads here
ALTER_TRANS SEWERM1 BEGIN 9 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // originally went to 2, where you could ask the identical question again

// other "i'm leaving " replies lead here
ALTER_TRANS SEWERM1 BEGIN 19 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 22~ END // originally went to 21

// not all branches of frenedan's dialogue setting journal entry
ALTER_TRANS SHAPE BEGIN 7    END BEGIN 0 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END
ALTER_TRANS SHAPE BEGIN 6 11 END BEGIN 1 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END
ALTER_TRANS SHAPE BEGIN 9    END BEGIN 2 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END

// you can ask morsa about how you fare as guildmaster; this change allows you to do so on the first conversation, too
ALTER_TRANS SHTH04 BEGIN 1 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 2~ END // originally just exited here

// suppress dupe replies in consecutive states
ADD_TRANS_ACTION SUDEMIN BEGIN 2 END BEGIN 0 1 2 END ~SetGlobal("CDreplies","LOCALS",1)~
EXTEND_BOTTOM SUDEMIN 6
  IF ~Global("CDreplies","LOCALS",1)~ THEN GOTO 7
END

// shouldn't get 'talos as well served' journal entry when you get kicked out
ALTER_TRANS TALVILON BEGIN 34 END BEGIN 2 END BEGIN "SOLVED_JOURNAL" ~~  END

// wrong variable name
REPLACE_TRIGGER_TEXT ~TASSA~ ~"TalkedPelanna"~ ~"TalkedToPelanna"~

// if player initiates dialogue with terrece at the gov't district, terrece will initiate later in the plaoyer confrontation
ADD_TRANS_ACTION TERRECE BEGIN 0 END BEGIN END ~SetGlobal("TerreceSpawn","GLOBAL",3)~

// jan's interjection only makes sense if Valygar is dead
ALTER_TRANS TOLGER BEGIN 76 END BEGIN 0 END BEGIN TRIGGER ~~ END
ADD_TRANS_TRIGGER TOLGER 76 ~Dead("valygar")~  DO 3
ALTER_TRANS EDWINJ BEGIN 49 END BEGIN 0 END BEGIN TRIGGER ~~ END
ADD_TRANS_TRIGGER EDWINJ 49 ~Dead("valygar")~  DO 2
ALTER_TRANS NALIAJ BEGIN 233 END BEGIN 0 END BEGIN TRIGGER ~~ END
ADD_TRANS_TRIGGER NALIAJ 233 ~Dead("valygar")~  DO 1

// torgal's nalia-specific dialogue can not trigger due to range mismatches
REPLACE_TRIGGER_TEXT TORGAL ~Range("Nalia",15)~ ~Range("Nalia",40)~ // adjusts both state triggers

// restores extra ine from exposition
ALTER_TRANS TRAINER1 BEGIN 4 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 13~ END // originally went straight to 5

// adds one more line, routes 15 > 16 instead of just 16
ALTER_TRANS TRGRD03 BEGIN 4 END BEGIN 2 3 END BEGIN ~EPILOGUE~ ~GOTO 15~ END
ALTER_TRANS TRGRD03 BEGIN 15 END BEGIN END BEGIN ~EPILOGUE~ ~GOTO 16~ END

// skin dancer drops skin at fixed point instead of at his death point; see also trskin03.bcs
REPLACE_ACTION_TEXT ~TRSKIN03~ ~\(DropItem("MISC79",\[\)[0-9]+\.[0-9]+\(\])\)~ ~\1-1.-1\2~ // change coords to -1, -1

// returning the silver blade always ended badly with simyaz - impossible friendly trigger, plus covered by always-true hostile branch
ADD_TRANS_TRIGGER UDSIMYAZ 53 ~!ReactionGT(LastTalkedToBy,FRIENDLY_LOWER)~ DO 1
ALTER_TRANS UDSIMYAZ BEGIN 53 END BEGIN 0 END BEGIN TRIGGER ~~ END

// interrupting solaufein while pulling mind flayers out of the astral breaks everything; see also udsola01.bcs
ALTER_TRANS udsola01 BEGIN 46 END BEGIN 0 END BEGIN ACTION ~SetInterrupt(FALSE) DialogInterrupt(FALSE) SetGlobal("cd_must_summon","LOCALS",1)~ END

// solaufein should be setting variables based on what you tell him so his later convo is appropriate
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 3 END ~SetGlobal("SolaufeinLikes","GLOBAL",1)~ // don't tell him anything > state 146 later
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 1 END ~SetGlobal("SolaufeinLikes","GLOBAL",2)~ // tell him you're a surfacer > state 154 later, branch 0
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 2 END ~SetGlobal("SolaufeinLikes","GLOBAL",3)~ // surfacer & you're looking for eggs  > state 154 later, branch 1

// blank exit trigger just cuts dialogue short; has three perfectly valid responses
ADD_TRANS_TRIGGER UHMAY01 117 ~!Global("MinisterScold","LOCALS",0)~ DO 1

// if you meet valygar in imnesvale and send him home, you dont get XP or interjections if you have him join later
ADD_TRANS_TRIGGER VALYGARP 12 ~!Global("ValygarHome","GLOBAL",1)~ DO 0
EXTEND_BOTTOM VALYGARP 12
  IF ~Global("ValygarHome","GLOBAL",1) !IsValidForPartyDialog("Edwin") !IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Cernd") OR(2) Global("HiredByCowled","GLOBAL",0) !IsValidForPartyDialog("Korgan")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXIT
  IF ~Global("ValygarHome","GLOBAL",1) IsValidForPartyDialog("Edwin")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXTERN EDWINJ 51
  IF ~Global("ValygarHome","GLOBAL",1) !IsValidForPartyDialog("Edwin") IsValidForPartyDialog("Jaheira")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXTERN JAHEIRAJ 362
  IF ~Global("ValygarHome","GLOBAL",1) !IsValidForPartyDialog("Edwin") !IsValidForPartyDialog("Jaheira") IsValidForPartyDialog("Minsc")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXTERN MINSCJ 104
  IF ~Global("ValygarHome","GLOBAL",1) !IsValidForPartyDialog("Edwin") !IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Minsc") IsValidForPartyDialog("Cernd")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXTERN CERNDJ 93
  IF ~Global("ValygarHome","GLOBAL",1) !IsValidForPartyDialog("Edwin") !IsValidForPartyDialog("Jaheira") !IsValidForPartyDialog("Minsc") !IsValidForPartyDialog("Cernd") Global("HiredByCowled","GLOBAL",1) IsValidForPartyDialog("Korgan")~ THEN
    DO ~DestroyItem("misc7l") SetGlobal("KickedOut","LOCALS",0) AddexperienceParty(9500) JoinParty() SetGlobal("BetrayedCowled","GLOBAL",1)~ REPLY #19442 EXTERN KORGANJ 221
END

// male/female specific lines not properly delineated here
ADD_TRANS_TRIGGER VICONIJ 112 ~Gender(Player1,FEMALE)~ DO 0
ADD_TRANS_TRIGGER VICONIJ 112 ~Gender(Player1,MALE)~ DO 2

// turning viconia hostile prevents her death at the stake; see also viconia.bcs vicg1.dlg, victown1.dlg, viconi.dlg
// viconiadeath != 0 prompts her override script to kill her with the usual cosmetics
EXTEND_BOTTOM VICG1 7 // basically intercepts transition 0 for hostile viconia
  IF ~OR(2)
       !NumDead("vicg",0) 
       !NumDead("victowna",0) 
      Allegiance("viconia",ENEMY)~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXIT
END

EXTEND_BOTTOM VICTOWN1 2 // intercepts transition for hostile viconia, copies keldorn/aerie/minsc/jaheira interjections from viconi 11
  IF ~Allegiance("viconia",ENEMY)~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXIT
  IF ~Allegiance("viconia",ENEMY)
      IsValidForPartyDialog("Keldorn")~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXTERN KELDORJ 179
  IF ~Allegiance("viconia",ENEMY)
      IsValidForPartyDialog("Aerie")~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXTERN AERIEJ 113
  IF ~Allegiance("viconia",ENEMY)
      IsValidForPartyDialog("Minsc")~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXTERN MINSCJ 146
  IF ~Allegiance("viconia",ENEMY)
      IsValidForPartyDialog("Jaheira")~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXTERN JAHEIRAJ 430
END

// move death to area script, these just set variables now
ADD_TRANS_ACTION VICG1    BEGIN 7 END BEGIN 0 END ~SetGlobal("ViconiaDeath","AR1000",1)~
ADD_TRANS_ACTION VICTOWN1 BEGIN 2 END BEGIN 0 END ~SetGlobal("ViconiaDeath","AR1000",1)~
ALTER_TRANS VICONI BEGIN 11 END BEGIN END BEGIN ACTION ~SetGlobal("ViconiaDeath","AR1000",1)~ END

// helpful folks disappear before they can actually help; see also vvhelp.cre, vvpriest.cre, ar0700.are
ALTER_TRANS VVHELP BEGIN 7 END BEGIN 0 END BEGIN ~ACTION~ ~EscapeArea()~ END

// because del & pals spawn ofscreen, they sometimes need a little help finding sansuki
ALTER_TRANS VVSANSUK BEGIN 1 END BEGIN END BEGIN ACTION ~CreateCreatureOffScreen("VVDEL",0) // Del
                                                         CreateCreatureOffScreen("VVMALE1",0) // Vampire
                                                         CreateCreatureOffScreen("VVMALE2",0) // Vampire
                                                         ActionOverride("VVDEL",MoveToObject("VVSANSUK"))
                                                         ActionOverride("VVMALE1",MoveToObject("VVSANSUK"))
                                                         ActionOverride("VVMALE2",MoveToObject("VVSANSUK"))~ END

// extra line in Count Claylan-Debutante Alicia banter
ALTER_TRANS WCUST02 BEGIN 0 END BEGIN 0 END BEGIN ~EPILOGUE~ ~EXTERN WCUST01 1~ END // used to just exit here

// restore one more line for Yoshimo rejoining
ALTER_TRANS YOSHP BEGIN 4 END BEGIN 1 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 1~ END // delete joinparty from 4, as 1 already has it