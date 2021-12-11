// dialogue error fixes for ToB
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]25$~ ~CLERIC_CURE_MODERATE_WOUNDS~ ~CLERIC_CURE_MEDIUM_WOUNDS~ // bad IDS reference
REPLACE_ACTION_TEXT_REGEXP ~\(^fsspir2$\)\|\(^imoen25j$\)\|\(^jahei25j$\)\|\(^vicon25j$\)~  ~TriggerActivation("IT302\([4-6]\)"~ ~TriggerActivation("Exit302\1"~ // bad name for trigger
REPLACE_ACTION_TEXT ~amfaheed~  ~[^,]EscapeArea())~ ~EscapeArea()~ // extra trailing parenthesis
REPLACE_ACTION_TEXT ~amman02~  ~ApplySpell("runrun",Myself)~ ~ApplySpellRES("runrun",Myself)~ // need a res action to target spell file names
REPLACE_ACTION_TEXT ~fsspir3~   ~\bApplyDamage(Myself,25,ACID)+~ ~ApplyDamage(Myself,25,ACID)~ // extra trailing parenthesis
REPLACE_ACTION_TEXT ~gorchr~  ~TakeItemReplace("GORCHRAM","GORCHR",Myself)~ ~DestroyItem("GORCHR")~ // trying to swap for nonexistant object, so just destroy instead
REPLACE_ACTION_TEXT ~sarmel01~ ~DialogInterrupt("FALSE")~ ~DialogInterrupt(FALSE)~ // no quotes for IDS references
REPLACE_ACTION_TEXT ~sarpro01~  ~FadeFromColor(\[20\.0),0\])?~ ~FadeFromColor([20.0],0)~ // swapped bracket and parenthesis

// variable misnomer fix
REPLACE_ACTION_TEXT ~keldo25p~ ~"KickedOut","GLOBAL"~ ~"KickedOut","LOCALS"~

// Bioware manages to screw up Global and SetGlobal every possible way. These two patches fix almost all of 'em.
REPLACE_TRIGGER_TEXT_REGEXP ~\(^ppguy01$\)\|\(^sargrl01$\)\|\(^sarvolo$\)~
  ~\b\(Set\)?Globa\(l\([LG]T\)?\)("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)['"]?,"?\([0-9]+\)"?)~
  ~Globa\2("\4","\5",\6)~
REPLACE_ACTION_TEXT_REGEXP ~\(^banome25$\)\|\(^sarboy01$\)\|\(^sarbul04$\)\|\(^sargrl01$\)~
  ~\b\(Set?\)?Global("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([0-9]+\)"?)~
  ~SetGlobal("\2","\3",\4)~

// ToB DV fixes
REPLACE_TRIGGER_TEXT ~amwenc01~ ~"balth01"~ ~"balth"~
REPLACE_TRIGGER_TEXT ~25spell~  ~Dead("hectan")~  ~Dead("sarthf01")~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aerie25j$\)\|\(^ambar01$\)\|\(^bazmonk$\)\|\(^bazeye01$\)\|\(^baerie25$\)\|\(^bcernd25$\)\|\(^bjahei25$\)\|\(^fsspir2$\)\|\(^gorimp01$\)\|\(^haerd25j$\)\|\(^hgnya01$\)\|\(^hgwra01$\)\|\(^jahei25j$\)\|\(^jan25j$\)\|\(^mazzy25j$\)\|\(^sarev25a$\)\|\(^vicon25j$\)~ ~"Imoen"~ ~"Imoen2"~

// creatures handing out uncharged items
REPLACE_ACTION_TEXT ~gorcamb~  ~GiveItemCreate("SW1H68",LastTalkedToBy,0,0,0)~ // WK gamblin' cambion
                               ~GiveItemCreate("SW1H68",LastTalkedToBy,0,1,0)~ // spectral brand
REPLACE_ACTION_TEXT ~marlowe~  ~GiveItemCreate("amsoul01",Player1,0,0,0)~ // marlowe the lich
                               ~GiveItemCreate("amsoul01",Player1,1,0,0)~ // malla's soulstone

// altering mazzyj25 transition; player should have a chance to mollify her if Jaheira not present
// update - no, no mollification should be possible here
//ALTER_TRANS ANOME25J BEGIN 38 END BEGIN 2 END // filename, state, trans
//BEGIN // list of changes, see below for flags
//  EPILOGUE ~EXTERN MAZZY25J 12~
//END

// fix anomen's banter linking to non-present party members
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Korgan")~ DO 1
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Mazzy")~ DO 2
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Jaheira")~ DO 3
ADD_TRANS_TRIGGER BANOME25 51 ~IsValidForPartyDialogue("Keldorn")~ DO 4

// force-talking draconis can cause bad things; see also bazdra01.bcs
ADD_TRANS_ACTION BAZDRA01 BEGIN 5 END BEGIN END ~SetGlobal("cd_transform","LOCALS",1)~
  
// Anomen should not speak ill of the Order during his banters with Imoen unless he had failed his test (Wisp)
ALTER_TRANS bimoen25 BEGIN 14 16 END BEGIN 0 END BEGIN "TRIGGER" ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ END
ALTER_TRANS bimoen25 BEGIN 14 16 END BEGIN 1 END BEGIN "TRIGGER" ~Alignment("Anomen",CHAOTIC_NEUTRAL)~ END

// jan-nalia banter not setting tracking variable
ADD_TRANS_ACTION BJAN25
BEGIN 72 END
BEGIN 0 END
~SetGlobal("ExpBJan10","LOCALS",1)~

// keldorn should link back to one last anomen retort
ALTER_TRANS BKELDO25 BEGIN 33 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN BANOME25 52~
END

// can display two identical replies under right conditions; add trigger
ADD_TRANS_TRIGGER ~BKELDO25~ 55 ~OR(3) !InParty("Jan") !See("Jan") StateCheck("Jan",STATE_SLEEPING)~ DO 0

// when NPC have just-before-rest LTs, often don't properly rest the party
REPLACE_ACTION_TEXT ~bvicon25~ ~Rest()~ ~RestParty()~
ADD_TRANS_ACTION BVICON25
BEGIN 81 82 127 END
BEGIN END
~RestParty()~

// love talk could repeat as variable not bumped
ADD_TRANS_ACTION BVICON25 BEGIN 125 END BEGIN END ~IncrementGlobal("ExpLoveTalk","LOCALS",1)~

// Thieves and Bards now properly receive a Dexterity bonus upon drawing the "STAR" card from the Deck of Many Things (Nythrun)
ALTER_TRANS domt BEGIN 19 END BEGIN 3 END BEGIN
    ~TRIGGER~ ~OR(2)
Class(LastTalkedToBy,BARD_ALL)
Class(LastTalkedToBy,THIEF_ALL)~
END

// corrects invalid transition to mazzy25a
ALTER_TRANS EDWIN25J BEGIN 12 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 10~
END

// close familiar mule exploit
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]25$~ ~\(GiveItemCreate("FAM[A-Z]+25",Player1,0,0,0)\)~ ~GivePartyAllEquipment() \1~

// helmte ghost can get wonky if interjector is mazed
ADD_TRANS_TRIGGER FSSPIR2 5 ~See("Imoen2")~  DO 1
ADD_TRANS_TRIGGER FSSPIR2 5 ~See("Viconia")~ DO 2
ADD_TRANS_TRIGGER FSSPIR2 5 ~See("Jaheira")~ DO 3

// solo players w/o remove curse can get permanently screwed with high priestess draw
EXTEND_BOTTOM GORCAMB 62
  IF ~RandomNum(2,1) NumInParty(1)~ THEN DO ~SetGlobal("PlayerDraw","GLOBAL",4)~ GOTO 35 // sub strife for high priestess, but only for solo players
END

// brother Odren dialogue fixes; just adding dialogue interrupts here
ALTER_TRANS GORODR1 BEGIN 41 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~EraseJournalEntry(62402)
EraseJournalEntry(62423)
EraseJournalEntry(62461)
EraseJournalEntry(62481)
EraseJournalEntry(62987)
EraseJournalEntry(63049)
EraseJournalEntry(63048)
EraseJournalEntry(63091)
AddXP2DA("PLOT01D")
Wait(1)
SetGlobal("CloseDemogorgonTemple","GLOBAL",2)
ActionOverride("shugar01",DialogueInterrupt(FALSE))
ActionOverride("shupol01",DialogueInterrupt(FALSE))
ActionOverride("shugfg01",DialogueInterrupt(FALSE))
ActionOverride("shugmg01",DialogueInterrupt(FALSE))
ActionOverride("shugpr01",DialogueInterrupt(FALSE))
DialogueInterrupt(FALSE)
ActionOverride("shugar01",EscapeArea())
ActionOverride("shupol01",EscapeArea())
ActionOverride("shugfg01",EscapeArea())
ActionOverride("shugmg01",EscapeArea())
ActionOverride("shugpr01",EscapeArea())
EscapeArea()~
END

// corrects invalid transition to mazzy25a
ALTER_TRANS JAHEI25J BEGIN 44 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 12~
END

// include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also keldo25j, mazzy25j, minsc25j, sarcnt01, valyg25j
EXTEND_BOTTOM JAHEI25J 41
  IF ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                                                     ActionOverride("Keldorn",Enemy())
                                                     ActionOverride("Mazzy",LeaveParty())
                                                     ActionOverride("Mazzy",Enemy())
                                                     ActionOverride("Jaheira",LeaveParty())
                                                     ActionOverride("Jaheira",Enemy())
                                                     ActionOverride("Minsc",LeaveParty())
                                                     ActionOverride("Minsc",Enemy())
                                                     ActionOverride("Valygar",LeaveParty())
                                                     ActionOverride("Valygar",Enemy())
                                                     ActionOverride("Anomen",LeaveParty())
                                                     ActionOverride("Anomen",Enemy())~ EXIT
END

// include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also jahei25j, mazzy25j, minsc25j, sarcnt01, valyg25j
EXTEND_BOTTOM KELDO25J 14
  IF ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                                                     ActionOverride("Keldorn",Enemy())
                                                     ActionOverride("Mazzy",LeaveParty())
                                                     ActionOverride("Mazzy",Enemy())
                                                     ActionOverride("Jaheira",LeaveParty())
                                                     ActionOverride("Jaheira",Enemy())
                                                     ActionOverride("Minsc",LeaveParty())
                                                     ActionOverride("Minsc",Enemy())
                                                     ActionOverride("Valygar",LeaveParty())
                                                     ActionOverride("Valygar",Enemy())
                                                     ActionOverride("Anomen",LeaveParty())
                                                     ActionOverride("Anomen",Enemy())~ EXIT
END

// include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also jahei25j, keldo25j, mazzy25j, sarcnt01, valyg25j
EXTEND_BOTTOM MINSC25J 11
  IF ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                                                     ActionOverride("Keldorn",Enemy())
                                                     ActionOverride("Mazzy",LeaveParty())
                                                     ActionOverride("Mazzy",Enemy())
                                                     ActionOverride("Jaheira",LeaveParty())
                                                     ActionOverride("Jaheira",Enemy())
                                                     ActionOverride("Minsc",LeaveParty())
                                                     ActionOverride("Minsc",Enemy())
                                                     ActionOverride("Valygar",LeaveParty())
                                                     ActionOverride("Valygar",Enemy())
                                                     ActionOverride("Anomen",LeaveParty())
                                                     ActionOverride("Anomen",Enemy())~ EXIT
END

// remove nonsensical interjections
ADD_TRANS_TRIGGER ~SARBUL04~ 2 ~False()~ DO 1 2 3

// corrects invalid transition to mazzy25a
ALTER_TRANS SARCNT01 BEGIN 14 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J cd_mazzy_comtempt~
END

// corrects invalid transition to mazzy25a, include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also jahei25j, keldo25j, minsc25j, sarcnt01, valyg25j
APPEND mazzy25j
  IF ~~ THEN BEGIN cd_mazzy_comtempt SAY #67867
    IF ~~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                   ActionOverride("Keldorn",Enemy())
                   ActionOverride("Mazzy",LeaveParty())
                   ActionOverride("Mazzy",Enemy())
                   ActionOverride("Jaheira",LeaveParty())
                   ActionOverride("Jaheira",Enemy())
                   ActionOverride("Minsc",LeaveParty())
                   ActionOverride("Minsc",Enemy())
                   ActionOverride("Valygar",LeaveParty())
                   ActionOverride("Valygar",Enemy())~ EXIT
    IF ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                                                       ActionOverride("Keldorn",Enemy())
                                                       ActionOverride("Mazzy",LeaveParty())
                                                       ActionOverride("Mazzy",Enemy())
                                                       ActionOverride("Jaheira",LeaveParty())
                                                       ActionOverride("Jaheira",Enemy())
                                                       ActionOverride("Minsc",LeaveParty())
                                                       ActionOverride("Minsc",Enemy())
                                                       ActionOverride("Valygar",LeaveParty())
                                                       ActionOverride("Valygar",Enemy())
                                                       ActionOverride("Anomen",LeaveParty())
                                                       ActionOverride("Anomen",Enemy())~ EXIT
  END
END

// include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also jahei25j, keldo25j, mazzy25j, minsc25j, valyg25j
ALTER_TRANS SARCNT01 BEGIN 14 END BEGIN 6 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~IsValidForPartyDialog("Anomen") !Alignment("Anomen",CHAOTIC_NEUTRAL)~
END

// Ding0: "So it turns out that if you kill the Spectator in the Sahuagin city, it's actually meant to come back to life in ToB. Damn!"
REPLACE ~SENBEH01~
  IF ~Dead("sengua03")~ THEN BEGIN 4 // from:
    SAY #67498 /* ~Ahhh...and so it ends.  And so does my service with this particular drow dolt.  I mean, what's with these drow?  Have they nothing better to do than summon me for their stupid tasks?~ */
    IF ~!Dead("sahbeh01")
  Global("D0SpokenSpectator","GLOBAL",1)~ THEN REPLY #70454 /* ~Hey...aren't you the spectator beholder from the Sahuagin city?~ */ GOTO 11
    IF ~!Dead("sahbeh01")
  !Global("D0SpokenSpectator","GLOBAL",1)
  Global("TurnHostile","AR6106",0)~ THEN REPLY #70458 /* ~How is it that you didn't die with the drow?~ */ GOTO 6
    IF ~!Dead("sahbeh01")
  !Global("D0SpokenSpectator","GLOBAL",1)~ THEN REPLY #70462 /* ~Enough!  I cannot let you continue to live, foul beast!~ */ GOTO 5
    IF ~!Dead("sahbeh01")
  !Global("D0SpokenSpectator","GLOBAL",1)~ THEN REPLY #67506 /* ~So what are you going to do now?~ */ GOTO 12
    IF ~Dead("sahbeh01")~ THEN REPLY #70455 /* ~Hey...didn't I kill you in the Sahuagin city?~ */ GOTO 10
  END
END

// include anomen in mass enemy/exodus from party if he's not crazy CN anomen; see also jahei25j, keldo25j, mazzy25j, minsc25j, sarcnt01
EXTEND_BOTTOM VALYG25J 20
  IF ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~ THEN DO ~ActionOverride("Keldorn",LeaveParty())
                                                     ActionOverride("Keldorn",Enemy())
                                                     ActionOverride("Mazzy",LeaveParty())
                                                     ActionOverride("Mazzy",Enemy())
                                                     ActionOverride("Jaheira",LeaveParty())
                                                     ActionOverride("Jaheira",Enemy())
                                                     ActionOverride("Minsc",LeaveParty())
                                                     ActionOverride("Minsc",Enemy())
                                                     ActionOverride("Valygar",LeaveParty())
                                                     ActionOverride("Valygar",Enemy())
                                                     ActionOverride("Anomen",LeaveParty())
                                                     ActionOverride("Anomen",Enemy())~ EXIT
END

// corrects transition to mazzy25j
ALTER_TRANS VALYG25J BEGIN 22 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 10~
END

// same state, should check for knight anomen
ALTER_TRANS VALYG25J BEGIN 22 END BEGIN 4 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~IsValidForPartyDialog("Anomen") !Alignment("Anomen",CHAOTIC_NEUTRAL)~
END

// limited wish quest should not be available in ToB
ADD_TRANS_TRIGGER WISH 1 ~GlobalLT("Chapter","GLOBAL",8)~ DO 6

// wish fixes from asc64; see also wish01.bcs changes
REPLACE_ACTION_TEXT ~wish25~ ~\(SetupWish([0-9],1)\)~ ~/* \1 */~