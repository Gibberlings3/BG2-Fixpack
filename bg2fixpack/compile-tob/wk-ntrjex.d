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
  IF ~See("Imoen2")  IsValidForPartyDialog("Imoen2")  GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("ReadyForChallenge","AR3019",1)~ EXTERN IMOEN2J  cd_imoen2_wk20
  IF ~See("Viconia") IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("ReadyForChallenge","AR3019",1)~ EXTERN VICONIJ  cd_viconia_wk20
  IF ~See("Jaheira") IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("ReadyForChallenge","AR3019",1)~ EXTERN JAHEIRAJ cd_jaheira_wk20
END

EXTEND_BOTTOM GORAPP1 6
  IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KELDORJ cd_keldorn_wk1
  IF ~IsValidForPartyDialog("Anomen")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ANOMENJ cd_anomen_wk1
END

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

EXTEND_BOTTOM GORCAMB 0
  IF ~IsValidForPartyDialog("HaerDalis") !Global("INTOB","GLOBAL",1)~ THEN DO ~AddXP2DA("PLOT2C")~ EXTERN HAERDAJ cd_haerdalis_wk4
END

EXTEND_BOTTOM GORCAMB 17
  IF ~IsValidForPartyDialog("Minsc")     GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN MINSCJ  cd_minsc_wk5
  IF ~IsValidForPartyDialog("Imoen2")    GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN IMOEN2J cd_imoen2_wk5
  IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN HAERDAJ cd_haerdalis_wk5
END

EXTEND_BOTTOM GORCAMB 66
  IF ~GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN HAERDAJ cd_haerdalis_wk4_a
END

EXTEND_BOTTOM GORDEMO 1
  IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KELDORJ cd_keldorn_wk6
  IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ cd_viconia_wk6
  IF ~IsValidForPartyDialog("Anomen")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ANOMENJ cd_anomen_wk6
  IF ~IsValidForPartyDialog("Aerie")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN AERIEJ  cd_aerie_wk6
END

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

EXTEND_BOTTOM GORMAD1 8
  IF ~Name("Viconia",LastTalkedToBy) GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ cd_viconia_wk11
  IF ~Name("Aerie",LastTalkedToBy)   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN AERIEJ  cd_aerie_wk11
  IF ~Name("Keldorn",LastTalkedToBy) GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KELDORJ cd_keldorn_wk11
END

EXTEND_BOTTOM GORODR1 11
  IF ~IsValidForPartyDialog("Mazzy")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN MAZZYJ  cd_mazzy_wk12 // skipping sarevok
  IF ~IsValidForPartyDialog("Korgan") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KORGANJ cd_korgan_wk12
END

EXTEND_BOTTOM GORODR1 19
  IF ~IsValidForPartyDialog("Jaheira")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JAHEIRAJ cd_jaheira_wk13
  IF ~IsValidForPartyDialog("Jan")       GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JANJ     cd_jan_wk13
  IF ~IsValidForPartyDialog("HaerDalis") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN HAERDAJ  cd_haerdalis_wk13
END

EXTEND_BOTTOM GORODR1 35
  IF ~IsValidForPartyDialog("Korgan")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KORGANJ  cd_korgan_wk14
  IF ~IsValidForPartyDialog("Valygar") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VALYGARJ cd_valygar_wk14
  IF ~IsValidForPartyDialog("Minsc")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN MINSCJ   cd_minsc_wk14
END

EXTEND_BOTTOM GORODR1 44
  IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KELDORJ cd_keldorn_wk15
  IF ~IsValidForPartyDialog("Mazzy")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN MAZZYJ  cd_mazzy_wk15
  IF ~IsValidForPartyDialog("Imoen2")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN IMOEN2J cd_imoen2_wk15
  IF ~IsValidForPartyDialog("Anomen")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ANOMENJ cd_anomen_wk15
END

EXTEND_BOTTOM GORODR1 50
  IF ~IsValidForPartyDialog("Edwin")  GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXTERN EDWINJ  cd_edwin_wk16
  IF ~IsValidForPartyDialog("Korgan") GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXTERN KORGANJ cd_korgan_wk16
  IF ~IsValidForPartyDialog("Imoen2") GlobalLT("Chapter","GLOBAL",8)~ THEN DO ~SetGlobal("KnightsInKeep","GLOBAL",1)~ EXTERN IMOEN2J cd_imoen2_wk16
END

EXTEND_BOTTOM GORODR1 53
  IF ~IsValidForPartyDialog("Jaheira") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN JAHEIRAJ cd_jaheira_wk17
  IF ~IsValidForPartyDialog("Viconia") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN VICONIJ  cd_viconia_wk17
  IF ~IsValidForPartyDialog("Anomen")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ANOMENJ  cd_anomen_wk17
END

EXTEND_BOTTOM GORPOL1 1
  IF ~IsValidForPartyDialog("Cernd")   GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN CERNDJ  cd_cernd_wk18
  IF ~IsValidForPartyDialog("Keldorn") GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN KELDORJ cd_keldorn_wk18
  IF ~IsValidForPartyDialog("Anomen")  GlobalLT("Chapter","GLOBAL",8)~ THEN EXTERN ANOMENJ cd_anomen_wk18
END

APPEND AERIEJ
  IF ~~ THEN BEGIN cd_aerie_wk3 SAY #70414
    IF ~~ THEN EXTERN GORAPR 11
    IF ~IsValidForPartyDialog("Valygar")~ THEN EXTERN VALYGARJ cd_valygar_wk3
    IF ~IsValidForPartyDialog("Edwin")~ THEN EXTERN EDWINJ cd_edwin_wk3
  END

  IF ~~ THEN BEGIN cd_aerie_wk6 SAY #70501
    IF ~~ THEN EXTERN GORDEMO 2
  END

  IF ~~ THEN BEGIN cd_aerie_wk7 SAY #70508
    IF ~~ THEN EXTERN HAERDAJ cd_haerdalis_wk7_end
  END

  IF ~~ THEN BEGIN cd_aerie_wk11 SAY #70553
    IF ~~ THEN EXTERN GORMAD1 11
  END
END

APPEND ANOMENJ
  IF ~~ THEN BEGIN cd_anomen_wk1 SAY #70408
    IF ~~ THEN EXTERN GORAPP1 7
  END

  IF ~~ THEN BEGIN cd_anomen_wk6 SAY #70502
    IF ~~ THEN EXTERN GORDEMO 2
  END

  IF ~~ THEN BEGIN cd_anomen_wk7 SAY #70504
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN cd_anomen_wk8 SAY #70513
    IF ~~ THEN EXIT
    IF ~IsValidForPartyDialog("Imoen2")~ THEN EXTERN IMOEN2J cd_imoen2_wk8
  END

  IF ~~ THEN BEGIN cd_anomen_wk15 SAY #70531
    IF ~~ THEN EXTERN GORODR1 35
  END

  IF ~~ THEN BEGIN cd_anomen_wk17 SAY #70539
    IF ~~ THEN EXTERN GORODR1 54
  END

  IF ~~ THEN BEGIN cd_anomen_wk18 SAY #70518
    IF ~~ THEN EXTERN GORODR1 8
  END
END

APPEND CERNDJ
  IF ~~ THEN BEGIN cd_cernd_wk2 SAY #70412
    IF ~~ THEN EXTERN GORAPP1 11
  END

  IF ~~ THEN BEGIN cd_cernd_wk18 SAY #70520
    IF ~~ THEN EXTERN GORODR1 8
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

  IF ~~ THEN BEGIN cd_edwin_wk16 SAY #70537
    IF ~~ THEN EXIT
  END
END

APPEND HAERDAJ
  IF ~~ THEN BEGIN cd_haerdalis_wk4 SAY #70542
    IF ~~ THEN EXTERN GORCAMB 66
  END

  IF ~~ THEN BEGIN cd_haerdalis_wk4_a SAY #70544
    IF ~~ THEN EXTERN GORCAMB 1
  END

  IF ~~ THEN BEGIN cd_haerdalis_wk5 SAY #70549
    IF ~~ THEN EXTERN GORCAMB 18
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

  IF ~~ THEN BEGIN cd_haerdalis_wk13 SAY #70527
    IF ~~ THEN EXTERN GORODR1 20
  END
END

APPEND IMOEN2J

  IF ~~ THEN BEGIN cd_imoen2_wk5 SAY #70551
    IF ~~ THEN EXTERN GORCAMB 18
  END

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

  IF ~~ THEN BEGIN cd_imoen2_wk15 SAY #70534
    IF ~~ THEN EXTERN GORODR1 35
  END

  IF ~~ THEN BEGIN cd_imoen2_wk16 SAY #70535
    IF ~~ THEN EXIT
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

  IF ~~ THEN BEGIN cd_jaheira_wk13 SAY #70524
    IF ~~ THEN EXTERN GORODR1 20
  END

  IF ~~ THEN BEGIN cd_jaheira_wk17 SAY #70541
    IF ~~ THEN EXTERN GORODR1 54
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

  IF ~~ THEN BEGIN cd_jan_wk13 SAY #70526
    IF ~~ THEN EXTERN GORODR1 20
  END
END

APPEND KELDORJ
  IF ~~ THEN BEGIN cd_keldorn_wk1 SAY #70409
    IF ~~ THEN EXTERN GORAPP1 7
  END

  IF ~~ THEN BEGIN cd_keldorn_wk6 SAY #70500
    IF ~~ THEN EXTERN GORDEMO 2
  END

  IF ~~ THEN BEGIN cd_keldorn_wk7 SAY #70505
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN cd_keldorn_wk11 SAY #70554
    IF ~~ THEN EXTERN GORMAD1 11
  END

  IF ~~ THEN BEGIN cd_keldorn_wk15 SAY #70532
    IF ~~ THEN EXTERN GORODR1 35
  END

  IF ~~ THEN BEGIN cd_keldorn_wk18 SAY #70519
    IF ~~ THEN EXTERN GORODR1 8
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

  IF ~~ THEN BEGIN cd_korgan_wk12 SAY #70521
    IF ~~ THEN EXTERN GORODR1 12
  END

  IF ~~ THEN BEGIN cd_korgan_wk14 SAY #70528
    IF ~~ THEN EXTERN GORODR1 36
  END

  IF ~~ THEN BEGIN cd_korgan_wk16 SAY #70536
    IF ~~ THEN EXIT
  END
END

APPEND MAZZYJ
  IF ~~ THEN BEGIN cd_mazzy_wk12 SAY #70523
    IF ~~ THEN EXTERN GORODR1 12
  END

  IF ~~ THEN BEGIN cd_mazzy_wk15 SAY #70533
    IF ~~ THEN EXTERN GORODR1 35
  END

  IF ~~ THEN BEGIN cd_mazzy_wk19 SAY #70434
    IF ~~ THEN EXTERN FSSPIR2 2
    IF ~IsValidForPartyDialog("Imoen2")~  THEN EXTERN IMOEN2J  cd_imoen2_wk19
    IF ~IsValidForPartyDialog("Viconia")~ THEN EXTERN VICONIJ  cd_viconia_wk19
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk19
  END
END

APPEND MINSCJ
  IF ~~ THEN BEGIN cd_minsc_wk5 SAY #70550
    IF ~~ THEN EXTERN GORCAMB 18
  END

  IF ~~ THEN BEGIN cd_minsc_wk9 SAY #70431
    IF ~~ THEN EXTERN JANJ cd_jan_wk9_a
  END

  IF ~~ THEN BEGIN cd_minsc_wk14 SAY #70530
    IF ~~ THEN EXTERN GORODR1 36
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

  IF ~~ THEN BEGIN cd_valygar_wk14 SAY #70529
    IF ~~ THEN EXTERN GORODR1 36
  END
END

APPEND VICONIJ
  IF ~~ THEN BEGIN cd_viconia_wk2 SAY #70411
    IF ~~ THEN EXTERN GORAPP1 11
    IF ~IsValidForPartyDialog("Cernd")~ THEN EXTERN CERNDJ   cd_cernd_wk2
    IF ~IsValidForPartyDialog("Jaheira")~ THEN EXTERN JAHEIRAJ cd_jaheira_wk2
  END

  IF ~~ THEN BEGIN cd_viconia_wk6 SAY #70503
    IF ~~ THEN EXTERN GORDEMO 2
  END

  IF ~~ THEN BEGIN cd_viconia_wk11 SAY #70552
    IF ~~ THEN EXTERN GORMAD1 10
  END

  IF ~~ THEN BEGIN cd_viconia_wk17 SAY #70540
    IF ~~ THEN EXTERN GORODR1 54
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