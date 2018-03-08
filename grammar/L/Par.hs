{-# OPTIONS_GHC -w #-}
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module L.Par where
import L.Abs
import L.Lex
import L.ErrM
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn21 (Ident)
	| HappyAbsSyn22 (UIdent)
	| HappyAbsSyn23 (LIdent)
	| HappyAbsSyn24 (Program)
	| HappyAbsSyn25 ([Decl])
	| HappyAbsSyn26 (Decl)
	| HappyAbsSyn27 ([Ident])
	| HappyAbsSyn28 (Constructor)
	| HappyAbsSyn29 ([Constructor])
	| HappyAbsSyn30 (Type)
	| HappyAbsSyn32 ([Type])
	| HappyAbsSyn33 (Body)
	| HappyAbsSyn34 ([Alt])
	| HappyAbsSyn35 (Alt)
	| HappyAbsSyn36 (Pat)
	| HappyAbsSyn38 ([Pat])
	| HappyAbsSyn39 (Expr)
	| HappyAbsSyn41 ([Expr])

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (49) = happyShift action_57
action_0 (54) = happyShift action_58
action_0 (23) = happyGoto action_55
action_0 (24) = happyGoto action_61
action_0 (25) = happyGoto action_62
action_0 (26) = happyGoto action_60
action_0 _ = happyFail

action_1 (49) = happyShift action_57
action_1 (54) = happyShift action_58
action_1 (23) = happyGoto action_55
action_1 (25) = happyGoto action_59
action_1 (26) = happyGoto action_60
action_1 _ = happyFail

action_2 (49) = happyShift action_57
action_2 (54) = happyShift action_58
action_2 (23) = happyGoto action_55
action_2 (26) = happyGoto action_56
action_2 _ = happyFail

action_3 (52) = happyShift action_19
action_3 (21) = happyGoto action_53
action_3 (27) = happyGoto action_54
action_3 _ = happyReduce_26

action_4 (53) = happyShift action_34
action_4 (22) = happyGoto action_49
action_4 (28) = happyGoto action_52
action_4 _ = happyFail

action_5 (53) = happyShift action_34
action_5 (22) = happyGoto action_49
action_5 (28) = happyGoto action_50
action_5 (29) = happyGoto action_51
action_5 _ = happyReduce_29

action_6 (43) = happyShift action_47
action_6 (52) = happyShift action_19
action_6 (21) = happyGoto action_44
action_6 (30) = happyGoto action_48
action_6 _ = happyFail

action_7 (43) = happyShift action_47
action_7 (52) = happyShift action_19
action_7 (21) = happyGoto action_44
action_7 (30) = happyGoto action_45
action_7 (31) = happyGoto action_46
action_7 _ = happyFail

action_8 (32) = happyGoto action_43
action_8 _ = happyReduce_36

action_9 (43) = happyShift action_23
action_9 (48) = happyShift action_42
action_9 (52) = happyShift action_19
action_9 (21) = happyGoto action_24
action_9 (33) = happyGoto action_40
action_9 (39) = happyGoto action_25
action_9 (40) = happyGoto action_41
action_9 _ = happyFail

action_10 (43) = happyShift action_33
action_10 (52) = happyShift action_19
action_10 (53) = happyShift action_34
action_10 (21) = happyGoto action_29
action_10 (22) = happyGoto action_30
action_10 (34) = happyGoto action_38
action_10 (35) = happyGoto action_39
action_10 (36) = happyGoto action_31
action_10 (37) = happyGoto action_37
action_10 _ = happyReduce_40

action_11 (43) = happyShift action_33
action_11 (52) = happyShift action_19
action_11 (53) = happyShift action_34
action_11 (21) = happyGoto action_29
action_11 (22) = happyGoto action_30
action_11 (35) = happyGoto action_36
action_11 (36) = happyGoto action_31
action_11 (37) = happyGoto action_37
action_11 _ = happyFail

action_12 (43) = happyShift action_33
action_12 (52) = happyShift action_19
action_12 (21) = happyGoto action_29
action_12 (36) = happyGoto action_35
action_12 _ = happyFail

action_13 (43) = happyShift action_33
action_13 (52) = happyShift action_19
action_13 (53) = happyShift action_34
action_13 (21) = happyGoto action_29
action_13 (22) = happyGoto action_30
action_13 (36) = happyGoto action_31
action_13 (37) = happyGoto action_32
action_13 _ = happyFail

action_14 (38) = happyGoto action_28
action_14 _ = happyReduce_48

action_15 (43) = happyShift action_23
action_15 (52) = happyShift action_19
action_15 (21) = happyGoto action_20
action_15 (39) = happyGoto action_27
action_15 _ = happyFail

action_16 (43) = happyShift action_23
action_16 (52) = happyShift action_19
action_16 (21) = happyGoto action_24
action_16 (39) = happyGoto action_25
action_16 (40) = happyGoto action_26
action_16 _ = happyFail

action_17 (43) = happyShift action_23
action_17 (52) = happyShift action_19
action_17 (21) = happyGoto action_20
action_17 (39) = happyGoto action_21
action_17 (41) = happyGoto action_22
action_17 _ = happyFail

action_18 (52) = happyShift action_19
action_18 _ = happyFail

action_19 _ = happyReduce_18

action_20 _ = happyReduce_50

action_21 (43) = happyShift action_23
action_21 (52) = happyShift action_19
action_21 (21) = happyGoto action_20
action_21 (39) = happyGoto action_21
action_21 (41) = happyGoto action_80
action_21 _ = happyReduce_54

action_22 (55) = happyAccept
action_22 _ = happyFail

action_23 (43) = happyShift action_23
action_23 (52) = happyShift action_19
action_23 (21) = happyGoto action_24
action_23 (39) = happyGoto action_25
action_23 (40) = happyGoto action_79
action_23 _ = happyFail

action_24 (43) = happyShift action_23
action_24 (52) = happyShift action_19
action_24 (21) = happyGoto action_20
action_24 (39) = happyGoto action_21
action_24 (41) = happyGoto action_78
action_24 _ = happyReduce_50

action_25 _ = happyReduce_53

action_26 (55) = happyAccept
action_26 _ = happyFail

action_27 (55) = happyAccept
action_27 _ = happyFail

action_28 (43) = happyShift action_33
action_28 (52) = happyShift action_19
action_28 (55) = happyAccept
action_28 (21) = happyGoto action_29
action_28 (36) = happyGoto action_77
action_28 _ = happyFail

action_29 _ = happyReduce_44

action_30 (38) = happyGoto action_76
action_30 _ = happyReduce_48

action_31 _ = happyReduce_47

action_32 (55) = happyAccept
action_32 _ = happyFail

action_33 (43) = happyShift action_33
action_33 (52) = happyShift action_19
action_33 (53) = happyShift action_34
action_33 (21) = happyGoto action_29
action_33 (22) = happyGoto action_30
action_33 (36) = happyGoto action_31
action_33 (37) = happyGoto action_75
action_33 _ = happyFail

action_34 _ = happyReduce_19

action_35 (55) = happyAccept
action_35 _ = happyFail

action_36 (55) = happyAccept
action_36 _ = happyFail

action_37 (45) = happyShift action_74
action_37 _ = happyFail

action_38 (55) = happyAccept
action_38 _ = happyFail

action_39 (51) = happyShift action_73
action_39 _ = happyReduce_41

action_40 (55) = happyAccept
action_40 _ = happyFail

action_41 _ = happyReduce_39

action_42 (52) = happyShift action_19
action_42 (21) = happyGoto action_72
action_42 _ = happyFail

action_43 (43) = happyShift action_47
action_43 (52) = happyShift action_19
action_43 (55) = happyAccept
action_43 (21) = happyGoto action_44
action_43 (30) = happyGoto action_45
action_43 (31) = happyGoto action_71
action_43 _ = happyFail

action_44 _ = happyReduce_32

action_45 (45) = happyShift action_70
action_45 _ = happyReduce_35

action_46 (55) = happyAccept
action_46 _ = happyFail

action_47 (43) = happyShift action_47
action_47 (52) = happyShift action_19
action_47 (21) = happyGoto action_44
action_47 (30) = happyGoto action_45
action_47 (31) = happyGoto action_69
action_47 _ = happyFail

action_48 (55) = happyAccept
action_48 _ = happyFail

action_49 (32) = happyGoto action_68
action_49 _ = happyReduce_36

action_50 (51) = happyShift action_67
action_50 _ = happyReduce_30

action_51 (55) = happyAccept
action_51 _ = happyFail

action_52 (55) = happyAccept
action_52 _ = happyFail

action_53 (52) = happyShift action_19
action_53 (21) = happyGoto action_53
action_53 (27) = happyGoto action_66
action_53 _ = happyReduce_26

action_54 (55) = happyAccept
action_54 _ = happyFail

action_55 (46) = happyShift action_65
action_55 _ = happyFail

action_56 (55) = happyAccept
action_56 _ = happyFail

action_57 (53) = happyShift action_34
action_57 (22) = happyGoto action_64
action_57 _ = happyFail

action_58 _ = happyReduce_20

action_59 (55) = happyAccept
action_59 _ = happyFail

action_60 (49) = happyShift action_57
action_60 (54) = happyShift action_58
action_60 (23) = happyGoto action_55
action_60 (25) = happyGoto action_63
action_60 (26) = happyGoto action_60
action_60 _ = happyReduce_22

action_61 (55) = happyAccept
action_61 _ = happyFail

action_62 _ = happyReduce_21

action_63 _ = happyReduce_23

action_64 (47) = happyShift action_90
action_64 _ = happyFail

action_65 (43) = happyShift action_47
action_65 (52) = happyShift action_19
action_65 (21) = happyGoto action_44
action_65 (30) = happyGoto action_45
action_65 (31) = happyGoto action_89
action_65 _ = happyFail

action_66 _ = happyReduce_27

action_67 (53) = happyShift action_34
action_67 (22) = happyGoto action_49
action_67 (28) = happyGoto action_50
action_67 (29) = happyGoto action_88
action_67 _ = happyReduce_29

action_68 (43) = happyShift action_47
action_68 (52) = happyShift action_19
action_68 (21) = happyGoto action_44
action_68 (30) = happyGoto action_45
action_68 (31) = happyGoto action_71
action_68 _ = happyReduce_28

action_69 (44) = happyShift action_87
action_69 _ = happyFail

action_70 (43) = happyShift action_47
action_70 (52) = happyShift action_19
action_70 (21) = happyGoto action_44
action_70 (30) = happyGoto action_45
action_70 (31) = happyGoto action_86
action_70 _ = happyFail

action_71 _ = happyReduce_37

action_72 (50) = happyShift action_85
action_72 _ = happyFail

action_73 (43) = happyShift action_33
action_73 (52) = happyShift action_19
action_73 (53) = happyShift action_34
action_73 (21) = happyGoto action_29
action_73 (22) = happyGoto action_30
action_73 (34) = happyGoto action_84
action_73 (35) = happyGoto action_39
action_73 (36) = happyGoto action_31
action_73 (37) = happyGoto action_37
action_73 _ = happyReduce_40

action_74 (43) = happyShift action_23
action_74 (52) = happyShift action_19
action_74 (21) = happyGoto action_24
action_74 (39) = happyGoto action_25
action_74 (40) = happyGoto action_83
action_74 _ = happyFail

action_75 (44) = happyShift action_82
action_75 _ = happyFail

action_76 (43) = happyShift action_33
action_76 (52) = happyShift action_19
action_76 (21) = happyGoto action_29
action_76 (36) = happyGoto action_77
action_76 _ = happyReduce_46

action_77 _ = happyReduce_49

action_78 _ = happyReduce_52

action_79 (44) = happyShift action_81
action_79 _ = happyFail

action_80 _ = happyReduce_55

action_81 _ = happyReduce_51

action_82 _ = happyReduce_45

action_83 _ = happyReduce_43

action_84 _ = happyReduce_42

action_85 (43) = happyShift action_33
action_85 (52) = happyShift action_19
action_85 (53) = happyShift action_34
action_85 (21) = happyGoto action_29
action_85 (22) = happyGoto action_30
action_85 (34) = happyGoto action_93
action_85 (35) = happyGoto action_39
action_85 (36) = happyGoto action_31
action_85 (37) = happyGoto action_37
action_85 _ = happyReduce_40

action_86 _ = happyReduce_34

action_87 _ = happyReduce_33

action_88 _ = happyReduce_31

action_89 (42) = happyShift action_92
action_89 _ = happyFail

action_90 (53) = happyShift action_34
action_90 (22) = happyGoto action_49
action_90 (28) = happyGoto action_50
action_90 (29) = happyGoto action_91
action_90 _ = happyReduce_29

action_91 _ = happyReduce_24

action_92 (52) = happyShift action_19
action_92 (21) = happyGoto action_94
action_92 _ = happyFail

action_93 _ = happyReduce_38

action_94 (52) = happyShift action_19
action_94 (21) = happyGoto action_53
action_94 (27) = happyGoto action_95
action_94 _ = happyReduce_26

action_95 (47) = happyShift action_96
action_95 _ = happyFail

action_96 (43) = happyShift action_23
action_96 (48) = happyShift action_42
action_96 (52) = happyShift action_19
action_96 (21) = happyGoto action_24
action_96 (33) = happyGoto action_97
action_96 (39) = happyGoto action_25
action_96 (40) = happyGoto action_41
action_96 _ = happyFail

action_97 _ = happyReduce_25

happyReduce_18 = happySpecReduce_1  21 happyReduction_18
happyReduction_18 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn21
		 (Ident happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  22 happyReduction_19
happyReduction_19 (HappyTerminal (PT _ (T_UIdent happy_var_1)))
	 =  HappyAbsSyn22
		 (UIdent (happy_var_1)
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  23 happyReduction_20
happyReduction_20 (HappyTerminal (PT _ (T_LIdent happy_var_1)))
	 =  HappyAbsSyn23
		 (LIdent (happy_var_1)
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  24 happyReduction_21
happyReduction_21 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn24
		 (L.Abs.P happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  25 happyReduction_22
happyReduction_22 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 ((:[]) happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  25 happyReduction_23
happyReduction_23 (HappyAbsSyn25  happy_var_2)
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 26 happyReduction_24
happyReduction_24 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (L.Abs.DData happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 8 26 happyReduction_25
happyReduction_25 ((HappyAbsSyn33  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_6) `HappyStk`
	(HappyAbsSyn21  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_5 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_0  27 happyReduction_26
happyReduction_26  =  HappyAbsSyn27
		 ([]
	)

happyReduce_27 = happySpecReduce_2  27 happyReduction_27
happyReduction_27 (HappyAbsSyn27  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn27
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  28 happyReduction_28
happyReduction_28 (HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn28
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  29 happyReduction_29
happyReduction_29  =  HappyAbsSyn29
		 ([]
	)

happyReduce_30 = happySpecReduce_1  29 happyReduction_30
happyReduction_30 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn29
		 ((:[]) happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  29 happyReduction_31
happyReduction_31 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  30 happyReduction_32
happyReduction_32 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  30 happyReduction_33
happyReduction_33 _
	(HappyAbsSyn30  happy_var_2)
	_
	 =  HappyAbsSyn30
		 (happy_var_2
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  31 happyReduction_34
happyReduction_34 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  31 happyReduction_35
happyReduction_35 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn30
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_0  32 happyReduction_36
happyReduction_36  =  HappyAbsSyn32
		 ([]
	)

happyReduce_37 = happySpecReduce_2  32 happyReduction_37
happyReduction_37 (HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happyReduce 4 33 happyReduction_38
happyReduction_38 ((HappyAbsSyn34  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn21  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (L.Abs.BCase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_39 = happySpecReduce_1  33 happyReduction_39
happyReduction_39 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn33
		 (L.Abs.BExpr happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_0  34 happyReduction_40
happyReduction_40  =  HappyAbsSyn34
		 ([]
	)

happyReduce_41 = happySpecReduce_1  34 happyReduction_41
happyReduction_41 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 ((:[]) happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  34 happyReduction_42
happyReduction_42 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_3  35 happyReduction_43
happyReduction_43 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_43 _ _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  36 happyReduction_44
happyReduction_44 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.PVar happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  36 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn36
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  37 happyReduction_46
happyReduction_46 (HappyAbsSyn38  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.PCon happy_var_1 (reverse happy_var_2)
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  37 happyReduction_47
happyReduction_47 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_0  38 happyReduction_48
happyReduction_48  =  HappyAbsSyn38
		 ([]
	)

happyReduce_49 = happySpecReduce_2  38 happyReduction_49
happyReduction_49 (HappyAbsSyn36  happy_var_2)
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_49 _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  39 happyReduction_50
happyReduction_50 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.EVar happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  39 happyReduction_51
happyReduction_51 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn39
		 (happy_var_2
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  40 happyReduction_52
happyReduction_52 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  40 happyReduction_53
happyReduction_53 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  41 happyReduction_54
happyReduction_54 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn41
		 ((:[]) happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  41 happyReduction_55
happyReduction_55 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn41
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 42;
	PT _ (TS _ 2) -> cont 43;
	PT _ (TS _ 3) -> cont 44;
	PT _ (TS _ 4) -> cont 45;
	PT _ (TS _ 5) -> cont 46;
	PT _ (TS _ 6) -> cont 47;
	PT _ (TS _ 7) -> cont 48;
	PT _ (TS _ 8) -> cont 49;
	PT _ (TS _ 9) -> cont 50;
	PT _ (TS _ 10) -> cont 51;
	PT _ (TV happy_dollar_dollar) -> cont 52;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 53;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 54;
	_ -> happyError' (tk:tks)
	}

happyError_ 55 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => [(Token)] -> Err a
happyError' = happyError

pProgram tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn24 z -> happyReturn z; _other -> notHappyAtAll })

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn25 z -> happyReturn z; _other -> notHappyAtAll })

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn26 z -> happyReturn z; _other -> notHappyAtAll })

pListIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pBody tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn33 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/home/dagit/Downloads/haskell-platform/build/ghc-bindist/local/lib/ghc-8.0.1/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc21507_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
