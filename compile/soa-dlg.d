// this block of trigger fixes and the following block of action fixes eliminates all reported
// compile errors in the game, including legacy errors from BG
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aataqah$\)\|\(^trgyp03$\)~  ~Name(LastTalkedToBy,"\([a-z|A-Z|0-9]+\)")~ ~Name("\1",LastTalkedToBy)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^aeriej$\)\|\(^banomen$\)\|\(^minscj$\)\|\(^yoshj$\)~  ~AreaType(OUTSIDE)~ ~AreaType(OUTDOOR)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^amnise$\)\|\(^delorn$\)~ ~STATE_[CD]HA[MR][MR]ED~ ~STATE_CHARMED~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^dmark1$\)\|\(^kieres$\)~ ~True\(([0-9]+)\)?~ ~True()~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)~ ~InPartySlot(LastTalkedToBy,"Nalia")~ ~Name("Nalia",LastTalkedToBy)~
REPLACE_TRIGGER_TEXT_REGEXP ~\(^idryad[1-3]$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~
REPLACE_TRIGGER_TEXT ~bandic~   ~NumDeadGT("Bandcap"4)~ ~NumDeadGT("Bandcap",4)~
REPLACE_TRIGGER_TEXT ~banomen~  ~\bReactionGT(Player1,NEUTRAL_UPPER))~ ~ReactionGT(Player1,NEUTRAL_UPPER)~
REPLACE_TRIGGER_TEXT ~breg01~   ~CheckStat\(L\|G\)T(\("?[a-z|A-Z|0-9]+"?\),\([A-Z][A-Z][A-Z]\),\([0-9]+\))~ ~CheckStat\1T(\2,\4,\3)~
REPLACE_TRIGGER_TEXT ~dmtown1~  ~RandomNum(4,1)1~ ~RandomNum(4,1)~
REPLACE_TRIGGER_TEXT ~edwinj~   ~IsValidForPartyDialog("Viconia)~ ~IsValidForPartyDialog("Viconia")~
REPLACE_TRIGGER_TEXT ~elgea~    ~("Korgan")!~ ~("Korgan")~
REPLACE_TRIGGER_TEXT ~fergus~   ~Global("FERGUS1","GLOBAL",2);~ ~Global("FERGUS1","GLOBAL",2)~
REPLACE_TRIGGER_TEXT ~ffactor1~ ~!Dead("HaerDalis)~ ~!Dead("HaerDalis")~
REPLACE_TRIGGER_TEXT ~firtrl01~ ~Dead(firorc01)~ ~Dead("firorc01")~
REPLACE_TRIGGER_TEXT ~flam7~    ~StateCheck(Myself,STATE_CHARMED);~ ~StateCheck(Myself,STATE_CHARMED)~
REPLACE_TRIGGER_TEXT ~friend~   ~CheckState(~ ~StateCheck(~
REPLACE_TRIGGER_TEXT ~fumin~    ~!Gabber("Nalia")~ ~!IsGabber("Nalia")~
REPLACE_TRIGGER_TEXT ~gorpel~   ~NumTimesTalkedTo()~ ~NumTimesTalkedTo(0)~
REPLACE_TRIGGER_TEXT ~ithtyl~   ~True();~ ~True()~
REPLACE_TRIGGER_TEXT ~jared~    ~ReactionGLT(LastTalkedToBy,NEUTRAL_UPPER)~ ~ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~
REPLACE_TRIGGER_TEXT ~kaish~    ~Dead(Karoug)~ ~Dead("Karoug")~
REPLACE_TRIGGER_TEXT ~lahl~     ~Random(~ ~RandomNum(~
REPLACE_TRIGGER_TEXT ~marcus~   ~HALFELF~ ~HALF_ELF~
REPLACE_TRIGGER_TEXT ~minern~   ~Global("SpokenToEmerson",0)~ ~Global("SpokenToEmerson","GLOBAL",0)~
REPLACE_TRIGGER_TEXT ~mgappr02~ ~PartyGoldGT(1999(~ ~PartyGoldGT(1999)~
REPLACE_TRIGGER_TEXT ~nobl10~   ~Reaction\([GL]\)T(\([A-Z|_]+\))~ ~Reaction\1T(LastTalkedToBy,\2)~
REPLACE_TRIGGER_TEXT ~noblem3~  ~NUETRAL_LOWER~ ~NEUTRAL_LOWER~
REPLACE_TRIGGER_TEXT ~obssol01~ ~!Class(Player,MAGE_ALL)~ ~!Class(Player1,MAGE_ALL)~
REPLACE_TRIGGER_TEXT ~ppdesh~   ~IsValidForPartyDialog\(ue\)?("YOSHIMO)~ ~IsValidForPartyDialog("YOSHIMO")~
REPLACE_TRIGGER_TEXT ~read4~    ~NumberOfTimesTalkedToGT(0)~ ~NumTimesTalkedToGT(0)~
REPLACE_TRIGGER_TEXT ~tamoko~   ~FRIENLY_LOWER~ ~FRIENDLY_LOWER~
REPLACE_TRIGGER_TEXT ~trthf02~  ~Class(LastTalkedToBy,"THIEF")~ ~Class(LastTalkedToBy,THIEF)~
REPLACE_TRIGGER_TEXT ~uddrow16~ ~Dead(\([a-z|A-Z|0-9]+\))~ ~StateCheck(\1,STATE_REALLY_DEAD)~
REPLACE_TRIGGER_TEXT ~uhinn01~  ~!Dead("uhinn02')~ ~!Dead("uhinn02")~

REPLACE_ACTION_TEXT_REGEXP ~\(^abela$\)\|\(^brevli$\)\|\(^deltan2?$\)\|\(^galken$\)\|\(^narlen$\)\|\(^quinn$\)\|\(^taerom$\)\|\(^tersus$\)\|\(^ulcast$\)~ ~GiveItemCreate(\("?[a-z|A-Z|0-9]+"?\),\("?[a-z|A-Z|0-9]+"?\))~ ~GiveItemCreate(\1,\2,1,1,1)~
REPLACE_ACTION_TEXT_REGEXP ~\(^aerie$\)\|\(^kalah2$\)~  ~StartDialogueNoSet()~ ~StartDialogueNoSet([PC])~
REPLACE_ACTION_TEXT_REGEXP ~^drstatu[1-3]$~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",StartDialogueNoSet(Player1)+~ ~ActionOverride("\1",StartDialogueNoSet(Player1))~
REPLACE_ACTION_TEXT_REGEXP ~\(^hamek$\)\|\(^mekrath$\)~ ~Set(~ ~SetGlobal(~
REPLACE_ACTION_TEXT_REGEXP ~\(^keldorj$\)\|\(^udvith$\)~ ~SetGlobalTimer("?\([a-z|A-Z|0-9]+\)"?,"?\([a-z|A-Z|0-9]+\)"?,"?\([A-Z|_|0-9]+\)"?)~ ~SetGlobalTimer("\1","\2",\3)~
REPLACE_ACTION_TEXT_REGEXP ~\(^kielpc$\)\|\(^ppireni1$\)~ ~Open\(Door\)?("?\([A-Z|a-z|0-9]+\)"?)~ ~OpenDoor("\2")~
REPLACE_ACTION_TEXT_REGEXP ~\(^kieres$\)\|\(^ulf$\)~  ~ActionOverride(\([a-z|A-Z|0-9|"]+\),AttackReevaluate(\([a-z|A-Z|0-9|"|(|)]+\),\([0-9]+\))+~ ~ActionOverride(\1,AttackReevaluate(\2,\3)) ~
REPLACE_ACTION_TEXT_REGEXP ~\(^kpcapt02$\)\|\(^kpmaid01$\)\|\(^kprang02$\)~ ~ActionOverride("\([a-z|A-Z|0-9]+\)",MoveToPoint(\[\([0-9]+\)\.\([0-9]+\)\])*~ ~ActionOverride("\1",MoveToPoint([\2.\3]))~
REPLACE_ACTION_TEXT_REGEXP ~^obshal0[13]$~ ~ChangeEnemyAlly("obshal0\([13]\)",\[ENEMY\])~ ~ChangeEnemyAlly("obshal0\1",ENEMY)~
REPLACE_ACTION_TEXT_REGEXP ~^pheirk\(as\)?$~ ~True()~ ~~
REPLACE_ACTION_TEXT_REGEXP ~\(^messed$\)\|\(^rashad$\)~ ~Die()~ ~Kill(Myself)~
REPLACE_ACTION_TEXT_REGEXP ~\(^udphae01$\)\|\(^delthy$\)~ ~"GL[ABO][ABO][ABO]L"~ ~"GLOBAL"~
REPLACE_ACTION_TEXT ~arnman11~ ~ActionOverride("arnman10",MoveToObject("arnman11")+~ ~ActionOverride("arnman10",MoveToObject("arnman11"))~
REPLACE_ACTION_TEXT ~baerie~   ~MoveGlobal("AR0607","Aerie",\[1034\.1034\],0)~ ~MoveGlobal("AR0607","Aerie",[1034.1034])~
REPLACE_ACTION_TEXT ~bdact05~  ~ActionOverride("bdact06",MoveToPoint(\[?1384\.420\])+~ ~ActionOverride("bdact06",MoveToPoint([1384.420]))~
REPLACE_ACTION_TEXT ~bdact06~  ~StartCutScene("Cut31L)~ ~StartCutScene("Cut31L")~
REPLACE_ACTION_TEXT ~cattac~   ~Attack(NearestEnemyOf(Myself)+~ ~Attack(NearestEnemyOf(Myself))~
REPLACE_ACTION_TEXT ~dadrow17~ ~SetGlobal("GhaunTimer","GLOBAL",ONE_DAY)~ ~SetGlobalTimer("GhaunTimer","GLOBAL",ONE_DAY)~
REPLACE_ACTION_TEXT ~deltan~   ~AddJournalEntry(15840)~ ~~
REPLACE_ACTION_TEXT ~dream4~   ~\bStartDialogueNoSet(Player1))~ ~StartDialogueNoSet(Player1)~
REPLACE_ACTION_TEXT ~drunk~    ~Sleep()~ ~ReallyForceSpell(Myself,SURE_SLEEP)~
REPLACE_ACTION_TEXT ~eldotp~   ~ActionOverride(Skie",ChangeAIScript("",DEFAULT))~ ~ActionOverride("Skie",ChangeAIScript("",DEFAULT))~
REPLACE_ACTION_TEXT ~ffbiff01~ ~ActionOverride("Raelis",StartDialogueNoSet(\[Player1\]))~ ~ActionOverride("Raelis",StartDialogueNoSet([PC]))~
REPLACE_ACTION_TEXT ~hajanos~  ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5)~ ~ActionOverride("habrega",EscapeAreaMove("ar0500",4475,1037,5))~
REPLACE_ACTION_TEXT ~imoemj~   ~GiveItemCreate("Misc4e",Myself,1)~ ~GiveItemCreate("Misc4e",Myself,1,1,1)~
REPLACE_ACTION_TEXT ~iron12~   ~EscapeArea\(()\)?~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~kielpc~   ~ChangeAIScript(\?\?\?\?\?,Override)~ ~ChangeAIScript("",OVERRIDE)~
REPLACE_ACTION_TEXT ~kielpc~   ~MoveToPoint(2357\.930\])~ ~MoveToPoint([2357.930])~
REPLACE_ACTION_TEXT ~lavok~    ~DestroyItem(MINHP1)~ ~DestroyItem("MINHP1")~
REPLACE_ACTION_TEXT ~marl~     ~MoveToPoint(\[\.\])~ ~MoveToPoint([-1.-1])~
REPLACE_ACTION_TEXT ~mazzy4~   ~Enemt(~ ~Enemy(~
REPLACE_ACTION_TEXT ~mazzyj~   ~\bEscapeAreaMove("AR2002",341,400,12)*~ ~EscapeAreaMove("AR2002",341,400,12)~
REPLACE_ACTION_TEXT ~mazzyj~   ~ActionOverride("uhrang01",StartDialogueNoSet(\[PC\])+~ ~ActionOverride("uhrang01",StartDialogueNoSet([PC]))~
REPLACE_ACTION_TEXT ~melica~   ~GiveItemCreate("MISC49,LastTalkedToBy,0,0,0)~ ~GiveItemCreate("MISC49",LastTalkedToBy,0,0,0)~
REPLACE_ACTION_TEXT ~mgappr03~ ~CreateItem(\("?[a-z|A-Z|0-9]+"?\))~ ~CreateItem(\1,1,1,1)~
REPLACE_ACTION_TEXT ~pelanna~  ~ActionOverride("arntra03",MoveToPointNoInterrupt(\[2192\.1535\])+~ ~ActionOverride("arntra03",MoveToPointNoInterrupt([2192.1535]))~
REPLACE_ACTION_TEXT ~ppsaem3~  ~GiveItem(\[PC\],"misc8u")~ ~~
REPLACE_ACTION_TEXT ~quayle~   ~\bSetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)*~ ~SetGlobalTimer("CircusEnded","GLOBAL",ONE_DAY)~
REPLACE_ACTION_TEXT ~sahimp02~ ~CreateVisualEffectObject("SPSTRENH,"CHEST6")~ ~CreateVisualEffectObject("SPSTRENH","CHEST6")~
REPLACE_ACTION_TEXT ~shape~    ~Polymorph(RAKHASA)~ ~Polymorph(RAKSHASA)~
REPLACE_ACTION_TEXT ~sharte~   ~ChangeAIScript("SHARTEEL,OVERRIDE)~ ~ChangeAIScript("SHARTEEL",OVERRIDE)~
REPLACE_ACTION_TEXT ~shoal~    ~ActionOverride("Droth",MoveToPoint(\[2900\.525\])+~ ~ActionOverride("Droth",MoveToPoint([2900.525]))~
REPLACE_ACTION_TEXT ~test2~    ~Attack(\[0\],0,\[0\])~ ~Attack(NearestEnemyOf(Myself))~
REPLACE_ACTION_TEXT ~udphae01~ ~EscapeArea(\("[a-z|A-Z|0-9]+"\)?)~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~udsvir06~ ~EscapeAreaObject("AR2300")~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~udsvir08~ ~EscapeArea();~ ~EscapeArea()~
REPLACE_ACTION_TEXT ~valygarj~ ~ActionOverride("Viconia",LeaveParty()+~ ~ActionOverride("Viconia",LeaveParty())~

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
REPLACE_TRIGGER_TEXT_REGEXP ~\(^barl$\)\|\(^temsup$\)\|\(^trgeni01$\)\|\(^trlgrd01$\)\|\(^trmer03$\)\|\(^trrak01$\)~ ~"Faldorn"~ ~"cefaldor"~
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
REPLACE_TRIGGER_TEXT ~peony~    ~"LadyMaria"~    ~"Maria"~
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
REPLACE_ACTION_TEXT  ~player1~  ~"TreeLife"~     ~"Tree"~
REPLACE_TRIGGER_TEXT ~trax~     ~"trguard"~      ~"traxg"~
REPLACE_TRIGGER_TEXT ~uhmay01~  ~"uhboy01"~      ~"Atta"~
REPLACE_TRIGGER_TEXT ~surayah~  ~"Yusuf"~        ~"Yusef"~

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
REPLACE_TRIGGER_TEXT ~baerie~   ~Global\(\([GL]T\)?(\)"AerieRomance","GLOBAL"~   ~Global\1"AerieRomanceActive","GLOBAL"~
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

// adds extra trigger to account for Raelis stuff
ADD_STATE_TRIGGER ~AERIEJ~ 7 ~!Global("QuayleRaelis","GLOBAL",1)~ 10

// jastey: This is a fix so that Anomen's second "dead sister" complaint can be triggered at all
ADD_TRANS_ACTION ANOMENJ BEGIN 28 END BEGIN END ~SetGlobal("AnomenComplain","LOCALS",1)~

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

// closes possible loop in Aerie-Anomen banter
REPLACE_ACTION_TEXT  ~baerie~  ~SetGlobal("BAerie4","LOCALS",0)~ ~SetGlobal("BAerie4","LOCALS",1)~

// specific fixes to states and whatnot
REPLACE_STATE_TRIGGER BAERIE 294
~Global("LoveTalk","LOCALS",32)
Global("AerieRomance","GLOBAL",1)
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

// when NPC have just-before-rest LTs, often don't properly rest the party
ADD_TRANS_ACTION BANOMEN
BEGIN 370 END
BEGIN END
~RestParty()~

// belmin no valid links fix
REPLACE_TRIGGER_TEXT ~belmin~ ~!Race(Player[2-6],ELF)~ ~~

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

REPLACE_ACTION_TEXT ~bjaheir~ ~SetGlobalTimer("TerminselAppear","GLOBAL",ONE_DAY)~ ~~ // as it is useless and potentially buggy.

// korgan not setting variable to track whether this talk has occurred
ADD_TRANS_ACTION BKORGAN
BEGIN 109 END
BEGIN END
~SetGlobal("BKorgan24","LOCALS",1)~

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

// deril should whine when attacked
REPLACE_TRIGGER_TEXT ~cederil~  ~Global("DerilHalfHealth","LOCALS",1)~ ~Global("DerilHalfHealth","GLOBAL",1)~

// fixes non-recognition of the PC as great druid
CHAIN IF WEIGHT #0 ~Global("DruidStronghold","GLOBAL",1)
Global("KickedOut","LOCALS",1)
Global("CerndBaby","GLOBAL",0)~ THEN CERNDP PCGroveLeader @105
END CERNDP 2


// journal entries not set if minsc/yoshi interject
EXTEND_BOTTOM circg1 3
  IF ~IsValidForPartyDialog("Minsc")~ THEN DO ~SetGlobal("NoEntry","AR0700",2)
MoveToPoint([3037.1566])
Face(0)~ UNSOLVED_JOURNAL #34110 EXTERN ~MINSCJ~ 69
  IF ~!IsValidForPartyDialog("Minsc")
IsValidForPartyDialog("Yoshimo")~ THEN DO ~SetGlobal("NoEntry","AR0700",2)
MoveToPoint([3037.1566])
Face(0)~ UNSOLVED_JOURNAL #34110 EXTERN ~YOSHJ~ 25
END
//ALTER_TRANS CIRCG1 BEGIN 3 END BEGIN 1 END // filename, state, trans
//BEGIN // list of changes, see below for flags
//  UNSOLVED_JOURNAL ~UNSOLVED_JOURNAL #34110~
//END

// global should be set even on interjections
ADD_TRANS_ACTION copgreet
BEGIN 6 END
BEGIN 1 2 END
~SetGlobal("TalkedToFrankie","GLOBAL",1)~

// fixes 'no valid' error for slave leader in ust natha
ALTER_TRANS DASLAVE1 BEGIN 10 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~~
END

ADD_TRANS_ACTION DELON
BEGIN 16 END
BEGIN END
~RevealAreaOnMap("AR1100") SetGlobal("Acceptance","GLOBAL",1)~

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
SetPlayerSound(Myself,30725,TIRED)~
END

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

// Gaal takes the rift device part
ADD_TRANS_ACTION GAAL
BEGIN 18 END
BEGIN 0 END
~TakePartyItem("misc5a")~

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

// haer'dalis
REPLACE_STATE_TRIGGER HAERDA 106 
~Dead("Mekrath")
Global("HaerDalisMove","GLOBAL",0)
Global("PlanarPrison","GLOBAL",0)~

// eliminates selfish hell test exploits
REPLACE_ACTION_TEXT HELLSELF
~CreateVisualEffectObject("SPFLESHS",Player2Fill)~
~ActionOverride(Player2Fill,MakeUnselectable(5))
CreateVisualEffectObject("SPFLESHS",Player2Fill)~
REPLACE_TRIGGER_TEXT ~hellself~ ~Global("OpenedDoor6","AR2904",0)~ ~Global("OpenedDoor5","AR2904",1)~

// Kangaxx will properly transform even if first dialogue didn't fire
ADD_STATE_TRIGGER HLKANG 0 ~!HP(Myself,1)~

// transition to edwin missing edwin check
ADD_TRANS_TRIGGER imoen2j 11 ~IsValidForPartyDialog("Edwin")~ DO 15

// close exploit of forcing imoen to rejoin in CI when trying to run away
ADD_TRANS_ACTION IMOENP
BEGIN 3 END
BEGIN END
~SetInterrupt(FALSE) DialogInterrupt(FALSE)~

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

// fixes Jaheira's harper hold trip
REPLACE_STATE_TRIGGER JAHEIRAP 32 ~OR(2)
Global("JaheiraRomanceActive","GLOBAL",0)
Global("JaheiraRomanceActive","GLOBAL",3)
GlobalGT("JaheiraHarperPlot","GLOBAL",0)
GlobalLT("HarperFight","GLOBAL",1)
Global("KickedOut","LOCALS",0)~

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
    IF ~~ THEN JOURNAL #20986 FLAGS 128 EXIT
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

// if vittorio spawns behind wall, can break wish quest
REPLACE_ACTION_TEXT ~lout~ ~EscapeAreaMove("AR0514",[0-9]+,[0-9]+,4)~ ~EscapeAreaMove("AR0514",442,410,4)~
// mekrath not clearing his journal entry; also see ar0705.bcs
ADD_TRANS_ACTION MEKRAT
BEGIN 15 END
BEGIN 1 END
~EraseJournalEntry(4660)~

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
  ACTION ~SetGlobal("Apprenti","GLOBAL",10) SetGlobalTimer("ApprentiBuildTimer","GLOBAL",FOUR_DAYS)~
END

ALTER_TRANS MGAPPR02 BEGIN 77 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  TRIGGER ~RandomNumGT(100,0) RandomNumLT(100,61)~
END

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

// cernd ntrjex blocked if Mazzy valid
REPLACE_TRIGGER_TEXT ~mourner5~ ~!I[sf]ValidForPartyDialog\(ue\)?("Mazzy")~ ~~

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

// Ellie the Festhall cook multi-XP fix
REPLACE_ACTION_TEXT PIRCOR05
~AddXPObject(Player6,2250)~ ~AddXPObject(Player6,2250) EscapeArea()~

REPLACE PLAYER1
  IF WEIGHT #8 ~Global("Slayer10","GLOBAL",1)~ THEN BEGIN 27 SAY #55324
    IF ~~ THEN REPLY #55326 DO ~SetGlobal("Slayer10","GLOBAL",0)~ EXIT
    IF ~~ THEN REPLY #55325 DO ~SetGlobal("Slayer10","GLOBAL",2)
                                SetGlobalTimer("TheSlayerTimer","GLOBAL",60)
                                ReputationInc(-2)
                                ApplySpell(Player1,SLAYER_CHANGE_TWO)~ EXIT
  END
END

// removes Desharik XP exploit along with cut41f changes
REPLACE_ACTION_TEXT ~ppdesh~ ~AddXPObject(Player[1-6],38500)~ ~~

//fixes infinite XP exploit on Spellhold bug
EXTEND_BOTTOM PPRIDD 3
  IF ~Global("openHead","AR1512",1)~ THEN EXIT
END

// two paths from Sime's dialogue; one has a SaveGame(0) and the other does not
ADD_TRANS_ACTION PPSIME
BEGIN 4 END
BEGIN 0 END
~SaveGame(0)~

// reedle discusss solved murders as if they're ongoing
ADD_TRANS_TRIGGER REEDLE 3 ~Global("MurdersSolved","GLOBAL",0)~ DO 0
ADD_TRANS_TRIGGER REEDLE 7 ~Global("MurdersSolved","GLOBAL",0)~ DO 0

// diseased one multi-saving grace and xp exploit fix
ADD_STATE_TRIGGER ~RIFTM01~ 32 ~Global("CDNoRepeat","AR0203",0)~
ADD_TRANS_ACTION RIFTM01
BEGIN 32 END
BEGIN END
~SetGlobal("CDNoRepeat","AR0203",1)~

ADD_TRANS_ACTION QUAYLEM
BEGIN 0 END
BEGIN 0 END
~SetNumTimesTalkedTo(1)~

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

// gracie at sea's bounty shouldn't flirt with edwina or mention her beard
ADD_STATE_TRIGGER ~SBWENCH~ 6 ~Gender("Edwin",MALE)~

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

// telwyn HoG exploit fix, pt 1/2 (see ar0901.bcs)
REPLACE_ACTION_TEXT ~sctelwyn~ ~GiveItem("HELM03",LastTalkedToBy)~ ~GiveItemCreate("HELM03",LastTalkedToBy,0,0,0)~

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

// arnolius is using wrong area reference in his variables
REPLACE_TRIGGER_TEXT ~shop02~ ~,"AR0700",~ ~,"AR0706",~
REPLACE_ACTION_TEXT  ~shop02~ ~,"AR0700",~ ~,"AR0706",~

// fixes Joster's opening line
REPLACE SHTH05
IF ~NumTimesTalkedTo(0)~ THEN BEGIN 0 // from:
 SAY #32294
 IF ~Global("TalkedToJoster","GLOBAL",0)~ THEN REPLY #32538 DO ~SetGlobal("TalkedToJoster","GLOBAL",1)~ GOTO 1
 IF ~Global("TalkedToJoster","GLOBAL",0)~ THEN REPLY #32819 DO ~SetGlobal("TalkedToJoster","GLOBAL",1)~ GOTO 2
 IF ~!Global("TalkedToJoster","GLOBAL",0)~ THEN GOTO 3
END
END

// avatar of rilifane xp exploit fix
ADD_TRANS_ACTION SUAVATAR
BEGIN 0 END
BEGIN 0 END
~TakePartyItemAll("miscb1")
TakePartyItemAll("miscb2")
TakePartyItemAll("miscb3")
DestroyItem("miscb1")
DestroyItem("miscb2")
DestroyItem("miscb3")~

// bad trigger makes it hard to shut up Lilarcor
REPLACE_TRIGGER_TEXT ~sw2h14~ ~Alignment(Player1,MASK_LAWFUL)~ ~~
REPLACE_TRIGGER_TEXT ~sw2h14~ ~!InventoryFull(Player1)~ ~~

// tanner xp exploit
REPLACE_ACTION_TEXT ~tanner~ ~AddexperienceParty(23250)~ ~DialogueInterrupt(0)~
REPLACE_ACTION_TEXT ~tanner~ ~MoveToPoint(\[274\.276\])~ ~MoveToPoint([274.276]) AddExperienceParty(23250) Enemy() SetInterrupt(0)~

// multi-ring of the ram exploit
REPLACE_ACTION_TEXT ~tolger~ ~GiveItemCreate("ring33",LastTalkedToBy,1,0,0)~ ~GiveItem("ring33",LastTalkedToBy)~

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

// raissia double xp exploit
ADD_TRANS_ACTION ~trskin01~
BEGIN 19 END
BEGIN END
~SetInterrupt(FALSE) DialogueInterrupt(FALSE)~

// removes exploit from talking to the slave leader in Ust Natha repeatedly
ADD_STATE_TRIGGER ~UDILSLA2~ 13 ~Global("ByeByeSlaves","AR2400",0)~

ADD_TRANS_ACTION UDPHAE01
BEGIN 115 END
BEGIN 0 END
~SetGlobal("udPhaTimerOn","GLOBAL",0)~

// adds trigger to Phaere
ADD_STATE_TRIGGER ~UDPHAE01~ 49 ~Global("udMoveToBeholder","GLOBAL",2)~

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
ActionOverride("ARDULACE",JumpToPoint([516.1142]))
EscapeAreaMove("AR2204",743,1008,0)~
END

// closes vithal multi-xp exploit
ADD_STATE_TRIGGER UDVITH 41 ~Global("airgate","LOCALS",0)~

// umar hills boys don't always take all three swords
REPLACE_ACTION_TEXT ~uhkid01~ ~TakePartyItemNum("MISC97",3)~ ~TakePartyItem("MISC97")~
REPLACE_ACTION_TEXT ~uhkid01~ ~TakePartyItem("SW1H01",3)~ ~TakePartyItemNum("SW1H01",3)~

// add SG so Madulf has proper array of responses
ADD_TRANS_ACTION UHMAY01
BEGIN 71 END
BEGIN 0 END
~SetGlobal("Lloydy","GLOBAL",1)~

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

// viconia shouldn't be burned at stake if she's been freed
ADD_STATE_TRIGGER ~VICG1~ 7 ~!Global("ViconiaFree","AR1000",1)~

// viekang in trademeet initiates dialogue twice; see viekang.bcs
ADD_TRANS_ACTION VIEKANG
BEGIN 5 END
BEGIN END
~SetGlobal("ViekangSeesPC","LOCALS",1)~

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

// wish for riches doesn't get 200 gold due to incorrect action
REPLACE_ACTION_TEXT ~wish~ ~GivePartyGold(2000)~ ~GiveGoldForce(2000)~

// if wish cast by non-party member (i.e. simulcrum or projected image), scroll to start quest would be lost
REPLACE_ACTION_TEXT WISH ~GiveItemCreate("wishscrl",LastTalkedToBy,0,0,0)~ ~GiveItemCreate("wishscrl",Player1,0,0,0)~