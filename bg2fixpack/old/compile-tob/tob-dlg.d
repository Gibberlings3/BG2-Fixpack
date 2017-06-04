// dialogue error fixes for ToB
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]25$~ ~CLERIC_CURE_MODERATE_WOUNDS~ ~CLERIC_CURE_MEDIUM_WOUNDS~
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]25$~ ~\(GiveItemCreate("FAM[A-Z]+25",Player1,0,0,0)\)~ ~GivePartyAllEquipment() \1~
REPLACE_ACTION_TEXT_REGEXP ~\(^fsspir2$\)\|\(^imoen25j$\)\|\(^jahei25j$\)\|\(^vicon25j$\)~  ~TriggerActivation("IT302\([4-6]\)"~ ~TriggerActivation("Exit302\1"~
REPLACE_ACTION_TEXT ~amfaheed~  ~[^,]EscapeArea())~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~amman02~  ~ApplySpell("runrun",Myself)~ ~ApplySpellRES("runrun",Myself)~
REPLACE_ACTION_TEXT ~fsspir3~   ~\bApplyDamage(Myself,25,ACID)+~ ~ApplyDamage(Myself,25,ACID)~
REPLACE_ACTION_TEXT ~gorchr~  ~TakeItemReplace("GORCHRAM","GORCHR",Myself)~ ~DestroyItem("GORCHR")~
REPLACE_ACTION_TEXT ~sarmel01~ ~DialogInterrupt("FALSE")~ ~DialogInterrupt(FALSE)~
REPLACE_ACTION_TEXT ~sarpro01~  ~FadeFromColor(\[20\.0),0\])?~ ~FadeFromColor([20.0],0)~

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
ALTER_TRANS ANOME25J BEGIN 38 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 10~
END

// jan-nalia banter not setting tracking variable
ADD_TRANS_ACTION BJAN25
BEGIN 72 END
BEGIN 0 END
~SetGlobal("ExpBJan10","LOCALS",1)~

// can display two identical replies under right conditions; add trigger
ADD_TRANS_TRIGGER ~BKELDO25~ 55 ~OR(3) !InParty("Jan") !See("Jan") StateCheck("Jan",STATE_SLEEPING)~ DO 0

// corrects invalid transition to mazzy25a
ALTER_TRANS EDWIN25J BEGIN 12 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 10~
END

// brother Odren dialogue fixes
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

// remove nonsensical interjections
ADD_TRANS_TRIGGER ~SARBUL04~ 2 ~False()~ DO 1 2 3

// corrects invalid transition to mazzy25a
ALTER_TRANS SARCNT01 BEGIN 14 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 9~
END

// same state, should check for knight anomen
ALTER_TRANS SARCNT01 BEGIN 14 END BEGIN 6 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~IsValidForPartyDialog("Anomen") Alignment("Anomen",MASK_GOOD)~
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

// corrects transition to mazzy25j
ALTER_TRANS VALYG25J BEGIN 22 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN MAZZY25J 10~
END

// same state, should check for knight anomen
ALTER_TRANS VALYG25J BEGIN 22 END BEGIN 4 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~IsValidForPartyDialog("Anomen") Alignment("Anomen",MASK_GOOD)~
END

// when NPC have just-before-rest LTs, often don't properly rest the party
REPLACE_ACTION_TEXT ~bvicon25~ ~Rest()~ ~RestParty()~
ADD_TRANS_ACTION BVICON25
BEGIN 81 82 127 END
BEGIN END
~RestParty()~

// Thieves and Bards now properly receive a Dexterity bonus upon drawing the "STAR" card from the Deck of Many Things (Nythrun)
ALTER_TRANS domt BEGIN 19 END BEGIN 3 END BEGIN
    ~TRIGGER~ ~OR(2)
Class(LastTalkedToBy,BARD_ALL)
Class(LastTalkedToBy,THIEF_ALL)~
END
  
// Anomen should not speak ill of the Order during his banters with Imoen unless he had failed his test (Wisp)
ALTER_TRANS bimoen25 BEGIN 14 16 END BEGIN 0 END BEGIN
"TRIGGER" ~!Alignment("Anomen",CHAOTIC_NEUTRAL)~
END
ALTER_TRANS bimoen25 BEGIN 14 16 END BEGIN 1 END BEGIN
"TRIGGER" ~Alignment("Anomen",CHAOTIC_NEUTRAL)~
END
