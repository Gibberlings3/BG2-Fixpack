/////                                                  \\\\\
///// making WK interjects available in SoA            \\\\\
/////                                                  \\\\\

EXTEND_BOTTOM FSSPIR2 1
IF ~IsValidForPartyDialog("Imoen2")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN IMOEN2J  cd_imoen2_wk19
IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ  cd_viconia_wk19
IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JAHEIRAJ cd_jaheira_wk19
IF ~IsValidForPartyDialog("Mazzy")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN MAZZYJ   cd_mazzy_wk19
END

EXTEND_BOTTOM FSSPIR2 5
IF ~IsValidForPartyDialog("Imoen2")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN IMOEN2J  cd_imoen2_wk20
IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ  cd_viconia_wk20
IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JAHEIRAJ cd_jaheira_wk20
END

INTERJECT GORAPP1 6 cd_keldorn_wk1
== KELDORJ IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN #70409 END GORAPP1 7
INTERJECT GORAPP1 6 cd_anomen_wk1
== ANOMENJ IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN #70408 END GORAPP1 7

EXTEND_BOTTOM GORAPP1 10
IF ~IsValidForPartyDialog("Cernd")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN CERNDJ   cd_cernd_wk2
IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JAHEIRAJ cd_jaheira_wk2
IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ  cd_viconia_wk2
IF ~IsValidForPartyDialog("Korgan")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KORGANJ  cd_korgan_wk2
END

EXTEND_BOTTOM GORAPR 10
IF ~IsValidForPartyDialog("Valygar") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VALYGARJ cd_valygar_wk3
IF ~IsValidForPartyDialog("Edwin")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN EDWINJ cd_edwin_wk3
IF ~IsValidForPartyDialog("Aerie")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN AERIEJ cd_aerie_wk3
IF ~IsValidForPartyDialog("Nalia")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN NALIAJ cd_nalia_wk3
END

INTERJECT GORCAMB 0 cd_haerdalis_wk4
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis") !Global("INTOB","GLOBAL",1)~ THEN #70542 DO ~AddXP2DA("PLOT2C")~ END GORCAMB 66

INTERJECT GORCAMB 17 cd_minsc_wk5
== MINSCJ IF ~IsValidForPartyDialog("Minsc") GlobalLT("Chapter","GLOBAL",8)~ THEN #70550 END GORCAMB 18
INTERJECT GORCAMB 17 cd_imoen2_wk5
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2") GlobalLT("Chapter","GLOBAL",8)~ THEN #70551 END GORCAMB 18
INTERJECT GORCAMB 17 cd_haerdalis_wk5
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN #70549 END GORCAMB 18

EXTEND_BOTTOM GORCAMB 66
IF ~GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN HAERDAJ cd_haerdalis_wk4_a
END

INTERJECT GORDEMO 1 cd_keldorn_wk6
== KELDORJ IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN #70500 END GORDEMO 2
INTERJECT GORDEMO 1 cd_viconia_wk6
== VICONIJ IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN #70503 END GORDEMO 2
INTERJECT GORDEMO 1 cd_anomen_wk6
== ANOMENJ IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN #70502 END GORDEMO 2
INTERJECT GORDEMO 1 cd_aerie_wk6
== AERIEJ IF ~IsValidForPartyDialog("Aerie") GlobalLT("Chapter","GLOBAL",8)~ THEN #70501 END GORDEMO 2

EXTEND_BOTTOM GORDEMO 18
IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN UNSOLVED_JOURNAL #62987 
  DO ~SetGlobal("zGorDemoJob","GLOBAL",1)~ EXTERN HAERDAJ cd_haerdalis_wk7
IF ~IsValidForPartyDialog("Anomen")    GlobalLT("Chapter","GLOBAL",8)~ THEN UNSOLVED_JOURNAL #62987 
  DO ~SetGlobal("zGorDemoJob","GLOBAL",1)~ EXTERN ANOMENJ cd_anomen_wk7
IF ~IsValidForPartyDialog("Keldorn")   GlobalLT("Chapter","GLOBAL",8)~ THEN UNSOLVED_JOURNAL #62987
  DO ~SetGlobal("zGorDemoJob","GLOBAL",1)~ EXTERN KELDORJ cd_keldorn_wk7
END

EXTEND_BOTTOM GORDEMO 24
IF ~IsValidForPartyDialog("Imoen2") GlobalLT("Chapter","GLOBAL",8)~ THEN 
  DO ~SetGlobal("DemogorgonWarned","GLOBAL",1)~ EXTERN IMOEN2J cd_imoen2_wk8
IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN
  DO ~SetGlobal("DemogorgonWarned","GLOBAL",1)~ EXTERN ANOMENJ cd_anomen_wk8
END

EXTEND_BOTTOM GORGIT 1
IF ~IsValidForPartyDialog("Jan") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JANJ cd_jan_wk9
END

EXTEND_BOTTOM GORIMP01 7
IF ~IsValidForPartyDialog("Imoen2")    GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN IMOEN2J cd_imoen2_wk10
IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN HAERDAJ cd_haerdalis_wk10
END

INTERJECT ~GORMAD1~ 8 cd_viconia_wk11
== VICONIJ IF ~Name("Viconia",LastTalkedToBy) GlobalLT("Chapter","GLOBAL",8)~ THEN #70552 END ~GORMAD1~ 10
INTERJECT ~GORMAD1~ 8 cd_aerie_wk11
== AERIEJ IF ~Name("Aerie",LastTalkedToBy) GlobalLT("Chapter","GLOBAL",8)~ THEN #70553 END ~GORMAD1~ 11
INTERJECT ~GORMAD1~ 8 cd_keldorn_wk11
== KELDORJ IF ~Name("Keldorn",LastTalkedToBy) GlobalLT("Chapter","GLOBAL",8)~ THEN #70554 END ~GORMAD1~ 11

INTERJECT GORODR1 11 cd_mazzy_wk12
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy") GlobalLT("Chapter","GLOBAL",8)~ THEN #70523 END GORODR1 12
// skipping sarevok here
INTERJECT GORODR1 11 cd_korgan_wk12
== KORGANJ IF ~IsValidForPartyDialog("Korgan") GlobalLT("Chapter","GLOBAL",8)~ THEN #70521 END GORODR1 12

INTERJECT GORODR1 19 cd_jaheira_wk13
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN #70524 END GORODR1 20
INTERJECT GORODR1 19 cd_jan_wk13
== JANJ IF ~IsValidForPartyDialog("Jan") GlobalLT("Chapter","GLOBAL",8)~ THEN #70526 END GORODR1 20
INTERJECT GORODR1 19 cd_haerdalis_wk13
== HAERDAJ IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN #70527 END GORODR1 20

INTERJECT GORODR1 35 cd_korgan_wk14
== KORGANJ IF ~IsValidForPartyDialog("Korgan") GlobalLT("Chapter","GLOBAL",8)~ THEN #70528 END GORODR1 36
INTERJECT GORODR1 35 cd_valygar_wk14
== VALYGARJ IF ~IsValidForPartyDialog("Valygar") GlobalLT("Chapter","GLOBAL",8)~ THEN #70529 END GORODR1 36
INTERJECT GORODR1 35 cd_minsc_wk14
== MINSCJ IF ~IsValidForPartyDialog("Minsc") GlobalLT("Chapter","GLOBAL",8)~ THEN #70530 END GORODR1 36

INTERJECT GORODR1 44 cd_keldorn_wk15
== KELDORJ IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN #70532 END GORODR1 35
INTERJECT GORODR1 44 cd_mazzy_wk15
== MAZZYJ IF ~IsValidForPartyDialog("Mazzy") GlobalLT("Chapter","GLOBAL",8)~ THEN #70533 END GORODR1 35
INTERJECT GORODR1 44 cd_imoen2_wk15
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2") GlobalLT("Chapter","GLOBAL",8)~ THEN #70534 END GORODR1 35
INTERJECT GORODR1 44 cd_anomen_wk15
== ANOMENJ IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN #70531 END GORODR1 35

INTERJECT GORODR1 50 cd_edwin_wk16
== EDWINJ IF ~IsValidForPartyDialog("Edwin") GlobalLT("Chapter","GLOBAL",8)~ THEN #70537 DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXIT
INTERJECT GORODR1 50 cd_korgan_wk16
== KORGANJ IF ~IsValidForPartyDialog("Korgan") GlobalLT("Chapter","GLOBAL",8)~ THEN #70536 DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXIT
INTERJECT GORODR1 50 cd_imoen2_wk16
== IMOEN2J IF ~IsValidForPartyDialog("Imoen2") GlobalLT("Chapter","GLOBAL",8)~ THEN #70535 DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXIT

INTERJECT GORODR1 53 cd_jaheira_wk17
== JAHEIRAJ IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN #70541 END GORODR1 54
INTERJECT GORODR1 53 cd_viconia_wk17 // Viccy can't be non-evil in SoA, ignore MASK_EVIL trigger
== VICONIJ IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN #70540 END GORODR1 54
INTERJECT GORODR1 53 cd_anomen_wk17
== ANOMENJ IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN #70539 END GORODR1 54

INTERJECT GORPOL1 1 cd_cernd_wk18
== CERNDJ IF ~IsValidForPartyDialog("Cernd") GlobalLT("Chapter","GLOBAL",8)~ THEN #70520 END GORODR1 8
INTERJECT GORPOL1 1 cd_keldorn_wk18
== KELDORJ IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN #70519 END GORODR1 8
INTERJECT GORPOL1 1 cd_anomen_wk18
== ANOMENJ IF ~IsValidForPartyDialog("Anomen") GlobalLT("Chapter","GLOBAL",8)~ THEN #70518 END GORODR1 8

APPEND AERIEJ
  IF ~~ THEN BEGIN cd_aerie_wk3 SAY #70414
    IF ~~ THEN EXTERN GORAPR 11
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk3
    IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN EDWINJ cd_edwin_wk3
  END

  IF ~~ THEN BEGIN cd_aerie_wk7 SAY #70508
    IF ~~ THEN EXTERN HAERDAJ cd_haerdalis_wk7_end
  END
END

APPEND ANOMENJ
  IF ~~ THEN BEGIN cd_anomen_wk7 SAY #70504
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN cd_anomen_wk8 SAY #70513
    IF ~~ THEN EXIT
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J cd_imoen2_wk8
  END
END

APPEND CERNDJ
  IF ~~ THEN BEGIN cd_cernd_wk2 SAY #70412
    IF ~~ THEN EXTERN GORAPP1 11
  END
END

APPEND EDWINJ
  IF ~~ THEN BEGIN cd_edwin_wk3 SAY #70415
    IF ~~ THEN EXTERN GORAPR 11
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk3
  END

  IF ~~ THEN BEGIN cd_edwin_wk8 SAY #70515
    IF ~~ THEN EXTERN IMOEN2J cd_imoen2_wk8_end
  END
END

APPEND HAERDAJ
  IF ~~ THEN BEGIN cd_haerdalis_wk4_a SAY #70544
    IF ~~ THEN EXTERN GORCAMB 1
  END

  IF ~~ THEN BEGIN cd_haerdalis_wk7 SAY #70506
    IF ~~ THEN EXIT
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk7
    IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN NALIAJ cd_nalia_wk7
    IF ~IsValidForPartyDialog("Aerie")~ THEN EXTERN AERIEJ cd_aerie_wk7
  END

  IF ~~ THEN BEGIN cd_haerdalis_wk7_end SAY #70510
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN cd_haerdalis_wk10 SAY #70420
    IF ~~ THEN EXTERN GORIMP01 8
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J cd_imoen2_wk10
  END
END

APPEND IMOEN2J
  IF ~~ THEN BEGIN cd_imoen2_wk8 SAY #70512
    IF ~~ THEN EXIT
    IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN EDWINJ cd_edwin_wk8
    IF ~IsValidForPartyDialog("Nalia")~ THEN EXTERN NALIAJ cd_nalia_wk8
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk8
  END

  IF ~~ THEN BEGIN cd_imoen2_wk8_end SAY #70517
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN cd_imoen2_wk10 SAY #70421
    IF ~~ THEN EXTERN GORIMP01 8
  END

  IF ~~ THEN BEGIN cd_imoen2_wk19 SAY #70437
    IF ~~ THEN EXTERN FSSPIR2 2
  END

  IF ~~ THEN BEGIN cd_imoen2_wk20 SAY #70442
    IF ~~ THEN DO ~TriggerActivation("Tran3024",TRUE)
                   TriggerActivation("Tran3025",TRUE)
                   TriggerActivation("Tran3026",TRUE)
                   TriggerActivation("Exit3024",FALSE)
                   TriggerActivation("Exit3025",FALSE)
                   TriggerActivation("Exit3026",FALSE)~ EXIT
  END
END

APPEND JAHEIRAJ
  IF ~~ THEN BEGIN cd_jaheira_wk2 SAY #70413
    IF ~~ THEN EXTERN GORAPP1 11
  END

  IF ~~ THEN BEGIN cd_jaheira_wk7 SAY #70507
    IF ~~ THEN EXTERN HAERDAJ cd_haerdalis_wk7_end
  END

  IF ~~ THEN BEGIN cd_jaheira_wk19 SAY #70435
    IF ~~ THEN EXTERN FSSPIR2 2
  END

  IF ~~ THEN BEGIN cd_jaheira_wk20 SAY #70439
    IF ~~ THEN DO ~TriggerActivation("Tran3024",TRUE)
                   TriggerActivation("Tran3025",TRUE)
                   TriggerActivation("Tran3026",TRUE)
                   TriggerActivation("Exit3024",FALSE)
                   TriggerActivation("Exit3025",FALSE)
                   TriggerActivation("Exit3026",FALSE)~ EXIT
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J  cd_imoen2_wk20
  END
END

APPEND JANJ
  IF ~~ THEN BEGIN cd_jan_wk9 SAY #70422 = #70423
    IF ~~ THEN REPLY #70427 GOTO cd_jan_wk9_a
    IF ~IsValidForPartyDialog("Korgan")~  THEN EXTERN KORGANJ  cd_korgan_wk9
    IF ~IsValidForPartyDialog("Minsc")~   THEN EXTERN MINSCJ   cd_minsc_wk9
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk9
  END

  IF ~~ THEN BEGIN cd_jan_wk9_a SAY #70428
    IF ~~ THEN EXTERN GORGIT 3
  END
END

APPEND KELDORJ
  IF ~~ THEN BEGIN cd_keldorn_wk7 SAY #70505
    IF ~~ THEN EXIT
  END
END

APPEND KORGANJ
  IF ~~ THEN BEGIN cd_korgan_wk2 SAY #70410
    IF ~~ THEN EXTERN GORAPP1 11
    IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN CERNDJ   cd_cernd_wk2
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk2
  END

  IF ~~ THEN BEGIN cd_korgan_wk9 SAY #70432
    IF ~~ THEN EXTERN JANJ cd_jan_wk9_a
  END
END

APPEND MAZZYJ
  IF ~~ THEN BEGIN cd_mazzy_wk19 SAY #70434
    IF ~~ THEN EXTERN FSSPIR2 2
    IF ~IsValidForPartyDialog("Imoen2")~  THEN EXTERN IMOEN2J  cd_imoen2_wk19
    IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN VICONIJ  cd_viconia_wk19
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk19
  END
END

APPEND MINSCJ
  IF ~~ THEN BEGIN cd_minsc_wk9 SAY #70431
    IF ~~ THEN EXTERN JANJ cd_jan_wk9_a
  END
END

APPEND NALIAJ
  IF ~~ THEN BEGIN cd_nalia_wk3 SAY #70417
    IF ~~ THEN EXTERN GORAPR 11
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk3
    IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN EDWINJ cd_edwin_wk3
  END

  IF ~~ THEN BEGIN cd_nalia_wk7 SAY #70509
    IF ~~ THEN EXTERN HAERDAJ cd_haerdalis_wk7_end
  END

  IF ~~ THEN BEGIN cd_nalia_wk8 SAY #70516
    IF ~~ THEN EXTERN IMOEN2J cd_imoen2_wk8_end
  END
END

APPEND VALYGARJ
  IF ~~ THEN BEGIN cd_valygar_wk3 SAY #70416
    IF ~~ THEN EXTERN GORAPR 11
  END

  IF ~~ THEN BEGIN cd_valygar_wk8 SAY #70514
    IF ~~ THEN EXTERN IMOEN2J cd_imoen2_wk8_end
  END

  IF ~~ THEN BEGIN cd_valygar_wk9 SAY #70433
    IF ~~ THEN EXTERN JANJ cd_jan_wk9_a
  END
END

APPEND VICONIJ
  IF ~~ THEN BEGIN cd_viconia_wk2 SAY #70411
    IF ~~ THEN EXTERN GORAPP1 11
    IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN CERNDJ   cd_cernd_wk2
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk2
  END

  IF ~~ THEN BEGIN cd_viconia_wk19 SAY #70436
    IF ~~ THEN EXTERN FSSPIR2 2
  END

  IF ~~ THEN BEGIN cd_viconia_wk20 SAY #70438
    IF ~~ THEN DO ~TriggerActivation("Tran3024",TRUE)
                   TriggerActivation("Tran3025",TRUE)
                   TriggerActivation("Tran3026",TRUE)
                   TriggerActivation("Exit3024",FALSE)
                   TriggerActivation("Exit3025",FALSE)
                   TriggerActivation("Exit3026",FALSE)~ EXIT
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J  cd_imoen2_wk20
  END
END
