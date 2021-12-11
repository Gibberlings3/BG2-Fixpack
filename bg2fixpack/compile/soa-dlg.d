// this block of trigger fixes and the following block of action fixes eliminates all reported syntax errors in the game, including legacy errors from BG
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aataqah$\)\|\(^trgyp03$\)~  ~Name(LastTalkedToBy,"\([a-z|A-Z|0-9]+\)")~ ~Name("\1",LastTalkedToBy)~ // swapped dv/object order
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aeriej$\)\|\(^banomen$\)\|\(^minscj$\)\|\(^yoshj$\)~  ~AreaType(OUTSIDE)~ ~AreaType(OUTDOOR)~ // corrects bad IDS reference
REPLACE_TRIGGER_TEXT_REGEXP ~\(^amnise$\)\|\(^delorn$\)~ ~STATE_[CD]HA[MR][MR]ED~ ~STATE_CHARMED~ // typo in CHARMED (orig. chamred and dharmed)
REPLACE_TRIGGER_TEXT_REGEXP ~\(^dmark1$\)\|\(^kieres$\)~ ~True\(([0-9]+)\)?~ ~True()~ // missing end parenthesis or unnecessary argument for True()
REPLACE_TRIGGER_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)~ ~InPartySlot(LastTalkedToBy,"Nalia")~ ~Name("Nalia",LastTalkedToBy)~ // IPS should be name checks
REPLACE_TRIGGER_TEXT_REGEXP ~\(^idryad[1-3]$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~ // typo, misspelled GLOBAL (orig. GLBOAL or GLOABL)
REPLACE_TRIGGER_TEXT ~bandic~   ~NumDeadGT("Bandcap"4)~ ~NumDeadGT("Bandcap",4)~ // missing comma
REPLACE_TRIGGER_TEXT ~banomen~  ~\bReactionGT(Player1,NEUTRAL_UPPER))~ ~ReactionGT(Player1,NEUTRAL_UPPER)~ // extra trailing parenthesis
REPLACE_TRIGGER_TEXT ~breg01~   ~CheckStat\(L\|G\)T(\("?[a-z|A-Z|0-9]+"?\),\([A-Z][A-Z][A-Z]\),\([0-9]+\))~ ~CheckStat\1T(\2,\4,\3)~ // wrong order of parameters
REPLACE_TRIGGER_TEXT ~dmtown1~  ~RandomNum(4,1)1~ ~RandomNum(4,1)~ // random trailing '1'
REPLACE_TRIGGER_TEXT ~edwinj~   ~IsValidForPartyDialog("Viconia)~ ~IsValidForPartyDialog("Viconia")~ // missing close quote
REPLACE_TRIGGER_TEXT ~elgea~    ~("Korgan")!~ ~("Korgan")~ // extraneous trailing exclamation point
REPLACE_TRIGGER_TEXT ~fergus~   ~Global("FERGUS1","GLOBAL",2);~ ~Global("FERGUS1","GLOBAL",2)~  // extraneous trailing semicolon
REPLACE_TRIGGER_TEXT ~ffactor1~ ~!Dead("HaerDalis)~ ~!Dead("HaerDalis")~ // missing close quote
REPLACE_TRIGGER_TEXT ~firtrl01~ ~Dead(firorc01)~ ~Dead("firorc01")~ // missing quotes around DV
REPLACE_TRIGGER_TEXT ~flam7~    ~StateCheck(Myself,STATE_CHARMED);~ ~StateCheck(Myself,STATE_CHARMED)~ // extraneous trailing semicolon
REPLACE_TRIGGER_TEXT ~friend~   ~CheckState(~ ~StateCheck(~ // wrong trigger name
REPLACE_TRIGGER_TEXT ~fumin~    ~!Gabber("Nalia")~ ~!IsGabber("Nalia")~ // wrong trigger name
REPLACE_TRIGGER_TEXT ~gorpel~   ~NumTimesTalkedTo()~ ~NumTimesTalkedTo(0)~ // missing parameter
REPLACE_TRIGGER_TEXT ~ithtyl~   ~True();~ ~True()~ // extraneous trailing semicolon
REPLACE_TRIGGER_TEXT ~jared~    ~ReactionGLT(LastTalkedToBy,NEUTRAL_UPPER)~ ~ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~ // wrong trigger name; GT selected from dialogue context
REPLACE_TRIGGER_TEXT ~kaish~    ~Dead(Karoug)~ ~Dead("Karoug")~ // missing quotes around DV
REPLACE_TRIGGER_TEXT ~lahl~     ~Random(~ ~RandomNum(~ // wrong trigger name
REPLACE_TRIGGER_TEXT ~marcus~   ~HALFELF~ ~HALF_ELF~ // corrects bad IDS reference
REPLACE_TRIGGER_TEXT ~minern~   ~Global("SpokenToEmerson",0)~ ~Global("SpokenToEmerson","GLOBAL",0)~ // missing variable scope
REPLACE_TRIGGER_TEXT ~mgappr02~ ~PartyGoldGT(1999(~ ~PartyGoldGT(1999)~ // wrong parenthesis
REPLACE_TRIGGER_TEXT ~nobl10~   ~Reaction\([GL]\)T(\([A-Z|_]+\))~ ~Reaction\1T(LastTalkedToBy,\2)~ // missing object parameter
REPLACE_TRIGGER_TEXT ~noblem3~  ~NUETRAL_LOWER~ ~NEUTRAL_LOWER~ // corrects bad IDS reference
REPLACE_TRIGGER_TEXT ~obssol01~ ~!Class(Player,MAGE_ALL)~ ~!Class(Player1,MAGE_ALL)~ // corrects bad object reference
REPLACE_TRIGGER_TEXT ~ppdesh~   ~IsValidForPartyDialog\(ue\)?("YOSHIMO)~ ~IsValidForPartyDialog("YOSHIMO")~ // missing close quote
REPLACE_TRIGGER_TEXT ~read4~    ~NumberOfTimesTalkedToGT(0)~ ~NumTimesTalkedToGT(0)~ // wrong trigger name
REPLACE_TRIGGER_TEXT ~tamoko~   ~FRIENLY_LOWER~ ~FRIENDLY_LOWER~ // corrects bad IDS reference
REPLACE_TRIGGER_TEXT ~trthf02~  ~Class(LastTalkedToBy,"THIEF")~ ~Class(LastTalkedToBy,THIEF)~ // ids references shouldn't be wrapped in quotes
REPLACE_TRIGGER_TEXT ~uddrow16~ ~Dead(\([a-z|A-Z|0-9]+\))~ ~StateCheck(\1,STATE_REALLY_DEAD)~ // can't use Dead() with objects, convert to StateCheck
REPLACE_TRIGGER_TEXT ~uhinn01~  ~!Dead("uhinn02')~ ~!Dead("uhinn02")~ // trailing single quote should be double quote

REPLACE_ACTION_TEXT_REGEXP ~\(^abela$\)\|\(^brevli$\)\|\(^deltan2?$\)\|\(^galken$\)\|\(^narlen$\)\|\(^quinn$\)\|\(^taerom$\)\|\(^tersus$\)\|\(^ulcast$\)~ ~GiveItemCreate(\("?[a-z|A-Z|0-9]+"?\),\("?[a-z|A-Z|0-9]+"?\))~ ~GiveItemCreate(\1,\2,1,1,1)~ // missing three charge parameters
REPLACE_ACTION_TEXT_REGEXP ~\(^aerie$\)\|\(^kalah2$\)~  ~StartDialogueNoSet()~ ~StartDialogueNoSet([PC])~ // missing object
REPLACE_ACTION_TEXT_REGEXP ~^drstatu[1-3]$~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",StartDialogueNoSet(Player1)+~ ~ActionOverride("\1",StartDialogueNoSet(Player1))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT_REGEXP ~\(^hamek$\)\|\(^mekrath$\)~ ~Set(~ ~SetGlobal(~ // wrong action name
REPLACE_ACTION_TEXT_REGEXP ~\(^keldorj$\)\|\(^udvith$\)~ ~SetGlobalTimer("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([A-Z|_|0-9]+\)"?)~ ~SetGlobalTimer("\1","\2",\3)~ // ids references shouldn't be wrapped in quotes/missing quote for var name
REPLACE_ACTION_TEXT_REGEXP ~\(^kielpc$\)\|\(^ppireni1$\)~ ~Open\(Door\)?("?\([A-Z|a-z|0-9]+\)"?)~ ~OpenDoor("\2")~ // missing quotes around DV/wrong action name
REPLACE_ACTION_TEXT_REGEXP ~\(^kieres$\)\|\(^ulf$\)~  ~ActionOverride(\([a-z|A-Z|0-9|"]+\),AttackReevaluate(\([a-z|A-Z|0-9|"|(|)]+\),\([0-9]+\))+~ ~ActionOverride(\1,AttackReevaluate(\2,\3)) ~ // missing trailing parenthesis
REPLACE_ACTION_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)\|\(^kprang02$\)~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",MoveToPoint(\[\([0-9]+\)\.\([0-9]+\)\])*~ ~ActionOverride("\1",MoveToPoint([\2.\3]))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT_REGEXP ~^obshal0[13]$~ ~ChangeEnemyAlly("obshal0\([13]\)",\[ENEMY\])~ ~ChangeEnemyAlly("obshal0\1",ENEMY)~ // no brackets for ENEMY
REPLACE_ACTION_TEXT_REGEXP ~^pheirk\(as\)?$~ ~True()~ ~~ // true is not an action
REPLACE_ACTION_TEXT_REGEXP ~\(^messed$\)\|\(^rashad$\)~ ~Die()~ ~Kill(Myself)~ // Die() is a trigger, not action
REPLACE_ACTION_TEXT_REGEXP ~\(^udphae01$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~ // misspelled GLOBAL (orig. GLBOAL and GLOABL)
REPLACE_ACTION_TEXT ~arnman11~ ~ActionOverride("arnman10",MoveToObject("arnman11")+~ ~ActionOverride("arnman10",MoveToObject("arnman11"))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT ~baerie~   ~MoveGlobal("AR0607","Aerie",\[1034\.1034\],0)~ ~MoveGlobal("AR0607","Aerie",[1034.1034])~ // MoveGlobal doesn't need a face argument
REPLACE_ACTION_TEXT ~bdact05~  ~ActionOverride("bdact06",MoveToPoint(\[?1384\.420\])+~ ~ActionOverride("bdact06",MoveToPoint([1384.420]))~ // missing bracket, trailing parenthesis
REPLACE_ACTION_TEXT ~bdact06~  ~StartCutScene("Cut31L)~ ~StartCutScene("Cut31L")~ // missing close quote
REPLACE_ACTION_TEXT ~cattac~   ~Attack(NearestEnemyOf(Myself)+~ ~Attack(NearestEnemyOf(Myself))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT ~dadrow17~ ~SetGlobal("GhaunTimer","GLOBAL",ONE_DAY)~ ~SetGlobalTimer("GhaunTimer","GLOBAL",ONE_DAY)~ // setting timer, not global
REPLACE_ACTION_TEXT ~deltan~   ~AddJournalEntry(15840)~ ~~ // missing arguments, but leftover BG junk so just purge
REPLACE_ACTION_TEXT ~dream4~   ~\bStartDialogueNoSet(Player1))~ ~StartDialogueNoSet(Player1)~ // extra trailing parenthesis
REPLACE_ACTION_TEXT ~drunk~    ~Sleep()~ ~ReallyForceSpell(Myself,SURE_SLEEP)~ // sleep not an action
REPLACE_ACTION_TEXT ~eldotp~   ~ActionOverride(Skie",ChangeAIScript("",DEFAULT))~ ~ActionOverride("Skie",ChangeAIScript("",DEFAULT))~ // missing opening quote
REPLACE_ACTION_TEXT ~ffbiff01~ ~ActionOverride("Raelis",StartDialogueNoSet(\[Player1\]))~ ~ActionOverride("Raelis",StartDialogueNoSet([PC]))~ // [Player1] is not an EA object
REPLACE_ACTION_TEXT ~hajanos~  ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5)~ ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT ~imoemj~   ~GiveItemCreate("Misc4e",Myself,1)~ ~GiveItemCreate("Misc4e",Myself,1,1,1)~ // missing 2/3 charge parameters
REPLACE_ACTION_TEXT ~iron12~   ~EscapeArea\(()\)?~ ~EscapeArea()~ // missing empty parentheses
REPLACE_ACTION_TEXT ~kielpc~   ~ChangeAIScript(\?\?\?\?\?,Override)~ ~ChangeAIScript("",OVERRIDE)~ // no ????? script, correct IDS reference
REPLACE_ACTION_TEXT ~kielpc~   ~MoveToPoint(2357\.930\])~ ~MoveToPoint([2357.930])~ // missing opening bracket
REPLACE_ACTION_TEXT ~lavok~    ~DestroyItem(MINHP1)~ ~DestroyItem("MINHP1")~ // item name should be wrapped in quotes
REPLACE_ACTION_TEXT ~marl~     ~MoveToPoint(\[\.\])~ ~MoveToPoint([-1.-1])~ // missing coordinates
REPLACE_ACTION_TEXT ~mazzy4~   ~Enemt(~ ~Enemy(~ // wrong action name
REPLACE_ACTION_TEXT ~mazzyj~   ~\bEscapeAreaMove("AR2002",341,400,12)*~ ~EscapeAreaMove("AR2002",341,400,12)~ // missing parenthesis
REPLACE_ACTION_TEXT ~mazzyj~   ~ActionOverride("uhrang01",StartDialogueNoSet(\[PC\])+~ ~ActionOverride("uhrang01",StartDialogueNoSet([PC]))~ // missing parenthesis
REPLACE_ACTION_TEXT ~melica~   ~GiveItemCreate("MISC49,LastTalkedToBy,0,0,0)~ ~GiveItemCreate("MISC49",LastTalkedToBy,0,0,0)~ // missing close quote for item
REPLACE_ACTION_TEXT ~mgappr03~ ~CreateItem(\("?[a-z|A-Z|0-9]+"?\))~ ~CreateItem(\1,1,1,1)~ // missing charge parameters
REPLACE_ACTION_TEXT ~pelanna~  ~ActionOverride("arntra03",MoveToPointNoInterrupt(\[2192\.1535\])+~ ~ActionOverride("arntra03",MoveToPointNoInterrupt([2192.1535]))~ // missing parenthesis
REPLACE_ACTION_TEXT ~ppsaem3~  ~GiveItem(\[PC\],"misc8u")~ ~~ // since all lead to a state that gives this item, just remove instead of fix
REPLACE_ACTION_TEXT ~quayle~   ~\bSetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)*~ ~SetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)~ // missing parenthesis
REPLACE_ACTION_TEXT ~sahimp02~ ~CreateVisualEffectObject("SPSTRENH,"CHEST6")~ ~CreateVisualEffectObject("SPSTRENH","CHEST6")~ // missing close quote on first parameter
REPLACE_ACTION_TEXT ~shape~    ~Polymorph(RAKHASA)~ ~Polymorph(RAKSHASA)~ // bad IDS reference
REPLACE_ACTION_TEXT ~sharte~   ~ChangeAIScript("SHARTEEL,OVERRIDE)~ ~ChangeAIScript("SHARTEEL",OVERRIDE)~ // missing close quote on DV
REPLACE_ACTION_TEXT ~shoal~    ~ActionOverride("Droth",MoveToPoint(\[2900\.525\])+~ ~ActionOverride("Droth",MoveToPoint([2900.525]))~ // missing trailing parenthesis
REPLACE_ACTION_TEXT ~test2~    ~Attack(\[0\],0,\[0\])~ ~Attack(NearestEnemyOf(Myself))~ // invalid object
REPLACE_ACTION_TEXT ~udphae01~ ~EscapeArea(\("[a-z|A-Z|0-9]+"\)?)~ ~EscapeArea()~ // could be changed to EscapeAreaObject, but tran2200 is waaaaay across the map
REPLACE_ACTION_TEXT ~udsvir06~ ~EscapeAreaObject("AR2300")~ ~EscapeArea()~ // no 'ar2300' object, so just escape
REPLACE_ACTION_TEXT ~udsvir08~ ~EscapeArea();~ ~EscapeArea()~ // extra trailing semicolon
REPLACE_ACTION_TEXT ~valygarj~ ~ActionOverride("Viconia",LeaveParty()+~ ~ActionOverride("Viconia",LeaveParty())~ // missing trail parenthesis

// Bioware manages to screw up Global and SetGlobal every possible way. These two patches fix almost all of 'em.
REPLACE_TRIGGER_TEXT_REGEXP ~\(^bounha$\)\|\(^brevli$\)\|\(^burch2$\)\|\(^cor$\)\|\(^dadrow16$\)\|\(^firban02$\)\|\(^gorf1$\)\|\(^hellsare$\)\|\(^jared$\)\|\(^lothan$\)\|\(^mtob6$\)\|\(^raiken$\)\|\(^rumora$\)\|\(^teven$\)\|\(^trfued11$\)~
  ~\b\(Set\)?Globa\(l\([LG]T\)?\)("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)['"]?,"?\([0-9]+\)"?)~
  ~Globa\2("\4","\5",\6)~
REPLACE_ACTION_TEXT_REGEXP ~\(^bhgaal01$\)\|\(^bounha$\)\|\(^cerndp$\)\|\(^delthy$\)\|\(^docsol03$\)\|\(^doomsay$\)\|\(^drshsp01$\)\|\(^emerso$\)\|\(^hellsare$\)\|\(^lothan$\)\|\(^mazzyp$\)\|\(^naliaj$\)\|\(^nobw8$\)\|\(^rufpal2$\)\|\(^shape$\)\|\(^sonner$\)~
  ~\b\(Set?\)?Global("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([0-9]+\)"?)~
  ~SetGlobal("\2","\3",\4)~

// replaces all the old BG CreateCreature actions that NI flags as bad. Lines are too long; had to be broken in two.
REPLACE_ACTION_TEXT_REGEXP ~\(^albert$\)\|\(^alora$\)\|\(^arghai$\)\|\(^baruk$\)\|\(^beldin$\)\|\(^benjy$\)\|\(^brathl$\)\|\(^brevli$\)\|\(^brilla$\)\|\(^carsa$\)\|\(^charle$\)\|\(^cult[13]$\)\|\(^cythan$\)\|\(^degrod$\)\|\(^dopdur3$\)\|\(^dratan$\)\|\(^elkart$\)\|\(^feloni$\)\|\(^flamgg$\)\|\(^ftobe5$\)\|\(^galtok$\)\|\(^gantol$\)\|\(^garan$\)\|\(^gazib$\)\|\(^gervis$\)\|\(^gorpel$\)\|\(^husam2$\)\|\(^iron10$\)\|\(^ironm4$\)\|\(^islsir$\)\|\(^ithmee$\)\|\(^jacil$\)\|\(^jondal$\)~
  ~CreateCreature(\("?[a-z|A-Z|0-9]+"?\),\(\[[0-9]+\.[0-9]+\]\))~
  ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~\(^karoug$\)\|\(^kielpc$\)\|\(^kryla$\)\|\(^laerta$\)\|\(^lakada$\)\|\(^laurel$\)\|\(^mtbe9$\)\|\(^mulahe$\)\|\(^narcil$\)\|\(^nestor$\)\|\(^nevill$\)\|\(^nexlit$\)\|\(^nobw8$\)\|\(^obe\(ran\)?$\)\|\(^osmadi$\)\|\(^palin$\)\|\(^prism$\)\|\(^pumberl$\)\|\(^ratchi$\)\|\(^samant$\)\|\(^sarevo$\)\|\(^shoal$\)\|\(^silenc$\)\|\(^silke$\)\|\(^skie$\)\|\(^sunin$\)\|\(^tracea$\)\|\(^tremai$\)\|\(^wiven$\)~
  ~CreateCreature(\("?[a-z|A-Z|0-9]+"?\),\(\[[0-9]+\.[0-9]+\]\))~
  ~CreateCreature(\1,\2,0)~

// these three were getting corrupted with above patch, so do them separately
REPLACE_ACTION_TEXT_REGEXP ~glanma~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~ramazi~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~
REPLACE_ACTION_TEXT_REGEXP ~thalan~ ~CreateCreature(\("[a-zA-Z0-9]+"\),\(\[[0-9]+\.[0-9]+\]\))~ ~CreateCreature(\1,\2,0)~

// death variable fixes
REPLACE_TRIGGER_TEXT_REGEXP ~\(^barl$\)\|\(^temsup$\)\|\(^trgeni01$\)\|\(^trlgrd01$\)\|\(^trmer03$\)\|\(^trrak01$\)~ ~"Faldorn"~ ~"cefald01"~
REPLACE_TRIGGER_TEXT_REGEXP ~^bnoble[12]$~ ~"bnoble1"~ ~"feveron"~
REPLACE_TRIGGER_TEXT_REGEXP ~^bnoble[12]$~ ~"bnoble2"~ ~"diana"~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^c6fake$\)\|\(^keldor$\)\|\(^xc6elxxx$\)~ ~"[Bb][Hh][Ee][Yy][Ee]"~ ~"UnseeingEye"~
REPLACE_TRIGGER_TEXT_REGEXP ~^famil[1-3]\(25\)?$~ ~"famil1"~ ~Myself~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^ftown1$\)\|\(^vicg1$\)~ ~"[Vv]ici?onia?"~ ~"viconia"~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^garrick$\)\|\(^tcadril$\)~ ~"tcyrando"~ ~"cyrando"~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^garrick$\)\|\(^tcadril$\)~ ~"tirlana"~ ~"irlana"~
REPLACE_ACTION_TEXT_REGEXP ~^imoe[mn]j$~   ~"Reilev"~       ~"Rielev"~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^player1$\)\|\(^valygarp$\)~ ~"lavok01"~ ~"lavok"~
REPLACE_TRIGGER_TEXT ~bviconi~  ~"Amomen"~       ~"Anomen"~
REPLACE_TRIGGER_TEXT ~arnboy01~ ~"carwal"~       ~"booter"~
REPLACE_TRIGGER_TEXT ~clmom~    ~"clkid"~        ~"Lanie"~
REPLACE_TRIGGER_TEXT ~rumoru~   ~"Deirex"~       ~"jarlich"~
REPLACE_ACTION_TEXT  ~dream4~   ~"drimo02"~      ~"Drim02"~
REPLACE_TRIGGER_TEXT ~demson~   ~"ellote"~       ~"elotte"~
REPLACE_ACTION_TEXT  ~gemfar01~ ~"Erlin"~        ~"gemfar02"~
REPLACE_TRIGGER_TEXT ~hapip~    ~"haction"~      ~"hacton"~
REPLACE_TRIGGER_TEXT ~trgeni01~ ~"Ihtafeer"~     ~"trrak01"~
REPLACE_TRIGGER_TEXT ~valygarj~ ~"Jaheria"~      ~"Jaheira"~
REPLACE_TRIGGER_TEXT ~jangit01~ ~"jangit02"~     ~"Jangith2"~
REPLACE_TRIGGER_TEXT ~jugjug01~ ~"jugjer01"~     ~"jermien"~
REPLACE_TRIGGER_TEXT ~kaypal02~ ~"kaysmg01"~     ~"kaysmgl"~
REPLACE_TRIGGER_TEXT ~bedwin~   ~"Keldown"~      ~"Keldorn"~
REPLACE_TRIGGER_TEXT ~bftown3~  ~"Kogan"~        ~"Korgan"~
REPLACE_TRIGGER_TEXT ~shthlt01~ ~"Lathen"~       ~"shthlt02"~
REPLACE_TRIGGER_TEXT ~trfued06~ ~"lilith"~       ~"trfued01"~
REPLACE_TRIGGER_TEXT ~xc6elxxx~ ~"MEKRAT"~       ~"mekrath"~
REPLACE_TRIGGER_TEXT ~obshal03~ ~"minscj"~       ~"Minsc"~
REPLACE_TRIGGER_TEXT ~nobl4~    ~"Noblewoman4"~  ~"nobl4"~
REPLACE_TRIGGER_TEXT ~volo~     ~"Serevok"~      ~"Sarevok"~
REPLACE_TRIGGER_TEXT ~trfued02~ ~"skarmaen"~     ~"trfued05"~
REPLACE_TRIGGER_TEXT ~slvic01~  ~"SlumsMugger3"~ ~"mugger3"~
REPLACE_ACTION_TEXT  ~sppain~   ~"SPBena"~       ~"spbene"~
REPLACE_TRIGGER_TEXT ~crodru01~ ~"Tiiro"~        ~"crothf01"~
REPLACE_ACTION_TEXT  ~kpdomo01~ ~"TOLMAS"~       ~"kpmerc01"~
//REPLACE_ACTION_TEXT  ~player1~  ~"TreeLife"~     ~"Tree"~ // nuked by other patch below
REPLACE_TRIGGER_TEXT ~trax~     ~"trguard"~      ~"traxg"~
REPLACE_TRIGGER_TEXT ~uhmay01~  ~"uhboy01"~      ~"Atta"~
REPLACE_TRIGGER_TEXT ~surayah~  ~"Yusuf"~        ~"Yusef"~
REPLACE_TRIGGER_TEXT ~peony~    ~Dead("LadyMaria")~  ~Dead("Maria")~ // dlg uses a variable named LadyMaria, so need to bound this one a bit

// variable misnomer fixes
REPLACE_TRIGGER_TEXT ~aeriej~   ~"AerieInUnderdark","GLOBAL"~ ~"AerieInUnderdark","AR2100"~
REPLACE_TRIGGER_TEXT ~cor~      ~"TalkedToCor","GLOBAL"~ ~"TalkedCor","GLOBAL"~
REPLACE_ACTION_TEXT  ~bhoisig~  ~"OisigDecided","GLOBAL"~ ~"OisigDecided","LOCALS"~
REPLACE_ACTION_TEXT  ~EDWINJ~   ~"ScrollStudy","GLOBAL"~ ~"ScrollStudy","LOCALS"~
REPLACE_ACTION_TEXT  ~haerdaj~  ~"FightingTheTroupe","AR0510"~ ~"FightingTheTroupe","GLOBAL"~
REPLACE_TRIGGER_TEXT ~ilyich~   ~"Acorns","GLOBAL"~ ~"Acorns","AR0602"~
REPLACE_ACTION_TEXT  ~keldorp~  ~"LadyMaria","LOCALS"~ ~"LadyMaria","GLOBAL"~
REPLACE_ACTION_TEXT  ~mgappr02~ ~"DropWizRing","GLOBAL"~ ~"DropWizRing","AR0411"~
REPLACE_ACTION_TEXT  ~uhmay01~  ~"RangerProtector","LOCALS"~ ~"RangerProtector","GLOBAL"~
REPLACE_TRIGGER_TEXT ~viconij~  ~"ViconiaInUnderdark","GLOBAL"~ ~"ViconiaInUnderdark","AR2100"~

// dialogues checking the romance timer instead of the active romance variable
// REPLACE_TRIGGER_TEXT ~baerie~   ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~ state trigger fixed below
REPLACE_TRIGGER_TEXT ~cefald04~ ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~dadrow21~ ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~dadrow23~ ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~madam~    ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~trevil02~ ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~

REPLACE_TRIGGER_TEXT ~dadrow21~ ~Global\(\([GL]T\)?(\)"AnomenRomance","GLOBAL"~  ~Global\1"AnomenRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~madam~    ~Global\(\([GL]T\)?(\)"AnomenRomance","GLOBAL"~  ~Global\1"AnomenRomanceActive","GLOBAL"~

REPLACE_TRIGGER_TEXT ~dadrow21~ ~Global\(\([GL]T\)?(\)"JaheiraRomance","GLOBAL"~ ~Global\1"JaheiraRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~dadrow23~ ~Global\(\([GL]T\)?(\)"JaheiraRomance","GLOBAL"~ ~Global\1"JaheiraRomanceActive","GLOBAL"~
REPLACE_ACTION_TEXT  ~jaheirap~ ~SetGlobal("JaheiraRomance","GLOBAL"~            ~SetGlobal("JaheiraRomanceActive","GLOBAL"~

REPLACE_TRIGGER_TEXT ~bviconi~  ~Global\(\([GL]T\)?(\)"ViconiaRomance","GLOBAL"~ ~Global\1"ViconiaRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~c6drizz1~ ~Global\(\([GL]T\)?(\)"ViconiaRomance","GLOBAL"~ ~Global\1"ViconiaRomanceActive","GLOBAL"~
REPLACE_TRIGGER_TEXT ~madam~    ~Global\(\([GL]T\)?(\)"ViconiaRomance","GLOBAL"~ ~Global\1"ViconiaRomanceActive","GLOBAL"~

// creatures handing out uncharged items
REPLACE_ACTION_TEXT ~drshsp01~ ~GiveItemCreate("misc3d",LastTalkedToBy,0,0,0)~ // spirit of the grove
                               ~GiveItemCreate("misc3d",LastTalkedToBy,1,0,0)~ // golden lion figurine
REPLACE_ACTION_TEXT ~shop03~   ~GiveItemCreate("misc3\([jk]\)",LastTalkedToBy,0,0,0)~ // maheer
                               ~GiveItemCreate("misc3\1",LastTalkedToBy,1,0,0)~       // horn upgrades
REPLACE_ACTION_TEXT ~uddemon~  ~GiveItemCreate("HALB06",Player1,0,0,0)~ // greater demon in UD ritual
                               ~GiveItemCreate("HALB06",Player1,0,3,0)~ // blackmist halberd
REPLACE_ACTION_TEXT ~udtrap02~ ~GiveItemCreate("sw1h34",LastTalkedToBy,0,0,0)~ // raevilin strathi (trapped in UD device)
                               ~GiveItemCreate("sw1h34",LastTalkedToBy,0,1,0)~ // albruin
REPLACE_ACTION_TEXT ~wish~     ~GiveItemCreate("misc3p",LastTalkedToBy,0,0,0)~ // wish genie
                               ~GiveItemCreate("misc3p",LastTalkedToBy,3,0,0)~ // glasses of idenification

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

// The merchant who gets assaulted by a thug at the City Gates no longer shares a store with the Brynnlaw storekeeper (see also cdaemerc.sto) (Nythrun and devSin)
REPLACE_TRANS_ACTION aemerch BEGIN 8 END BEGIN 0 END
  ~StartStore("ppstor01",LastTalkedToBy())~   
  ~StartStore("cdaemerc",LastTalkedToBy(Myself))~

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

// adds extra trigger to account for Raelis stuff (should not get normal banter instead of Raelis-specific)
ADD_STATE_TRIGGER ~AERIEJ~ 7 ~!Global("QuayleRaelis","GLOBAL",1)~ 10

// Romance interests can comment on PhaereInnuendo in chapter 6 if they were not in the party during chapter 5 (the bigg) (see aerie.bcs, aeriej.dlg, jaheira.bcs, jaheiraj.dlg viconia.bcs, viconij.dlg)
ADD_STATE_TRIGGER ~AERIEJ~ 119 ~Global("Chapter","GLOBAL",5)~ 124 126

// samia's party can spawn even if she's dead; see also ar1202.bcs
ADD_TRANS_ACTION AKAE BEGIN 0 END BEGIN END ~EraseJournalEntry(7167) AddJournalEntry(7168,QUEST_DONE)~

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

// jastey: This is a fix so that Anomen's second "dead sister" complaint can be triggered at all
ADD_TRANS_ACTION ANOMENJ BEGIN 28 END BEGIN END ~SetGlobal("AnomenComplain","LOCALS",1)~

// restore one more line about bodhi
ALTER_TRANS ARAN BEGIN 24 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 11~ END

// changes chapter != 6 check to < 6.
REPLACE_STATE_TRIGGER ARAN 48
~Global("AranJob","GLOBAL",3)
Global("LassalVampires","GLOBAL",3)
Global("spokeTrip","LOCALS",1)
GlobalLT("Chapter","GLOBAL",6)~

// changes chapter = 6 to chapter > 5 to include chapter 7
REPLACE_STATE_TRIGGER ~ARAN~ 108
~GlobalGT("Chapter","GLOBAL",5)
Dead("c6bodhi")~

// changes erroneous reaction checks to reputation
ALTER_TRANS ARAN BEGIN 94 END BEGIN 4 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~ReputationGT(Player1,9)~
END

ALTER_TRANS ARAN BEGIN 94 END BEGIN 5 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~ReputationLT(Player1,10)~
END

// prevent haz from dying from dead grimwarders; see also arnfgt06.bcs
ADD_STATE_TRIGGER ARNFGT06 2 ~!NumDead("bodfgt01",2)~ // two bodfgt01s trying to kill haz; don't die if they're not already dead

// missy has more coat dialogues
ALTER_TRANS ARNGRL01 BEGIN 5 END BEGIN END BEGIN EPILOGUE ~GOTO 6~ END // one more state and some dialogue

// no valid links
REPLACE_STATE_TRIGGER ARNMAN06 8 ~RandomNum(5,2)~ // has dupe 5,3 state triggers and no 5,2

// closes possible loop in Aerie-Anomen banter
REPLACE_ACTION_TEXT  ~baerie~  ~SetGlobal("BAerie4","LOCALS",0)~ ~SetGlobal("BAerie4","LOCALS",1)~

// restore aerie-jan banter
ADD_STATE_TRIGGER BAERIE 44 ~InParty("Jan") See("Jan") !StateCheck("Jan",STATE_SLEEPING) Global("CDAerieJanBanter","LOCALS",0)~
ADD_TRANS_ACTION BAERIE BEGIN 44 END BEGIN END ~SetGlobal("CDAerieJanBanter","LOCALS",1)~

// restore aerie-minsc banter
ADD_STATE_TRIGGER BAERIE 76 ~InParty("Minsc") See("Minsc") !StateCheck("Minsc",STATE_SLEEPING) Global("CDAerieMinscBanter","LOCALS",0) AreaType(FOREST)~
ADD_TRANS_ACTION BAERIE BEGIN 76 END BEGIN END ~SetGlobal("CDAerieMinscBanter","LOCALS",1)~

// give aerie a slightly different line if quayle is dead; see also ar0607.bcs
ADD_TRANS_TRIGGER BAERIE 120 ~!Dead("quayle")~ DO 1

// specific fixes to states and whatnot
REPLACE_STATE_TRIGGER BAERIE 294
~Global("LoveTalk","LOCALS",32)
Global("AerieRomanceActive","GLOBAL",1)
!StateCheck(Player1,STATE_SLEEPING)
OR(2)
Global("HaerDalisRomanceActive","GLOBAL",1)
Global("HaerDalisRomanceActive","GLOBAL",2)
InParty("HaerDalis")~
SET_WEIGHT BAERIE 294 #15

REPLACE_STATE_TRIGGER BAERIE 302
~Global("LoveTalk","LOCALS",34)
InParty("HaerDalis")
See("HaerDalis")
OR(2)
Global("HaerDalisRomanceActive","GLOBAL",2)
Global("HaerDalisRomanceActive","GLOBAL",1)
!StateCheck("HaerDalis",STATE_SLEEPING)
Global("AerieHaerDalis1","LOCALS",0)~
SET_WEIGHT BAERIE 302 #16

ADD_TRANS_ACTION BAERIE
BEGIN 360 END
BEGIN 0 END
~SetGlobal("SleptAerie","GLOBAL",0)~

ADD_TRANS_ACTION BAERIE
BEGIN 385 END
BEGIN 1 END
~SetGlobal("AerieRomanceActive","GLOBAL",2)~

// Fix Aerie's "Blanket Thieves" banter which could never occur due to a duplicated PartyRested() trigger (berelinde)
REPLACE_TRIGGER_TEXT ~baerie~ ~PartyRested()~ ~~ // state trigger 27, state 66

// when NPC have just-before-rest LTs, often don't properly rest the party
ADD_TRANS_ACTION BANOMEN
BEGIN 370 END
BEGIN END
~RestParty()~

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

// belmin no valid links fix
REPLACE_TRIGGER_TEXT ~belmin~ ~!Race(Player[2-6],ELF)~ ~~

// better bernard response
ALTER_TRANS BERNARD BEGIN 8 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 3~ END // originally to 5 (can get there from 3)

// if you just kill lehtinan, you can say "hendak promised a discout" to bernard even though you've never met hendak
ADD_TRANS_TRIGGER BERNARD 22 ~GlobalGT("HendakReleased","AR0406",2)~ DO 2 // only if you know

// Fix Haer'Dalis' "Arcane muttering" banter with Edwin which could never occur due to a duplicated PartyRested() trigger (aVENGER)
REPLACE_TRIGGER_TEXT ~bhaerda~ ~PartyRested()~ ~~ // state 19

// restore haer'dalis-mazzy banter
ADD_STATE_TRIGGER BHAERDA 2 ~InParty("Mazzy") See("Mazzy") !StateCheck("Mazzy",STATE_SLEEPING) Global("CDHaerdalisMazzyBanter","LOCALS",0)~
ADD_TRANS_ACTION BHAERDA BEGIN 2 END BEGIN END ~SetGlobal("CDHaerdalisMazzyBanter","LOCALS",1)~

// haer'dalis-aerie breakup banter could repeat
ADD_STATE_TRIGGER BHAERDA 154 ~!Global("HaerDalisRomanceActive","GLOBAL",3)~

// allow cleric-rangers to acquire temple stronghold; see ar0900.bcs, ar0902.bcs, arval.bcs, borinall.dlg, scsain.dlg, travin.dlg
REPLACE_STATE_TRIGGER BHARVAL 0
~NumTimesTalkedTo(0)
OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Alignment(Player1,MASK_GOOD)
Global("BeholderPlot","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHARVAL 3
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
InPartySlot(LastTalkedToBy,0)
Alignment(Player1,MASK_GOOD)
ReputationGT(Player1,14)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHARVAL 5
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
InPartySlot(LastTalkedToBy,0)
Alignment(Player1,MASK_GOOD)
ReputationLT(Player1,15)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

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

REPLACE_ACTION_TEXT ~bjaheir~ ~SetGlobalTimer("TerminselAppear","GLOBAL",ONE_DAY)~ ~~ // as it is useless and potentially buggy.

// An instance of Jaheira's dialogue will no longer loop endlessly if the player isn't a suitable romance partner for her (Jason Compton and Wisp)
ALTER_TRANS bjaheir BEGIN 68 END BEGIN 0 1 2 END BEGIN
"ACTION" ~IncrementGlobal("LoveTalk","LOCALS",1)~
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

// korgan not setting variable to track whether this talk has occurred
ADD_TRANS_ACTION BKORGAN
BEGIN 109 END
BEGIN END
~SetGlobal("BKorgan24","LOCALS",1)~

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

// shouldn't skip anomen romance lines
ALTER_TRANS BODHIAMB BEGIN 11 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~GOTO 18~
END

// allow cleric-rangers to acquire temple stronghold; see ar0900.bcs, ar0902.bcs, arval.bcs, bharval.dlg, scsain.dlg, travin.dlg
ALTER_TRANS BORINALL BEGIN 8 END BEGIN 3 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Alignment(Player1,MASK_GOOD)~
END

// valygar speaks as though lavok has already been taken care of
ADD_STATE_TRIGGER BVALYGA 41 ~Dead("Lavok02")~

// restore valygar-korgan banter
ADD_STATE_TRIGGER BVALYGA 65 ~InParty("Korgan") See("Korgan") !StateCheck("Korgan",STATE_SLEEPING) Global("CDValygarKorganBanter","LOCALS",0)~
ADD_TRANS_ACTION BVALYGA BEGIN 65 END BEGIN END ~SetGlobal("CDValygarKorganBanter","LOCALS",1)~

// fixes broken branch in Viccy's banter file
ALTER_TRANS BVICONI BEGIN 103 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~GOTO 368~
END

// Viccy not setting variable to track whether this talk has occurred
ADD_TRANS_ACTION BVICONI
BEGIN 27 END
BEGIN 1 END
~SetGlobal("BViconia12","LOCALS",1)~

// one option to tell off Viccy in aerie LT prematurely ends dialogue
ALTER_TRANS BVICONI BEGIN 548 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  EPILOGUE ~EXTERN BAERIE 434~
END

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

// Elhan gives out 74500 XP twice
REPLACE_ACTION_TEXT ~c6elhan2~ ~AddXPObject(Player[1-6],74500)~ ~~
ADD_TRANS_ACTION c6elhan2
BEGIN 80 END
BEGIN END
~AddXPObject(Player1,74500)
AddXPObject(Player2,74500)
AddXPObject(Player3,74500)
AddXPObject(Player4,74500)
AddXPObject(Player5,74500)
AddXPObject(Player6,74500)~

// 'tracking irenicus' journal entry never goes away
ADD_TRANS_ACTION C6ELHAN2 BEGIN 0 END BEGIN END ~EraseJournalEntry(57515)~
ALTER_TRANS UDDUER01 BEGIN 10 END BEGIN END BEGIN "UNSOLVED_JOURNAL" ~~ "JOURNAL" ~#57515~ END // also make sure it's set as a generic journal entry consistently
  
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

// deril should whine when attacked
REPLACE_TRIGGER_TEXT ~cederil~  ~Global("DerilHalfHealth","LOCALS",1)~ ~Global("DerilHalfHealth","GLOBAL",1)~

// No valid replies or links for Cernd
ALTER_TRANS cernd BEGIN 6 END BEGIN 0 END BEGIN TRIGGER ~~ END
ALTER_TRANS cernd BEGIN 6 END BEGIN 2 END BEGIN TRIGGER
~OR(3)
  !InParty("Jaheira")
  !AreaCheckObject("AR2009","Jaheira")
  Dead("Jaheira")
InParty("Minsc")
AreaCheckObject("AR2009","Minsc")
!Dead("Minsc")~ END
ALTER_TRANS cernd BEGIN 6 END BEGIN 3 END BEGIN TRIGGER
~OR(2)
  Class(Player1,DRUID_ALL)
  Class(Player1,RANGER_ALL)
OR(3)
  !InParty("Jaheira")
  !AreaCheckObject("AR2009","Jaheira")
  Dead("Jaheira")
OR(3)
  !InParty("Minsc")
  !AreaCheckObject("AR2009","Minsc")
  Dead("Minsc")~ END

// fixes non-recognition of the PC as great druid
CHAIN IF WEIGHT #0 ~Global("DruidStronghold","GLOBAL",1)
Global("KickedOut","LOCALS",1)
Global("CerndBaby","GLOBAL",0)~ THEN CERNDP PCGroveLeader @105
END CERNDP 2

// journal entries not set if minsc/yoshi interject
ALTER_TRANS CIRCG1 BEGIN 3 END BEGIN 1 2 END BEGIN "UNSOLVED_JOURNAL" ~#34110~ END

// journal entry only being added on 1/3 entries
ALTER_TRANS CLGLIN01 BEGIN 8 END BEGIN 1 2 END BEGIN "UNSOLVED_JOURNAL" ~#55571~ END

// global should be set even on interjections
ADD_TRANS_ACTION copgreet
BEGIN 6 END
BEGIN 1 2 END
~SetGlobal("TalkedToFrankie","GLOBAL",1)~

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

// fixes 'no valid' error for slave leader in ust natha
ALTER_TRANS DASLAVE1 BEGIN 10 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~~
END

// threatening the beggar goes to correct response
ALTER_TRANS DBEGGAR BEGIN 1 END BEGIN 4 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // originally went to 7

// restores an extra insult of Delcia's
ALTER_TRANS DELCIA BEGIN 38 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // original went to 7, now 6 > 7

ALTER_TRANS DELON BEGIN 16 END BEGIN END BEGIN ACTION ~RevealAreaOnMap("AR1100") SetGlobal("Acceptance","GLOBAL",1)~ END // add map reveal

// demson handing out waaaaay too much XP here
ALTER_TRANS DEMSON BEGIN 21 END BEGIN END BEGIN ACTION ~AddexperienceParty(7500)~ END // was 75k; only get 10k if all three survive

// various dead/alive checks on the farmers missing half of them; see also direct copy-and-patch in main tp2
ADD_TRANS_TRIGGER DEMSON 47 ~!Dead("plfarm04") !Dead("plfarm05") !Dead("plfarm06")~ DO 0 1 2 4
REPLACE_TRIGGER_TEXT DEMSON ~Global("PaladinPlot","GLOBAL",11)~ ~Global("PaladinPlot","GLOBAL",10)~ // value of 11 can't be reached

// child should leave even on interjections
ADD_TRANS_ACTION dlost
BEGIN 3 END
BEGIN 1 2 END
~EscapeArea()~

// allows Oghma templites to help with romance/vampirism
ALTER_TRANS DOGHMA BEGIN 9 END BEGIN 3 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~Global("RevealUmar","GLOBAL",1)
OR(4)
PartyHasItem("miscbl")
PartyHasItem("miscbm")
PartyHasItem("miscbn")
PartyHasItem("miscbo")~
END

// fix for player getting control in dreams equence (argent77)
REPLACE_TRANS_ACTION DREAM4 BEGIN 10 END BEGIN 0 END
  ~ActionOverride(Player1,Attack("Drim02"))~
  ~ActionOverride(Player1,MoveToObject("Drim02"))~

// Edwin soundset and variable fixes
ALTER_TRANS EDWINJ BEGIN 16 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~SetPlayerSound(Myself,3966,MORALE)
SetPlayerSound(Myself,3968,HAPPY)
SetPlayerSound(Myself,3969,UNHAPPY_ANNOYED) 
SetPlayerSound(Myself,3970,UNHAPPY_SERIOUS) 
SetPlayerSound(Myself,3971,UNHAPPY_BREAKING_POINT) 
SetPlayerSound(Myself,3972,LEADER) 
SetPlayerSound(Myself,3973,TIRED) 
SetPlayerSound(Myself,3974,BORED) 
SetPlayerSound(Myself,3967,BATTLE_CRY1)
SetPlayerSound(Myself,30694,BATTLE_CRY2) 
SetPlayerSound(Myself,30706,BATTLE_CRY3) 
SetPlayerSound(Myself,5350,DAMAGE)
SetPlayerSound(Myself,5351,DYING) 
SetPlayerSound(Myself,3975,HURT)
SetPlayerSound(Myself,5345,AREA_FOREST) 
SetPlayerSound(Myself,5346,AREA_CITY)
SetPlayerSound(Myself,5347,AREA_DUNGEON)
SetPlayerSound(Myself,5348,AREA_DAY) 
SetPlayerSound(Myself,5349,AREA_NIGHT) 
SetPlayerSound(Myself,3976,SELECT_COMMON1) 
SetPlayerSound(Myself,3977,SELECT_COMMON2)
SetPlayerSound(Myself,3978,SELECT_COMMON3) 
SetPlayerSound(Myself,30709,SELECT_COMMON4)
SetPlayerSound(Myself,30710,SELECT_COMMON5) 
SetPlayerSound(Myself,30711,SELECT_COMMON6) 
SetPlayerSound(Myself,30712,SELECT_ACTION1) 
SetPlayerSound(Myself,30713,SELECT_ACTION2) 
SetPlayerSound(Myself,30714,SELECT_ACTION3) 
SetPlayerSound(Myself,30715,SELECT_ACTION4)
SetPlayerSound(Myself,3984,SELECT_ACTION5) 
SetPlayerSound(Myself,3985,SELECT_ACTION6) 
SetPlayerSound(Myself,3986,SELECT_ACTION7)
SetPlayerSound(Myself,30716,SELECT_RARE1)
SetPlayerSound(Myself,30717,SELECT_RARE2) 
SetPlayerSound(Myself,30718,CRITICAL_HIT)
SetPlayerSound(Myself,30719,CRITICAL_MISS) 
SetPlayerSound(Myself,30720,TARGET_IMMUNE) 
SetPlayerSound(Myself,30721,INVENTORY_FULL) 
SetPlayerSound(Myself,30722,PICKED_POCKET) 
SetPlayerSound(Myself,30723,EXISTANCE1)
SetPlayerSound(Myself,30724,EXISTANCE2)
SetPlayerSound(Myself,30725,EXISTANCE3)~
END

// restore one more line for Edwin rejoining
ALTER_TRANS EDWINP BEGIN 4 8 END BEGIN 0 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 1~ END

// elgea deleting mae'var journal entry due to transposed numbers; just remove outright since she erases the correct entry a few states later
ALTER_TRANS ELGEA BEGIN 8 END BEGIN 0 END BEGIN ACTION ~~ END

// restore missing branch for spellhold apparition
ALTER_TRANS ELEARB06 BEGIN 0 END BEGIN 3 END BEGIN EPILOGUE ~GOTO 6~ END // one more state and some dialogue

// close familiar mule exploit by giving inventory to Player1 before going into the pack
REPLACE_ACTION_TEXT_REGEXP ~^famil[1-3]$~ ~\(GiveItemCreate("FAM[A-Z]+",Player1,0,0,0)\)~ ~GivePartyAllEquipment() \1~

// many FF characters repeat unique dialogue due to the area change if the PC acquires the FF stronghol
REPLACE_TRIGGER_TEXT FFBART ~Global("InteractMazzy","LOCALS",0)~
                            ~Global("IKFFMazzyBoots","GLOBAL",0)~
REPLACE_TRIGGER_TEXT FFBART ~Global("InteractHaerDalis","LOCALS",0)~
                            ~Global("IKFFHaerDalisGem","GLOBAL",0)~
REPLACE_ACTION_TEXT FFBART ~SetGlobal("InteractMazzy","LOCALS",1)~
                           ~SetGlobal("IKFFMazzyBoots","GLOBAL",1)~
REPLACE_ACTION_TEXT FFBART ~SetGlobal("InteractHaerDalis","LOCALS",1)~
                           ~SetGlobal("IKFFHaerDalisGem","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST03 ~Global("InteractAerie","LOCALS",0)~
                              ~Global("IKFFCustomer3Aerie","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST03 ~SetGlobal("InteractAerie","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer3Aerie","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST03 ~Global("InteractJaheira","LOCALS",0)~
                              ~Global("IKFFCustomer3Jaheira","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST03 ~SetGlobal("InteractJaheira","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer3Jaheira","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST03 ~Global("InteractJan","LOCALS",0)~
                              ~Global("IKFFCustomer3Jan","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST03 ~SetGlobal("InteractJan","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer3Jan","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST03 ~Global("InteractKeldorn","LOCALS",0)~
                              ~Global("IKFFCustomer3Keldorn","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST03 ~SetGlobal("InteractKeldorn","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer3Keldorn","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST04 ~Global("InteractAerie","LOCALS",0)~
                              ~Global("IKFFCustomer4Aerie","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST04 ~SetGlobal("InteractAerie","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer4Aerie","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST04 ~Global("InteractJaheira","LOCALS",0)~
                              ~Global("IKFFCustomer4Jaheira","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST04 ~SetGlobal("InteractJaheira","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer4Jaheira","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST04 ~Global("InteractMazzy","LOCALS",0)~
                              ~Global("IKFFCustomer4Mazzy","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST04 ~SetGlobal("InteractMazzy","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer4Mazzy","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST04 ~Global("InteractViconia","LOCALS",0)~
                              ~Global("IKFFCustomer4Viconia","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST04 ~SetGlobal("InteractViconia","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer4Viconia","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST05 ~Global("InteractAnomen","LOCALS",0)~
                              ~Global("IKFFCustomer5Anomen","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST05 ~SetGlobal("InteractAnomen","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer5Anomen","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST05 ~Global("InteractKeldorn","LOCALS",0)~
                              ~Global("IKFFCustomer5Keldorn","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST05 ~SetGlobal("InteractKeldorn","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer5Keldorn","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST05 ~Global("InteractNalia","LOCALS",0)~
                              ~Global("IKFFCustomer5Nalia","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST05 ~SetGlobal("InteractNalia","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer5Nalia","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST05 ~Global("InteractValygar","LOCALS",0)~
                              ~Global("IKFFCustomer5Valygar","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST05 ~SetGlobal("InteractValygar","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer5Valygar","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST06 ~Global("InteractMazzy","LOCALS",0)~
                              ~Global("IKFFCustomer6Mazzy","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST06 ~SetGlobal("InteractMazzy","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer6Mazzy","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST06 ~Global("InteractValygar","LOCALS",0)~
                              ~Global("IKFFCustomer6Valygar","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST06 ~SetGlobal("InteractValygar","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer6Valygar","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST06 ~Global("InteractViconia","LOCALS",0)~
                              ~Global("IKFFCustomer6Viconia","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST06 ~SetGlobal("InteractViconia","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer6Viconia","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST08 ~Global("InteractAerie","LOCALS",0)~
                              ~Global("IKFFCustomer8Aerie","GLOBAL",0)~
ADD_TRANS_ACTION FFCUST08 BEGIN 8 END
                          BEGIN 0 END
                          ~SetGlobal("IKFFCustomer8Aerie","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST08 ~Global("InteractMazzy","LOCALS",0)~
                              ~Global("IKFFCustomer8Mazzy","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST08 ~SetGlobal("InteractMazzy","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer8Mazzy","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST08 ~Global("InteractMinsc","LOCALS",0)~
                              ~Global("IKFFCustomer8Minsc","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST08 ~SetGlobal("InteractMinsc","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer8Minsc","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST08 ~Global("InteractNalia","LOCALS",0)~
                              ~Global("IKFFCustomer8Nalia","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST08 ~SetGlobal("InteractNalia","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer8Nalia","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST09 ~Global("InteractKeldorn","LOCALS",0)~
                              ~Global("IKFFCustomer9Keldorn","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST09 ~SetGlobal("InteractKeldorn","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer9Keldorn","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFCUST09 ~Global("InteractYoshimo","LOCALS",0)~
                              ~Global("IKFFCustomer9Yoshimo","GLOBAL",0)~
REPLACE_ACTION_TEXT FFCUST09 ~SetGlobal("InteractYoshimo","LOCALS",1)~
                             ~SetGlobal("IKFFCustomer9Yoshimo","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFWENCH ~Global("InteractMazzy","LOCALS",0)~
                             ~Global("IKFFWenchMazzy","GLOBAL",0)~
REPLACE_ACTION_TEXT FFWENCH ~SetGlobal("InteractMazzy","LOCALS",1)~
                            ~SetGlobal("IKFFWenchMazzy","GLOBAL",1)~
REPLACE_TRIGGER_TEXT FFWENCH ~Global("InteractMinsc","LOCALS",0)~
                             ~Global("IKFFWenchMinsc","GLOBAL",0)~
REPLACE_ACTION_TEXT FFWENCH ~SetGlobal("InteractMinsc","LOCALS",1)~
                            ~SetGlobal("IKFFWenchMinsc","GLOBAL",1)~

// dialogue should check live and dead troll DV
REPLACE_TRIGGER_TEXT ~firamb01~ ~Dead("firamb05")~ ~OR(2) Dead("firamb03") Dead("firamb05")~

// hands out XP to all party members except PC
ADD_TRANS_ACTION FIRKRA02 BEGIN 34 END BEGIN END ~AddXPObject(Player1,40500)~

// if you steal the deed from garren and give it to firkraag, garren has wrong responses; see also garren.dlg
REPLACE_ACTION_TEXT FIRKRA02 ~SetGlobal("FirkraagDeal","GLOBAL",0)~ ~SetGlobal("FirkraagDeal","GLOBAL",2)~
REPLACE_STATE_TRIGGER FIRKRA02 26 ~!Global("FirkraagDeal","GLOBAL",1)~ // to allow for new FirkraagDeal=2 value

// sort out journal entries for attacking firkraag; see also dragred.bcs
ALTER_TRANS FIRKRA02 BEGIN 21 END BEGIN 0 END BEGIN ~UNSOLVED_JOURNAL~ ~#15724~ END // change from 22917
ALTER_TRANS FIRKRA02 BEGIN 25 END BEGIN END BEGIN ~UNSOLVED_JOURNAL~ ~~ ~SOLVED_JOURNAL~ ~#22197~ END // change from unsolved to solved
ADD_TRANS_ACTION FIRKRA02 BEGIN 25 END BEGIN END ~EraseJournalEntry(15724)~ // erase the new unsolved journal

// should be able to report progress to temple officials; see also bhnalla.dlg, prophet1-4.dlg
ADD_TRANS_ACTION GAAL BEGIN 14 END BEGIN END ~SetGlobal("KnowBeholder","GLOBAL",1)~ // getting job from gaal reveals beholder

// gaelan asking for 20k gold, not 50k
ALTER_TRANS GAELAN BEGIN 29 END BEGIN 2 END // filename, state, trans
BEGIN TRIGGER ~PartyGoldGT(19999)~ END
ALTER_TRANS GAELAN BEGIN 29 END BEGIN 3 END // filename, state, trans
BEGIN TRIGGER ~PartyGoldLT(20000)~ END

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

// missing actions for one response
ADD_TRANS_ACTION GARREN BEGIN 45 END BEGIN 1 END ~ActionOverride("firban01",DestroySelf())
ActionOverride("firban02",DestroySelf())
ActionOverride("firban03",DestroySelf())
ActionOverride("firban04",DestroySelf())
ActionOverride("firban05",DestroySelf())
ActionOverride("garjum",DestroySelf())
SetGlobal("DomainPaladinBattle","GLOBAL",5)~

// if you steal the deed from garren and give it to firkraag, garren has wrong responses; see also firkra02.dlg
ADD_STATE_TRIGGER GARREN 38 ~!Dead("garkid01") !Dead("garkid02")~

// polite response from player leads to response implying rudeness from player
ALTER_TRANS GERETH BEGIN 3 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 1~ END // originally went to 4
ALTER_TRANS GERETH BEGIN 3 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 4~ END // actual impolite response went to 6

// townsperson interjection is checking for viccy on a valygar interjection
REPLACE_TRIGGER_TEXT ~gmtown02~ ~Viconia~ ~Valygar~
REPLACE_ACTION_TEXT  ~gmtown02~ ~Viconia~ ~Valygar~

// adds checks to Gorf to fix issues
REPLACE_TRIGGER_TEXT GORF1
~Global("GorfBystander","GLOBAL",0)~ 
~Global("GorfBystander","GLOBAL",0) 
Global("GoKillEm","LOCALS",0)~

// no more accidental Grae killings
REPLACE_ACTION_TEXT ~grae~ ~Kill(Myself)~ ~DestroyItem("minhp1") Kill(Myself)~
REPLACE_ACTION_TEXT ~grae~ ~EscapeArea()~ ~SetInterrupt(FALSE) EscapeArea()~

// once slaving exposed, copper cornoet guards shouldn't be turning patrons hostile
ADD_TRANS_ACTION GUARD3 BEGIN 1 3 END BEGIN END ~ChangeAIScript("",CLASS)~ // blanks shout script when turning hostile like copguard.bcs

// haer'dalis
REPLACE_STATE_TRIGGER HAERDA 106 
~Dead("Mekrath")
Global("HaerDalisMove","GLOBAL",0)
Global("PlanarPrison","GLOBAL",0)~

// asking about the play misses two lines of prior exposition
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 53~ END // originally to 9, now 53 > 54 > 9

// asking for the long version also gets a few more lines
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 50~ END // originally to 7, now 50 > 51 > 7

// gives raelis a few more lines before asking for help
ALTER_TRANS HAERDAJ BEGIN 14 END BEGIN 2 3 END BEGIN ~EPILOGUE~ ~EXTERN RAELIS 64~ END // originally to raelis 9, now raelis 64 > 65 > 9

// asking about young conduit goes to completely unrelated state
ALTER_TRANS HAERDAJ BEGIN 15 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 57~ END // originally to 8

// eliminates selfish hell test exploits
REPLACE_ACTION_TEXT HELLSELF
~CreateVisualEffectObject("SPFLESHS",Player2Fill)~
~ActionOverride(Player2Fill,MakeUnselectable(5))
CreateVisualEffectObject("SPFLESHS",Player2Fill)~
REPLACE_TRIGGER_TEXT ~hellself~ ~Global("OpenedDoor6","AR2904",0)~ ~Global("OpenedDoor5","AR2904",1)~

// hendak not consistently adding 'refused' journal entry
ALTER_TRANS HENDAK BEGIN 13 END BEGIN END BEGIN "UNSOLVED_JOURNAL" ~#16553~ END

// Kangaxx will properly transform even if first dialogue didn't fire
ADD_STATE_TRIGGER HLKANG 0 ~!HP(Myself,1)~

// more kangaxx-proofing; see also klkang.bcs
ALTER_TRANS HLKANG BEGIN 3 END BEGIN 0 END BEGIN ACTION ~SetGlobal("cd_change","LOCALS",1)~ END

// hurgis has another line; extend dialogue
ALTER_TRANS HURGISF BEGIN 11 END BEGIN 1 END BEGIN EPILOGUE ~GOTO 12~ ACTION ~~ END // state 12 already has the Enemy() call
ALTER_TRANS HURGISR BEGIN 11 END BEGIN 1 END BEGIN EPILOGUE ~GOTO 12~ ACTION ~~ END // state 12 already has the Enemy() call

// add journal entry for opening doors in opening dungeon
ALTER_TRANS IGOLEM1 BEGIN 13 END BEGIN END BEGIN "SOLVED_JOURNAL" ~#47522~ END

// bypass the wander part of ilyich's script once combat starts; see also ilyich.bcs
ADD_TRANS_ACTION ILYICH BEGIN 0 END BEGIN END ~SetGlobal("duergarleader","LOCALS",9)~

// transition to edwin missing edwin check
ADD_TRANS_TRIGGER imoen2j 11 ~IsValidForPartyDialog("Edwin")~ DO 15

// jaheira can leave if PC is jerk about dead khalid; imoen's dialogue should check she's not leaving before trying to comfort her; see imoen.bcs
ADD_STATE_TRIGGER IMOENJ 29 ~InParty("jaheira")~

// missing journal entries
ALTER_TRANS IMOENJ   BEGIN  14 END BEGIN 0     END BEGIN "JOURNAL"            ~#843~ END
ALTER_TRANS JAHEIRAJ BEGIN  61 END BEGIN 0     END BEGIN "SOLVED_JOURNAL"   ~#47972~ END
ALTER_TRANS JAHEIRAJ BEGIN 294 END BEGIN 0     END BEGIN "SOLVED_JOURNAL"   ~#47972~ END
ALTER_TRANS MGTEOS01 BEGIN  30 END BEGIN 1 2 3 END BEGIN "JOURNAL"          ~#55627~ END
ALTER_TRANS MGTEOS01 BEGIN  38 END BEGIN 1 2   END BEGIN "JOURNAL"          ~#55628~ END
ALTER_TRANS NALIA    BEGIN  66 END BEGIN 1     END BEGIN "UNSOLVED_JOURNAL" ~#40131~ END
ALTER_TRANS OBSSOL02 BEGIN   4 END BEGIN 0     END BEGIN "JOURNAL"           ~#7241~ END
ALTER_TRANS OBSSOL03 BEGIN   4 END BEGIN 0     END BEGIN "JOURNAL"          ~#23551~ END
ALTER_TRANS RIBALD   BEGIN  34 END BEGIN 1     END BEGIN "JOURNAL"          ~#55641~ END

// close exploit of forcing imoen to rejoin in CI when trying to run away
ADD_TRANS_ACTION IMOENP
BEGIN 3 END
BEGIN END
~SetInterrupt(FALSE) DialogInterrupt(FALSE)~

// in case imoen heals between script nudge and diialogue
REPLACE_STATE_TRIGGER imoenp 3 ~Global("ImoenRunning","LOCALS",1)~
SET_WEIGHT imoenp 3 #-1

// checking for wrong item
REPLACE_TRANS_TRIGGER INSPECT BEGIN 31 END BEGIN 0 END ~PartyHasItem("MISC5J")~ ~PartyHasItem("MISC5G")~

// end Galvarey's stuttering if Jaheira is invisible (see jagalvar.cre)
REPLACE_STATE_TRIGGER JAGALVAR 0
~Detect([PC])
Range(LastSeenBy(Myself),15)
NumTimesTalkedTo(0)
Allegiance(Myself,NEUTRAL)~

// from EoU romance fixes
REPLACE_ACTION_TEXT JAGALVAR
~RealSetGlobalTimer("JaheiraRomance","GLOBAL",3600)~
~RealSetGlobalTimer("JaheiraRomance","GLOBAL",1800)~

// jaheira can have wrong dialogue due to script lag when freed
REPLACE_TRIGGER_TEXT ~jaheira~ ~Global("JaheiraReleased","GLOBAL",~ ~OpenState("Cell01",~

ADD_TRANS_ACTION JAHEIRA
BEGIN 29 30 31 32 END
BEGIN END
~SetGlobal("JaheiraReleased","GLOBAL",1)~

// Jaheira can stutter if blinded while finding Khalid's body
REPLACE_TRIGGER_TEXT ~jaheiraj~ ~See("DeadKhalid")~ ~Range("DeadKhalid",20)~

// Romance interests can comment on PhaereInnuendo in chapter 6 if they were not in the party during chapter 5 (the bigg) (see aerie.bcs, aeriej.dlg, jaheira.bcs, jaheiraj.dlg viconia.bcs, viconij.dlg)
ADD_STATE_TRIGGER ~JAHEIRAJ~ 437 ~Global("Chapter","GLOBAL",5)~ 441 447

// jaheira dupe responses
ADD_TRANS_TRIGGER JAHEIRAJ 65 ~Global("JaheiraJerk","GLOBAL",1)~ DO 0
ADD_TRANS_TRIGGER JAHEIRAJ 65 ~Global("JaheiraJerk","GLOBAL",0)~ DO 1

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

// fixes Jaheira's harper hold trip
REPLACE_STATE_TRIGGER JAHEIRAP 32 ~!AreaCheck("AR0300")
OR(2)
  Global("JaheiraRomanceActive","GLOBAL",0)
  Global("JaheiraRomanceActive","GLOBAL",3)
GlobalGT("JaheiraHarperPlot","GLOBAL",0)
GlobalLT("HarperFight","GLOBAL",1)
Global("KickedOut","LOCALS",0)~

// Fix for Jaheira having the wrong dialogue when a non-romance protagonist refuses to follow her to the Harper Hold (aVENGER) - !AreaCheck("AR0300") for state 32 moved to above patch
REPLACE_TRIGGER_TEXT ~jaheirap~  ~GlobalGT("JaheiraHarperPlot","GLOBAL",3)~ ~Global("JaheiraHarperPlot","GLOBAL",3) AreaCheck("AR0300") !InParty(Myself)~ // trigger 8, state 21

// if you piss off jan and he leaves, he's perfectly happy when you try to get him back
ADD_TRANS_ACTION JANJ BEGIN 7 END BEGIN END ~SetGlobal("KickedOut","LOCALS",1) SetGlobal("LeaveJan","GLOBAL",1)~ // set proper leaving vars
ADD_STATE_TRIGGER JANP 24 ~!Global("JanPissed","GLOBAL",1)~ // prevent happy welcome if pissed
ADD_STATE_TRIGGER JANP 34 ~Global("JanPissed","GLOBAL",1)~  // new pissed off dialogue

// Jarlaxle should have enough gold to reward the party for their efforts (Ardanis)
REPLACE_ACTION_TEXT jarlaxle ~GivePartyGold(~ ~GiveGoldForce(~

// infinite xp exploit for juggernait golem-jermien-daar-colette stuff in imnesvale
REPLACE_ACTION_TEXT JUGDAR01 ~\([^,]\)EscapeArea()~ ~\1SetInterrupt(FALSE) DialogueInterrupt(FALSE) EscapeArea()~
REPLACE_ACTION_TEXT JUGJER01 ~EscapeArea()~ ~SetInterrupt(FALSE) DialogueInterrupt(FALSE) EscapeArea()~

// Keldorn re-joining variable typo fix (berelinde)
REPLACE_ACTION_TEXT ~keldorj~ ~SetGlobal("KeldornLeaves","GLOBAL",1)~  ~SetGlobal("KeldornLeave","GLOBAL",1)~ // action 6

// should be setting to 2 here, though it appears to be harmless
REPLACE_TRANS_ACTION KELDORP BEGIN 9 END BEGIN 0 END ~SetGlobal("LadyMaria","GLOBAL",4)~ ~SetGlobal("LadyMaria","GLOBAL",2)~

// restore one more line for Keldorn rejoining
ALTER_TRANS KELDORP BEGIN 30 END BEGIN 0 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 31~ END // delete joinparty from 30, as 31 already has it

// norh rep trap uses same name for timer and variable; see fixes to amntrp0[1-3].bcs
REPLACE_ACTION_TEXT ~knight~ ~SetGlobalTimer("MostNobleOrder","GLOBAL",ONE_DAY)~ ~SetGlobalTimer("CDMostNobleOrder","GLOBAL",ONE_DAY)~

// eliminates Captain Arat's flame arrow exploit, part 1/4
EXTEND_BOTTOM KPCAPT01 49
  IF ~!IsValidForPartyDialog("Nalia") Global("CDAratGaveArrows","GLOBAL",1)~ THEN UNSOLVED_JOURNAL #49487 GOTO CDAratGaveArrows
END

// eliminates Captain Arat's flame arrow exploit, part 2/4
// new, arrows-already-given state
APPEND KPCAPT01
  IF ~~ THEN BEGIN CDAratGaveArrows SAY @107
    IF ~~ THEN UNSOLVED_JOURNAL #20986 FLAGS 128 EXIT
  END
END

// eliminates Captain Arat's flame arrow exploit, part 3/4
// make sure arrows only given once; set tracking var
ADD_TRANS_ACTION KPCAPT01 BEGIN 11 END BEGIN END ~SetGlobal("CDAratGaveArrows","GLOBAL",1)~

// Arat would sometimes act as if drawbridge was open if it was not
REPLACE_STATE_TRIGGER KPCAPT01 50
~!Dead("Torgal")
Global("BridgeOpen","GLOBAL",1)
Global("TrollsDead","LOCALS",0)~
SET_WEIGHT KPCAPT01 50 #0

// olma's dialogue not properly checking she's speaking to the lord of the manor
ADD_STATE_TRIGGER KPCOOK01 0 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 1 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 2 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER KPCOOK01 3 ~InPartySlot(LastTalkedToBy,0)~
REPLACE_STATE_TRIGGER KPCOOK01 4 ~!InPartySlot(LastTalkedToBy,0)~

// majordomo not recognizing nalia; don't mention where gold is stored in initial dialogue
REPLACE_STATE_TRIGGER KPDOMO01 21
~!InPartySlot(LastTalkedToBy,0) !Name("Nalia",LastTalkedToBy)~
ADD_TRANS_TRIGGER KPDOMO01 25 ~NumTimesTalkedToGT(1)~ DO 1

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

// glacias charm/dispel fix, new method
ALTER_TRANS KPGLAI01 BEGIN 0 END BEGIN END BEGIN "ACTION" ~~ END

// if party saves glaicas after torgal's dead, they never get the flail head
ADD_TRANS_ACTION KPGLAI01 BEGIN 2 END BEGIN 1 END ~GiveItem("blun14c",LastTalkedToBy)~

// goes to nicer, thanks for the money response
ALTER_TRANS KPMERC01 BEGIN 12 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 9~ END // originally went to 14

// Lavok missing checks for existing stronghold before offering sphere
ALTER_TRANS LAVOK BEGIN 59 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~OR(2)
!Class(Player1,MAGE_ALL)
Global("PlayerHasStronghold","GLOBAL",1)~
END
ALTER_TRANS LAVOK BEGIN 59 END BEGIN 1 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~Class(Player1,MAGE_ALL)
Global("PlayerHasStronghold","GLOBAL",0)~
END
  
// lavok being picky about XP rewards
ADD_TRANS_ACTION LAVOK BEGIN 15 END BEGIN 1 2 END ~AddexperienceParty(28750)~

// lavok has some valygar-specific dialogue here if he's talked about him before
ADD_TRANS_TRIGGER LAVOK 23 ~!Global("vgMentionLavok","GLOBAL",1)~ DO 1

// lavok's pair of post-attack dialogues (states 3, 15) don't have complementary triggers
REPLACE_STATE_TRIGGER LAVOK 3 ~Global("TalkedLavok","GLOBAL",1) IsValidForPartyDialog("Valygar")~

// lehtinan removing wrong journal entry (state 20)
REPLACE_ACTION_TEXT ~lehtin~ ~EraseJournalEntry(16533)~ ~EraseJournalEntry(16553)~

// if vittorio spawns behind wall, can break wish quest - also cosmetic change to open door, too
REPLACE_ACTION_TEXT ~lout~ ~EscapeAreaMove("AR0514",[0-9]+,[0-9]+,4)~ ~OpenDoor("Door0514b") EscapeAreaMove("AR0514",442,410,4)~

// maevar won't direct you to steal from the lathander temple if a party member is a morninglord, but only checked in 1/3 branches (making replies in states 7 and 10 to be in line with replies from 8)
ADD_TRANS_TRIGGER MAEVAR 7 ~!Kit(Player1,GODLATHANDER) !Kit(Player2,GODLATHANDER) !Kit(Player3,GODLATHANDER) !Kit(Player4,GODLATHANDER) !Kit(Player5,GODLATHANDER) !Kit(Player6,GODLATHANDER)~ 10 DO 0
ALTER_TRANS MAEVAR BEGIN 7 10 END BEGIN 1 END BEGIN TRIGGER ~OR(7) ReputationGT(Player1,9) Kit(Player1,GODLATHANDER) Kit(Player2,GODLATHANDER) Kit(Player3,GODLATHANDER) Kit(Player4,GODLATHANDER) Kit(Player5,GODLATHANDER) Kit(Player6,GODLATHANDER)~ END // exit w/o imoen info

// gives Mazzy a bit more exposition, same routing now as state 0
ALTER_TRANS MAZZY BEGIN 15 END BEGIN 2 END BEGIN ~EPILOGUE~ ~GOTO 45~ END

// if you agree to help Mazy and Pala in Danno's talk, then later back out, initial journal entries never cleared
ADD_TRANS_ACTION MAZZYJ BEGIN 13 21 END BEGIN END ~EraseJournalEntry(34673)~
ADD_TRANS_ACTION MAZZYJ BEGIN 34 END BEGIN END ~EraseJournalEntry(34673) EraseJournalEntry(34683)~

// mekrath not clearing his journal entry; also see ar0705.bcs
ADD_TRANS_ACTION MEKRAT
BEGIN 15 END
BEGIN 1 END
~EraseJournalEntry(4660)~

// in progress comment, not done
REPLACE_STATE_TRIGGER MGAPPR01 48
~InPartySlot(LastTalkedToBy,0)
!GlobalTimerExpired("ApprentiBuildTimer","GLOBAL")
GlobalGT("Apprenti","GLOBAL",28)
GlobalLT("Apprenti","GLOBAL",31)~

// missing setglobal in 95, 96 to give apprenti intermediate dialogue
ADD_TRANS_ACTION MGAPPR02
BEGIN 95 END
BEGIN END
~SetGlobal("Apprenti","GLOBAL",29)~

ADD_TRANS_ACTION MGAPPR02
BEGIN 96 END
BEGIN END
~SetGlobal("Apprenti","GLOBAL",30)~

ALTER_TRANS MGAPPR02 BEGIN 49 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~SetGlobal("Apprenti","GLOBAL",10) SetGlobalTimer("ApprentiBuildTimer","GLOBAL",FOUR_DAYS)~ // global should be 10, not 9
END

// no valid links on random = 60
ALTER_TRANS MGAPPR02 BEGIN 77 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~RandomNumGT(100,0) RandomNumLT(100,61)~
END

// apprenti can sometimes not do actions from dialogue if in process of using their scripted visual spells
ADD_TRANS_ACTION MGAPPR02 BEGIN 42 END BEGIN 0 END ~ClearActions("MGAPPR01") ClearActions("MGAPPR03") ClearActions(Myself)~
ADD_TRANS_ACTION MGAPPR02 BEGIN 72 END BEGIN 0 END ~ActionOverride("MGAPPR01",DialogInterrupt(FALSE)) ActionOverride("MGAPPR03",DialogInterrupt(FALSE)) DialogInterrupt(FALSE)~

// mgappr03 checking for wrong variable value
REPLACE_TRIGGER_TEXT ~MGAPPR03~ ~Global("PoorMage","GLOBAL",31)~ ~Global("PoorMage","GLOBAL",3)~ // state 43

// There's a valid morul-sole-survivor transition here, but it's covered by an always-true transition.
// enable that line by adding a trigger to make it not-always true
// (only get to 10 if at least one apprentice is dead)
ADD_TRANS_TRIGGER MGBILL01 10 ~!Dead("mgappr02") OR(2) !Dead("mgappr01") !Dead("mgappr03")~ DO 1 // turn existing 1 (previously always true) to alive morul (but not lone survivor)

// removes exploit of multiple XP for sending Solamnic Knights home
ADD_STATE_TRIGGER MGKHOL01 0 ~Global("CDNoRepeat","LOCALS",0)~ 
ADD_TRANS_ACTION MGKHOL01
BEGIN 0 END
BEGIN 0 END
~SetGlobal("CDNoRepeat","LOCALS",1)~
REPLACE_ACTION_TEXT MGKHOL01 ~AddExperienceParty(45000)~ ~DialogInterrupt(FALSE) AddExperienceParty(45000)~

// half of the assassin spawn in Planar Sphere quests--other fixes in the ar0411 area script
ALTER_TRANS MGTEOS01 BEGIN 61 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~SetGlobal("SpawnAssassins","AR0411",1)~
END

// another teos fix to check tolgerias' new DV
REPLACE_TRIGGER_TEXT MGTEOS01
~Dead("tolger")~ ~Dead("tolger2")~

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

// cernd ntrjex blocked if Mazzy valid
REPLACE_TRIGGER_TEXT ~mourner5~ ~!I[sf]ValidForPartyDialog\(ue\)?("Mazzy")~ ~~

// can't offer rampah a few coins unless you have a few coins
ADD_TRANS_TRIGGER MURDBEGG 0 ~PartyGoldGT(2)~ DO 2

// wrong var check in trigger
REPLACE_STATE_TRIGGER MURTLEN 9
~IfValidForPartyDialogue("Aerie")
RandomNum(2,2)
Global("murtlenaerie","AR0700",0)~

// adds checks to Nalia to see if player already has a stronghold, part 1
ADD_TRANS_TRIGGER NALIA 81
~Global("PlayerHasStronghold","GLOBAL",0)~
DO 3

// adds checks to Nalia to see if player already has a stronghold, part 2
ADD_TRANS_TRIGGER NALIA 82
~Global("PlayerHasStronghold","GLOBAL",0)~
83 101 DO 0

// adds checks to Nalia to see if player already has a stronghold, part 3
REPLACE_TRIGGER_TEXT NALIA
~!Class(Player1,FIGHTER_ALL)~
~OR(2)
!Class(Player1,FIGHTER_ALL)
Global("PlayerHasStronghold","GLOBAL",1)~

// close infinite cash exploit for nalia
ADD_TRANS_TRIGGER NALIA 5 ~!Global("NaliaCash","GLOBAL",1)~ DO 5

// adds missing keep checks to Nalia's dialogue
REPLACE_STATE_TRIGGER NALIAJ 53 
~Dead("Torgal")
Global("NaliaKeepPlot","GLOBAL",0)
AreaCheck("AR1300")
Global("NaliaRaised","GLOBAL",0)
Global("PlayerHasStronghold","GLOBAL",0)
Class(Player1,FIGHTER_ALL)~

// eliminates Captain Arat's flame arrow exploit, part 4/4
// intercept externs/gotos to state 11, redirect if arrows already given (see also kpcapt01, state 49)
EXTEND_BOTTOM NALIAJ 177
  IF ~Global("CDAratGaveArrows","GLOBAL",1)~ THEN EXTERN KPCAPT01 CDAratGaveArrows
END

// duplicate journal entries for torgal death
ADD_TRANS_ACTION NALIAJ BEGIN 225 END BEGIN END ~EraseJournalEntry(11648)~

// one of three blocks to fix Nalia's kickout dialogues
ADD_STATE_TRIGGER NALIAP 12 ~Global("KishNaliaThankedPC","GLOBAL",0)~

// one of three blocks to fix Nalia's kickout dialogues
ADD_TRANS_ACTION NALIAP
BEGIN 13 END
BEGIN END
~SetGlobal("KishNaliaThankedPC","GLOBAL",1)~

// one of three blocks to fix Nalia's kickout dialogues
ADD_TRANS_ACTION NALIAP
BEGIN 13 END
BEGIN 1 END
~SetGlobal("KickedOut","LOCALS",1)~

// Nalia dialog fix (Taimon)
REPLACE_TRIGGER_TEXT ~naliap~ ~Global("EnteredAR1300","LOCALS",1)~ ~OR(2)
  Global("EnteredAR1300","GLOBAL",1)
  Global("EnteredAR1300","GLOBAL",2)~

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

// Ellie the Festhall cook multi-XP fix
REPLACE_ACTION_TEXT PIRCOR05
~AddXPObject(Player6,2250)~ ~AddXPObject(Player6,2250) SetInterrupt(FALSE) DialogInterrupt(FALSE) EscapeArea()~

// if party already has already gone to spellhold, disable transitions to ask about how to get in
ADD_TRANS_TRIGGER PIRMUR09 15 ~Global("HasAsylumWardstone","GLOBAL",0) Global("PPdeshSend","GLOBAL",0)~ DO 0

// if party already has already gone to spellhold, disable transitions to ask about how to get in
ADD_TRANS_TRIGGER PIRMUR10 12 ~Global("HasAsylumWardstone","GLOBAL",0) Global("PPdeshSend","GLOBAL",0)~ DO 0

// The Slayer change dialogue should use the proper reply string
ALTER_TRANS PLAYER1 BEGIN 27 END BEGIN 2 END BEGIN "REPLY" ~#55325~ END

// don't disable the tree and fubar the finale
ALTER_TRANS PLAYER1 BEGIN 30 END BEGIN 0 END // filename, state, trans
BEGIN ACTION ~SetGlobal("TreeLifeTalk","AR2805",2) TriggerActivation("Tran2806",TRUE)~ END

// player1's various monologues in spellhold maze links to wrong HD & Minsc states
ALTER_TRANS PLAYER1 BEGIN 3 END BEGIN  8 END BEGIN EPILOGUE ~EXTERN HAERDAJ 137~ END // was 140
ALTER_TRANS PLAYER1 BEGIN 5 END BEGIN 15 END BEGIN EPILOGUE ~EXTERN MINSCJ 202~ END // was 203

// move bounding var to dialogue for better reliability; see ppbhaal.bcs
ADD_TRANS_ACTION PPBHAAL BEGIN 5 END BEGIN END ~SetGlobal("spoke","LOCALS",1)~

// make bodhi's friends' escape less awkward
ALTER_TRANS PPBODHI4 BEGIN 21 END BEGIN END BEGIN ACTION ~SetGlobal("AsylumPlot","GLOBAL",43) ActionOverride("vam1514b",ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE)) ActionOverride("vam1514a",ApplySpell(Myself,VAMPIRE_BAT_FORM_CHANGE))~ END // was escape area

// getting into the asylum via perth doesn't purge two journal entries
ADD_TRANS_ACTION PPCOWLED BEGIN 3 END BEGIN 0 END ~EraseJournalEntry(11681) EraseJournalEntry(11884)~

// removes Desharik XP exploit along with cut41f changes
REPLACE_ACTION_TEXT ~ppdesh~ ~AddXPObject(Player[1-6],38500)~ ~~

// in one branch, desharik not setting var of sending party to spellhold
ADD_TRANS_ACTION PPDESH BEGIN 18 END BEGIN 0 END ~SetGlobal("PPdeshSend","GLOBAL",1)~

// dace's apparition has nothing to say; using wrong flame strike if you're a dick
REPLACE_STATE_TRIGGER PPJOYE2 2 ~Global("JoyeMove","GLOBAL",2) !Global("Coffin1","AR1513",2)~ // removes !Global("deadjoye","AR1513",1)
ALTER_TRANS PPJOYE2 BEGIN 7 END BEGIN 0 END BEGIN ACTION ~ReallyForceSpell(Myself,DACE_FLAME)~ END // replaces generic cleric flame strike that he was casting

//fixes infinite XP exploit on Spellhold bug
EXTEND_BOTTOM PPRIDD 3
  IF ~Global("openHead","AR1512",1)~ THEN DO ~Unlock("HeadDoor") OpenDoor("HeadDoor")~ EXIT // failsafe
END

// was 9 > 14, now 9 > 13 > 14 for better reply
ALTER_TRANS PPSAEM2 BEGIN 9 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 13~ END

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

// two paths from Sime's dialogue; one has a SaveGame(0) and the other does not
ADD_TRANS_ACTION PPSIME
BEGIN 4 END
BEGIN 0 END
~SaveGame(0)~

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

ADD_TRANS_ACTION QUAYLEM
BEGIN 0 END
BEGIN 0 END
~SetNumTimesTalkedTo(1)~

// raelis not always setting var that she has the gem; this results in wrong kick out dialogue for Haer'Dalis
ADD_TRANS_ACTION RAELIS BEGIN 5 31 END BEGIN END ~SetGlobal("RaelisHasGem","GLOBAL",1)~

// player can get trapped in planar prison if they do something stupid like kick HD during the conduit summoning
ADD_STATE_TRIGGER     RAELIS 17 ~AreaCheckObject("AR0516","Haerdalis")~ // make sure HD is present, too
REPLACE_STATE_TRIGGER RAELIS 71 ~Global("PlanarPrison","GLOBAL",1) AreaCheck("AR0516")~ // removed dead HD check; this is now a failsafe option

// reedle discusss solved murders as if they're ongoing
ADD_TRANS_TRIGGER REEDLE 3 ~Global("MurdersSolved","GLOBAL",0)~ DO 0
ADD_TRANS_TRIGGER REEDLE 7 ~Global("MurdersSolved","GLOBAL",0)~ DO 0

// wrong answer to statement
ALTER_TRANS RGRWLF01 BEGIN 6 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 18~ END

// should always get XP for defeating avatar; XP only present on 1/3 replies
ADD_TRANS_ACTION RIFTG03 BEGIN 0 END BEGIN 1 2 END ~AddexperienceParty(25750)~

// diseased one multi-saving grace and xp exploit fix
ADD_STATE_TRIGGER ~RIFTM01~ 32 ~Global("CDNoRepeat","AR0203",0)~
ADD_TRANS_ACTION RIFTM01
BEGIN 32 END
BEGIN END
~SetGlobal("CDNoRepeat","AR0203",1)~

//You can ask Roger about the gong again and again; put an end to that (Wisp)
ADD_TRANS_TRIGGER roger 0 ~Global("flRogerGong","LOCALS",0)~ 1 DO 3
ADD_TRANS_TRIGGER roger 4 ~Global("flRogerGong","LOCALS",0)~ 7 24 27 DO 2
ADD_TRANS_TRIGGER roger 8 ~Global("flRogerGong","LOCALS",0)~ 9 DO 1
ADD_TRANS_ACTION roger BEGIN 12 END BEGIN 0 END ~SetGlobal("flRogerGong","LOCALS",1)~

// next block is a big set of fixes for the rumor dialogues
REPLACE ~RUMORA~
  IF WEIGHT #0 ~RandomNum(5,1)
  !Dead("KALAHILLUSION")~ 0
   SAY #33917
   IF ~~ EXIT
  END
  
  IF WEIGHT #13 ~RandomNum(8,1)~ 1
   SAY #33918
   IF ~~ EXIT
  END
  
  IF WEIGHT #14 ~RandomNum(8,2)~ 2
   SAY #33919
   IF ~~ EXIT
  END
  
  IF WEIGHT #15 ~RandomNum(8,3)~ 3
   SAY #33921
   IF ~~ EXIT
  END
  
  IF WEIGHT #1 ~RandomNum(5,2)
  GlobalLT("BEHOLDERPLOT","GLOBAL",2)~ 4
   SAY #33925
   IF ~~ EXIT
  END
  
  IF WEIGHT #16 ~RandomNum(4,1)
  !Dead("ARAN")
  GlobalLT("LASSALVAMPIRES","GLOBAL",3)~ 5
   SAY #33926
   IF ~~ EXIT
  END
  
  IF WEIGHT #17 ~RandomNum(4,2)
  !Dead("ARAN")
  GlobalLT("LASSALVAMPIRES","GLOBAL",3)~ 6
   SAY #32080
   IF ~~ EXIT
  END
  
  IF WEIGHT #18 ~RandomNum(8,4)~ 7
   SAY #33929
   IF ~~ EXIT
  END
  
  IF WEIGHT #19 ~RandomNum(8,5)~ 8
   SAY #33931
   IF ~~ EXIT
  END
  
  IF WEIGHT #20 ~RandomNum(5,3)
  Global("PCSPHERE","GLOBAL",0)~ 9
   SAY #33932
   IF ~~ EXIT
  END
  
  IF WEIGHT #2 ~RandomNum(5,4)
  Global("MURDERSSOLVED","GLOBAL",0)~ 10
   SAY #33933
   IF ~~ EXIT
  END
  
  IF WEIGHT #21 ~RandomNum(8,6)~ 11
   SAY #33934
   IF ~~ EXIT
  END
  
  IF WEIGHT #22 ~RandomNum(8,7)~ 12
   SAY #33939
   IF ~~ EXIT
  END
  
  IF WEIGHT #23 ~RandomNum(8,8)~ 13
   SAY #33940
   IF ~~ EXIT
  END
  
  IF WEIGHT #24 ~RandomNum(4,3)
  !Dead("ARAN")
  GlobalLT("LASSALVAMPIRES","GLOBAL",3)~ 14
   SAY #33941
   IF ~~ EXIT
  END
  
  IF WEIGHT #8 ~RandomNum(10,1)
  GlobalGT("LASSALVAMPIRES","GLOBAL",2)~ 15
   SAY #33948
   IF ~~ EXIT
  END
  
  IF WEIGHT #9 ~RandomNum(10,2)
  GlobalGT("LASSALVAMPIRES","GLOBAL",2)~ 16
   SAY #33950
   IF ~~ EXIT
  END
  
  IF WEIGHT #10 ~RandomNum(10,3)
  GlobalGT("LASSALVAMPIRES","GLOBAL",2)~ 17
   SAY #33951
   IF ~~ EXIT
  END
  
  IF WEIGHT #11 ~RandomNum(10,4)
  GlobalGT("LASSALVAMPIRES","GLOBAL",2)~ 18
   SAY #33952
   IF ~~ EXIT
  END
  
  IF WEIGHT #12 ~RandomNum(10,5)
  GlobalGT("LASSALVAMPIRES","GLOBAL",2)~ 19
   SAY #33953
   IF ~~ EXIT
  END
END

// This just explicitly sets the weight of every top-level state, instead of letting WeiDU pick the weights
SET_WEIGHT ~RUMORA~ 0 #0
SET_WEIGHT ~RUMORA~ 1 #15
SET_WEIGHT ~RUMORA~ 2 #16
SET_WEIGHT ~RUMORA~ 3 #17
SET_WEIGHT ~RUMORA~ 4 #1
SET_WEIGHT ~RUMORA~ 5 #18
SET_WEIGHT ~RUMORA~ 6 #19
SET_WEIGHT ~RUMORA~ 7 #20
SET_WEIGHT ~RUMORA~ 8 #21
SET_WEIGHT ~RUMORA~ 9 #13
SET_WEIGHT ~RUMORA~ 10 #2
SET_WEIGHT ~RUMORA~ 11 #22
SET_WEIGHT ~RUMORA~ 12 #23
SET_WEIGHT ~RUMORA~ 13 #24
SET_WEIGHT ~RUMORA~ 14 #14
SET_WEIGHT ~RUMORA~ 15 #8
SET_WEIGHT ~RUMORA~ 16 #9
SET_WEIGHT ~RUMORA~ 17 #10
SET_WEIGHT ~RUMORA~ 18 #11
SET_WEIGHT ~RUMORA~ 19 #12
SET_WEIGHT ~RUMORA~ 20 #3
SET_WEIGHT ~RUMORA~ 21 #4
SET_WEIGHT ~RUMORA~ 22 #5
SET_WEIGHT ~RUMORA~ 23 #6
SET_WEIGHT ~RUMORA~ 24 #7

REPLACE ~RUMORI~
  IF ~RandomNum(6,1)
  Global("VILLAGESAVED","GLOBAL",0)
  Global("OGREALLIANCE","GLOBAL",0)~ 0
   SAY #33959
   IF ~~ EXIT
  END
  
  IF ~RandomNum(2,1)
  Global("OGREALLIANCE","GLOBAL",1)~ 1
   SAY #33960
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,2)
  Global("VILLAGESAVED","GLOBAL",0)~ 2
   SAY #33961
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,1)
  Global("VILLAGESAVED","GLOBAL",1)~ 3
   SAY #33963
   IF ~~ EXIT
  END
  
  IF ~RandomNum(3,1)
  !Global("RANGERPROTECTOR","GLOBAL",4)~ 4
   SAY #33964
   IF ~~ EXIT
  END
  
  IF ~RandomNum(3,2)
  Global("RANGERPROTECTOR","GLOBAL",0)~ 5
   SAY #33965
   IF ~~ EXIT
  END
  
  IF ~True()~ 6
   SAY #33966
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,3)
  Global("VILLAGESAVED","GLOBAL",0)~ 7
   SAY #33968
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,2)
  Global("VILLAGESAVED","GLOBAL",1)~ 8
   SAY #33969
   IF ~~ EXIT
  END
END

REPLACE ~RUMORP~
  IF ~RandomNum(6,1)~ 0
   SAY #33977
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,2)~ 1
   SAY #33978
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,3)~ 2
   SAY #33980
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,4)~ 3
   SAY #33982
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,5)~ 4
   SAY #33983
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,6)~ 5
   SAY #33984
   IF ~~ EXIT
  END
  
  IF ~RandomNum(2,1)
  !Dead("PIRMUR01")~ 6
   SAY #33985
   IF ~~ EXIT
  END
END

REPLACE ~RUMORT~
  IF ~RandomNum(8,1)
  !Dead("TRFUED01")
  !Dead("TRFUED05")~ 0
   SAY #33970
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,1)~ 1
   SAY #33971
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,1)
  !Dead("CEFALD01")~ 2
   SAY #33972
   IF ~~ EXIT
  END
  
  IF ~RandomNum(8,2)
  Dead("CEFALD01")~ 3
   SAY #33973
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,2)
  !Dead("TRRAK01")~ 4
   SAY #33974
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,2)~ 5
   SAY #33975
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,3)~ 6
   SAY #33976
   IF ~~ EXIT
  END
  
  IF ~RandomNum(4,4)~ 7
   SAY #58801
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,3)
  Global("GENIESGONE","GLOBAL",0)~ 8
   SAY #58802
   IF ~~ EXIT
  END
  
  IF ~RandomNum(8,3)
  Global("GENIESGONE","GLOBAL",1)~ 9
   SAY #58803
   IF ~~ EXIT
  END
  
  IF ~RandomNum(6,4)
  Global("TANNEREXPOSED","GLOBAL",1)~ 10
   SAY #58804
   IF ~~ EXIT
  END
  
  IF ~RandomNum(8,4)
  !InParty("MAZZY")~ 11
   SAY #58805
   IF ~~ EXIT
  END
END

REPLACE ~RUMORU~
  IF ~RandomNum(7,1)~ 0
   SAY #58772
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,2)~ 1
   SAY #58773
   IF ~~ EXIT
  END
  
  IF ~RandomNum(2,1)
  GlobalGT("MATRONJOB","GLOBAL",0)~ 2
   SAY #58774
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,3)~ 3
   SAY #58775
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,4)~ 4
   SAY #58776
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,5)~ 5
   SAY #58777
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,6)~ 6
   SAY #58778
   IF ~~ EXIT
  END
  
  IF ~RandomNum(3,1)
  !Dead("JARLICH")~ 7
   SAY #58779
   IF ~~ EXIT
  END
  
  IF ~RandomNum(7,7)~ 8
   SAY #58780
   IF ~~ EXIT
  END
  
  IF ~RandomNum(3,1)
  Dead("JARLICH")~ 9
   SAY #58781
   IF ~~ EXIT
  END
END

SET_WEIGHT ~RUMORI~ 0 #0
SET_WEIGHT ~RUMORI~ 1 #5
SET_WEIGHT ~RUMORI~ 2 #1
SET_WEIGHT ~RUMORI~ 3 #3
SET_WEIGHT ~RUMORI~ 4 #7
SET_WEIGHT ~RUMORI~ 5 #6
SET_WEIGHT ~RUMORI~ 6 #8
SET_WEIGHT ~RUMORI~ 7 #2
SET_WEIGHT ~RUMORI~ 8 #4

SET_WEIGHT ~RUMORP~ 0 #1
SET_WEIGHT ~RUMORP~ 1 #2
SET_WEIGHT ~RUMORP~ 2 #3
SET_WEIGHT ~RUMORP~ 3 #4
SET_WEIGHT ~RUMORP~ 4 #5
SET_WEIGHT ~RUMORP~ 5 #6
SET_WEIGHT ~RUMORP~ 6 #0

SET_WEIGHT ~RUMORT~ 0 #4
SET_WEIGHT ~RUMORT~ 1 #8
SET_WEIGHT ~RUMORT~ 2 #0
SET_WEIGHT ~RUMORT~ 3 #1
SET_WEIGHT ~RUMORT~ 4 #7
SET_WEIGHT ~RUMORT~ 5 #9
SET_WEIGHT ~RUMORT~ 6 #10
SET_WEIGHT ~RUMORT~ 7 #11
SET_WEIGHT ~RUMORT~ 8 #2
SET_WEIGHT ~RUMORT~ 9 #3
SET_WEIGHT ~RUMORT~ 10 #5
SET_WEIGHT ~RUMORT~ 11 #6

SET_WEIGHT ~RUMORU~ 0 #3
SET_WEIGHT ~RUMORU~ 1 #4
SET_WEIGHT ~RUMORU~ 2 #0
SET_WEIGHT ~RUMORU~ 3 #5
SET_WEIGHT ~RUMORU~ 4 #6
SET_WEIGHT ~RUMORU~ 5 #7
SET_WEIGHT ~RUMORU~ 6 #8
SET_WEIGHT ~RUMORU~ 7 #1
SET_WEIGHT ~RUMORU~ 8 #9
SET_WEIGHT ~RUMORU~ 9 #2

// rylock's escapearea() class need to use movetopoint so he can go inside
REPLACE_ACTION_TEXT ~rylock~ ~EscapeArea()~ ~MoveToPoint([1367.2956]) DestroySelf()~

// adds SG for ToB spectator to check
ADD_TRANS_ACTION SAHBEH01
BEGIN 0 END
BEGIN END
~SetGlobal("D0SpokenSpectator","GLOBAL",1)~

// response only appropriate for player1
ADD_STATE_TRIGGER SAHKNG01 62 ~InPartySlot(LastTalkedToBy,0)~

// prevent dupe CoC items; see also ar2300.bcs, sahkng01.bcs, sahkng02.bcs, sahkng02.cre, sahpr4.cre, sahtreas.bcs, string sets
REPLACE_ACTION_TEXT SAHPR2 ~GiveItemCreate("key24",LastTalkedToBy,0,0,0)~ ~~
REPLACE_ACTION_TEXT SAHPR2 ~GiveItemCreate("miscbi",LastTalkedToBy,0,0,0)~ ~~
EXTEND_BOTTOM SAHKNG01 81
  IF ~Global("CDRoLMGone","AR2300",1)~ THEN DO ~AddXPObject(Player1,58500)
                                                AddXPObject(Player2,58500)
                                                AddXPObject(Player3,58500)
                                                AddXPObject(Player4,58500)
                                                AddXPObject(Player5,58500)
                                                AddXPObject(Player6,58500)
                                                ActionOverride("treasury",GiveItem("brac19",Player1)) // Gauntlets of Crushing
                                                GiveItem("miscbi",LastTalkedToBy) // Magical Rope
                                                GiveGoldForce(2000)
                                                SetGlobal("LeavingSahuagin","AR2300",1)
                                                EscapeArea()~ EXIT
END

// gracie at sea's bounty shouldn't flirt with edwina or mention her beard
ADD_STATE_TRIGGER ~SBWENCH~ 6 ~Gender("Edwin",MALE)~

// shouldn't be able to ask jerlia about ore if you've already given sarles real/fake ore
ADD_STATE_TRIGGER SCJERLIA 38 ~OR(2) Global("SarlesPissed","GLOBAL",1) GlobalGT("SculptorPlot","GLOBAL",3)~

// allow cleric-rangers to acquire temple stronghold; see ar0900.bcs, ar0902.bcs, arval.bcs, bharval.dlg, borinall.dlg, travin.dlg
REPLACE_STATE_TRIGGER SCSAIN 31
~OR(7)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
  Global("JoinLathander","GLOBAL",1)
InPartySlot(LastTalkedToBy,0)
Global("StealingPlot","GLOBAL",0)
Global("SculptorDone","GLOBAL",1)~

ADD_TRANS_TRIGGER SCSAIN 38 ~!Class(Player1,CLERIC_RANGER)~ DO 4 5

ALTER_TRANS SCSAIN BEGIN 38 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)~
END

// player reply about commission goes to comment about nobles; this reply appropriately talks about gold offered instead
ALTER_TRANS SCSARLES BEGIN 2 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 7~ END // originally went to 5

// telwyn HoG exploit fix, pt 1/2 (see ar0901.bcs)
REPLACE_ACTION_TEXT ~sctelwyn~ ~GiveItem("HELM03",LastTalkedToBy)~ ~GiveItemCreate("HELM03",LastTalkedToBy,0,0,0)~

// same question from 2 leads here
ALTER_TRANS SEWERM1 BEGIN 9 END BEGIN 1 END BEGIN ~EPILOGUE~ ~GOTO 6~ END // originally went to 2, where you could ask the identical question again

// other "i'm leaving " replies lead here
ALTER_TRANS SEWERM1 BEGIN 19 END BEGIN 3 END BEGIN ~EPILOGUE~ ~GOTO 22~ END // originally went to 21

// enables container in shade lord dungeon; see ar1401.bcs
ADD_TRANS_ACTION SHAAVA01
BEGIN 19 END
BEGIN END
~DialogueInterrupt(FALSE)
ContainerEnable("CONTAINER2",TRUE)
CreateVisualEffect("SPHOLY",[861.283])
SetInterrupt(FALSE)
Wait(1)
DestroySelf()~

// not all branches of frenedan's dialogue setting journal entry
ALTER_TRANS SHAPE BEGIN 7    END BEGIN 0 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END
ALTER_TRANS SHAPE BEGIN 6 11 END BEGIN 1 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END
ALTER_TRANS SHAPE BEGIN 9    END BEGIN 2 END BEGIN "UNSOLVED_JOURNAL" ~#34108~ END

// arnolius is using wrong area reference in his variables
REPLACE_TRIGGER_TEXT ~shop02~ ~,"AR0700",~ ~,"AR0706",~
REPLACE_ACTION_TEXT  ~shop02~ ~,"AR0700",~ ~,"AR0706",~

// Maheer the blacksmith in Waukeen's Promenade should only take a single diamond/beljuril for upgrading the Horn of Valhalla (aVENGER)
REPLACE_ACTION_TEXT ~shop03~ ~TakePartyItem("misc42")~ ~TakePartyItemNum("misc42",1)~ // Diamond
REPLACE_ACTION_TEXT ~shop03~ ~TakePartyItem("misc6z")~ ~TakePartyItemNum("misc6z",1)~ // Beljuril

// you can ask morsa about how you fare as guildmaster; this change allows you to do so on the first conversation, too
ALTER_TRANS SHTH04 BEGIN 1 END BEGIN 0 END BEGIN ~EPILOGUE~ ~GOTO 2~ END // originally just exited here

// fixes Joster's opening line
REPLACE SHTH05
  IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
   SAY #32294
   IF ~Global("TalkedToJoster","GLOBAL",0)~ THEN REPLY #32538 DO ~SetGlobal("TalkedToJoster","GLOBAL",1)~ GOTO 1
   IF ~Global("TalkedToJoster","GLOBAL",0)~ THEN REPLY #32819 DO ~SetGlobal("TalkedToJoster","GLOBAL",1)~ GOTO 2
   IF ~!Global("TalkedToJoster","GLOBAL",0)~ THEN GOTO 3
  END
END

// not paying thieves guild quota fix; see also ar0322.bcs, baldur.bcs, joster.bcs
ADD_STATE_TRIGGER SHTHLT01 1 ~Global("PGFailed","GLOBAL",0)~ 143 144

// avatar of rilifane xp exploit fix; see also sustatue.bcs
ADD_TRANS_ACTION SUAVATAR
BEGIN 0 END
BEGIN 0 END
~TakePartyItemAll("miscb1")
TakePartyItemAll("miscb2")
TakePartyItemAll("miscb3")
DestroyItem("miscb1")
DestroyItem("miscb2")
DestroyItem("miscb3")~

// suppress dupe replies in consecutive states
ADD_TRANS_ACTION SUDEMIN BEGIN 2 END BEGIN 0 1 2 END ~SetGlobal("CDreplies","LOCALS",1)~
EXTEND_BOTTOM SUDEMIN 6
  IF ~Global("CDreplies","LOCALS",1)~ THEN GOTO 7
END

// bad trigger makes it hard to shut up Lilarcor
REPLACE_TRIGGER_TEXT ~sw2h14~ ~Alignment(Player1,MASK_LAWFUL)~ ~~
REPLACE_TRIGGER_TEXT ~sw2h14~ ~!InventoryFull(Player1)~ ~~

// shouldn't get 'talos as well served' journal entry when you get kicked out
ALTER_TRANS TALVILON BEGIN 34 END BEGIN 2 END BEGIN "SOLVED_JOURNAL" ~~  END

// tanner xp exploit
REPLACE_ACTION_TEXT ~tanner~ ~AddexperienceParty(23250)~ ~DialogueInterrupt(0)~
REPLACE_ACTION_TEXT ~tanner~ ~MoveToPoint(\[274\.276\])~ ~MoveToPoint([274.276]) AddexperienceParty(23250) Enemy() SetInterrupt(0)~
REPLACE_ACTION_TEXT ~tanner~ ~SetInterrupt(0)[ %TAB%%%LNL%%MNL%%WNL%]+Enemy()~ ~SetInterrupt(0)~ // cosmetic cleanup

// wrong variable name
REPLACE_TRIGGER_TEXT ~TASSA~ ~"TalkedPelanna"~ ~"TalkedToPelanna"~

// if player initiates dialogue with terrece at the gov't district, terrece will initiate later in the plaoyer confrontation
ADD_TRANS_ACTION TERRECE BEGIN 0 END BEGIN END ~SetGlobal("TerreceSpawn","GLOBAL",3)~

// multi-ring of the ram exploit, see tolger.bcs
REPLACE_ACTION_TEXT ~tolger~ ~GiveItemCreate("ring33",LastTalkedToBy,1,0,0)~ ~GiveItem("ring33",LastTalkedToBy)~

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

// allow cleric-rangers to acquire temple stronghold; see ar0900.bcs, ar0902.bcs, arval.bcs, bharval.dlg, borinall.dlg, scsain.dlg
ALTER_TRANS TRAVIN BEGIN 1 4 END BEGIN 2 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Alignment(Player1,MASK_GOOD)~
END

// trademeet militia wizard 'no valid links' dialogue fix 
REPLACE_STATE_TRIGGER TRFUED11 0
~Global("FuedTalk","AR2010",0)~

// adds one more line, routes 15 > 16 instead of just 16
ALTER_TRANS TRGRD03 BEGIN 4 END BEGIN 2 3 END BEGIN ~EPILOGUE~ ~GOTO 15~ END
ALTER_TRANS TRGRD03 BEGIN 15 END BEGIN END BEGIN ~EPILOGUE~ ~GOTO 16~ END

// raissia double xp exploit
ADD_TRANS_ACTION ~trskin01~
BEGIN 19 END
BEGIN END
~SetInterrupt(FALSE) DialogueInterrupt(FALSE)~

// skin dancer drops skin at fixed point instead of at his death point; see also trskin03.bcs
REPLACE_ACTION_TEXT ~TRSKIN03~ ~\(DropItem("MISC79",\[\)[0-9]+\.[0-9]+\(\])\)~ ~\1-1.-1\2~ // change coords to -1, -1

// uder mordin shouldn't hand out finished quests
ADD_STATE_TRIGGER UDDUER02 4 ~Global("makeMage","AR2100",0)~
ADD_STATE_TRIGGER UDDUER02 5 ~Global("makeMage","AR2100",0)~

// removes exploit from talking to the slave leader in Ust Natha repeatedly
ADD_STATE_TRIGGER ~UDILSLA2~ 13 ~Global("ByeByeSlaves","AR2400",0)~

// deactivate timer for meeting mother ardulace
ADD_TRANS_ACTION UDPHAE01
BEGIN 115 END
BEGIN 0 END
~SetGlobal("udPhaTimerOn","GLOBAL",0)~

// adds trigger to Phaere (unresponsive eye tyrant)
ADD_STATE_TRIGGER ~UDPHAE01~ 49 ~Global("udMoveToBeholder","GLOBAL",2)~

// mother can disappear if not jumped to new location
ALTER_TRANS UDPHAE01 BEGIN 125 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~AddXPObject(Player1,22000)
AddXPObject(Player2,22000)
AddXPObject(Player3,22000)
AddXPObject(Player4,22000)
AddXPObject(Player5,22000)
AddXPObject(Player6,22000)
SetGlobal("PhaereJob","GLOBAL",9)
SetGlobal("udPhaTimerOn","GLOBAL",1)
SetGlobalTimer("udPhaTimer","GLOBAL",400)
SetGlobal("udDrowPlot","GLOBAL",10)
CreateVisualEffectObject("SPDIMNDR","ARDULACE")
ActionOverride("ARDULACE",JumpToPoint([516.1142]))
EscapeAreaMove("AR2204",743,1008,0)~
END

// returning the silver blade always ended badly with simyaz - impossible friendly trigger, plus covered by always-true hostile branch
ADD_TRANS_TRIGGER UDSIMYAZ 53 ~!ReactionGT(LastTalkedToBy,FRIENDLY_LOWER)~ DO 1
ALTER_TRANS UDSIMYAZ BEGIN 53 END BEGIN 0 END BEGIN TRIGGER ~~ END

// interrupting solaufein while pulling mind flayers out of the astral breaks everything; see also udsola01.bcs
ALTER_TRANS udsola01 BEGIN 46 END BEGIN 0 END BEGIN ACTION ~SetInterrupt(FALSE) DialogInterrupt(FALSE) SetGlobal("cd_must_summon","LOCALS",1)~ END

// solaufein should be setting variables based on what you tell him so his later convo is appropriate
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 3 END ~SetGlobal("SolaufeinLikes","GLOBAL",1)~ // don't tell him anything > state 146 later
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 1 END ~SetGlobal("SolaufeinLikes","GLOBAL",2)~ // tell him you're a surfacer > state 154 later, branch 0
ADD_TRANS_ACTION UDSOLA01 BEGIN 135 END BEGIN 2 END ~SetGlobal("SolaufeinLikes","GLOBAL",3)~ // surfacer & you're looking for eggs  > state 154 later, branch 1

// closes vithal multi-xp exploit
ADD_STATE_TRIGGER UDVITH 41 ~Global("airgate","LOCALS",0)~

// restore missing interjection
ALTER_TRANS UHINN02 BEGIN  9 END BEGIN 0 END BEGIN "EPILOGUE" ~EXTERN UHINN01 21~ END
EXTEND_BOTTOM UHINN01 20
  IF ~!Dead("uhinn02") See("uhinno2")~ EXTERN ~UHINN02~ 9
END

// umar hills boys don't always take all three swords
REPLACE_ACTION_TEXT  ~uhkid01~ ~TakePartyItemNum("MISC97",3)~ ~TakePartyItem("MISC97")~ // take all ale
REPLACE_ACTION_TEXT  ~uhkid01~ ~TakePartyItem("SW1H01")~ ~TakePartyItemNum("SW1H01",3)~ // but only three bastard swords
REPLACE_TRIGGER_TEXT ~uhkid01~ ~NumItemsParty("SW1H01",3)~ ~NumItemsPartyGT("SW1H01",2)~ // Dirbert won't take swords from party if they don't have exactly 3 (concept by Icendoan, but recoded by DavidW)

// add SG so Madulf has proper array of responses
ADD_TRANS_ACTION UHMAY01
BEGIN 71 END
BEGIN 0 END
~SetGlobal("Lloydy","GLOBAL",1)~

// blank exit trigger just cuts dialogue short; has three perfectly valid responses
ADD_TRANS_TRIGGER UHMAY01 117 ~!Global("MinisterScold","LOCALS",0)~ DO 1

// Valygar who? response now routed properly
ADD_TRANS_TRIGGER VALRAN01 0 ~Global("HiredByCowled","GLOBAL",1)~ DO 2
EXTEND_BOTTOM VALRAN01 0
IF ~Global("HiredByCowled","GLOBAL",0)~ THEN REPLY #19259 GOTO 2
END

// add tracking variable to meeting valygar...
ADD_TRANS_ACTION VALYGAR
BEGIN 0 END
BEGIN END
~SetGlobal("CDMetBigV","GLOBAL",1)~
// ... so that you can no longer ask about how to find him
ADD_TRANS_TRIGGER LLARSH 0 ~Global("CDMetBigV","GLOBAL",0)~ DO 1 2
ADD_TRANS_TRIGGER LLARSH 2 ~Global("CDMetBigV","GLOBAL",0)~ DO 0 1

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

// viconia shouldn't be burned at stake if she's been freed
ADD_STATE_TRIGGER ~VICG1~ 7 ~!Global("ViconiaFree","AR1000",1)~

// turning viconia hostile prevents her death at the stake; see also viconia.bcs vicg1.dlg, victown1.dlg, viconi.dlg
// viconiadeath != 0 prompts her override script to kill her with the usual cosmetics
EXTEND_BOTTOM VICG1 7 // basically intercepts transition 0 for hostile viconia
  IF ~OR(2)
       !NumDead("vicg",0) 
       !NumDead("victowna",0) 
      Allegiance("viconia",ENEMY)~ THEN DO ~SetGlobal("ViconiaDeath","AR1000",1)~ EXIT
END

// move death to area script, these just set variables now
ADD_TRANS_ACTION VICG1    BEGIN 7 END BEGIN 0 END ~SetGlobal("ViconiaDeath","AR1000",1)~
ADD_TRANS_ACTION VICTOWN1 BEGIN 2 END BEGIN 0 END ~SetGlobal("ViconiaDeath","AR1000",1)~
ALTER_TRANS VICONI BEGIN 11 END BEGIN END BEGIN ACTION ~SetGlobal("ViconiaDeath","AR1000",1)~ END

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

// Romance interests can comment on PhaereInnuendo in chapter 6 if they were not in the party during chapter 5 (the bigg) (see aerie.bcs, aeriej.dlg, jaheira.bcs, jaheiraj.dlg viconia.bcs, viconij.dlg)
ADD_STATE_TRIGGER ~VICONIJ~ 97 ~Global("Chapter","GLOBAL",5)~ 106 108

// male/female specific lines not properly delineated here
ADD_TRANS_TRIGGER VICONIJ 112 ~Gender(Player1,FEMALE)~ DO 0
ADD_TRANS_TRIGGER VICONIJ 112 ~Gender(Player1,MALE)~ DO 2

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

// viekang in trademeet initiates dialogue twice; see viekang.bcs
ADD_TRANS_ACTION VIEKANG
BEGIN 5 END
BEGIN END
~SetGlobal("ViekangSeesPC","LOCALS",1)~

// helpful folks disappear before they can actually help; see also vvhelp.cre, vvpriest.cre, ar0700.are
ALTER_TRANS VVHELP BEGIN 7 END BEGIN 0 END BEGIN ~ACTION~ ~EscapeArea()~ END

// because del & pals spawn ofscreen, they sometimes need a little help finding sansuki
ALTER_TRANS VVSANSUK BEGIN 1 END BEGIN END BEGIN ACTION ~CreateCreatureOffScreen("VVDEL",0) // Del
                                                         CreateCreatureOffScreen("VVMALE1",0) // Vampire
                                                         CreateCreatureOffScreen("VVMALE2",0) // Vampire
                                                         ActionOverride("VVDEL",MoveToObject("VVSANSUK"))
                                                         ActionOverride("VVMALE1",MoveToObject("VVSANSUK"))
                                                         ActionOverride("VVMALE2",MoveToObject("VVSANSUK"))~ END

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

// extra line in Count Claylan-Debutante Alicia banter
ALTER_TRANS WCUST02 BEGIN 0 END BEGIN 0 END BEGIN ~EPILOGUE~ ~EXTERN WCUST01 1~ END // used to just exit here

// allow waukeen priestess of ilmater to accept Yoshikun's heart
EXTEND_BOTTOM WILMAT 0
  IF ~PartyHasItem("miscbu")~ THEN REPLY @143 GOTO CDYoshiHeart
END

APPEND WILMAT
  IF ~~ THEN BEGIN CDYoshiHeart SAY #58238
    IF ~~ THEN REPLY #58240 GOTO CDYoshiHeart2
    IF ~~ THEN REPLY #58241 GOTO CDYoshiHeart2
  END

  IF ~~ THEN BEGIN CDYoshiHeart2 SAY #58242 = #58243
    IF ~~ THEN DO ~TakePartyItem("miscbu")~ GOTO CDYoshiHeart3
  END
  
  IF ~~ THEN BEGIN CDYoshiHeart3 SAY #58244
    IF ~~ THEN DO ~AddexperienceParty(200000)~ EXIT
  END
END

// wish for riches doesn't get 2000 gold due to incorrect action
REPLACE_ACTION_TEXT ~wish~ ~GivePartyGold(2000)~ ~GiveGoldForce(2000)~

// if wish cast by non-party member (i.e. simulcrum or projected image), scroll to start quest would be lost
REPLACE_ACTION_TEXT WISH ~GiveItemCreate("wishscrl",LastTalkedToBy,0,0,0)~ ~GiveItemCreate("wishscrl",Player1,0,0,0)~

// prevent Yoshimo telling you to see Renal when you already have
ADD_STATE_TRIGGER YOSHJ 129 ~Global("TalkedToRenal","GLOBAL",0)~

// restore one more line for Yoshimo rejoining
ALTER_TRANS YOSHP BEGIN 4 END BEGIN 1 END BEGIN ~ACTION~ ~~ ~EPILOGUE~ ~GOTO 1~ END // delete joinparty from 4, as 1 already has it