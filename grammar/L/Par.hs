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
	| HappyAbsSyn22 (Ident)
	| HappyAbsSyn23 (UIdent)
	| HappyAbsSyn24 (LIdent)
	| HappyAbsSyn25 (Program)
	| HappyAbsSyn26 ([Decl])
	| HappyAbsSyn27 (Decl)
	| HappyAbsSyn28 (FunDecl)
	| HappyAbsSyn29 ([Ident])
	| HappyAbsSyn30 (Constructor)
	| HappyAbsSyn31 ([Constructor])
	| HappyAbsSyn32 (Type)
	| HappyAbsSyn34 ([Type])
	| HappyAbsSyn35 (Body)
	| HappyAbsSyn36 ([Alt])
	| HappyAbsSyn37 (Alt)
	| HappyAbsSyn38 (Pat)
	| HappyAbsSyn40 ([Pat])
	| HappyAbsSyn41 (Expr)
	| HappyAbsSyn43 ([Expr])

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
 action_97,
 action_98,
 action_99,
 action_100 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_55,
 happyReduce_56,
 happyReduce_57 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (51) = happyShift action_61
action_0 (56) = happyShift action_58
action_0 (24) = happyGoto action_56
action_0 (25) = happyGoto action_64
action_0 (26) = happyGoto action_65
action_0 (27) = happyGoto action_63
action_0 (28) = happyGoto action_60
action_0 _ = happyFail

action_1 (51) = happyShift action_61
action_1 (56) = happyShift action_58
action_1 (24) = happyGoto action_56
action_1 (26) = happyGoto action_62
action_1 (27) = happyGoto action_63
action_1 (28) = happyGoto action_60
action_1 _ = happyFail

action_2 (51) = happyShift action_61
action_2 (56) = happyShift action_58
action_2 (24) = happyGoto action_56
action_2 (27) = happyGoto action_59
action_2 (28) = happyGoto action_60
action_2 _ = happyFail

action_3 (56) = happyShift action_58
action_3 (24) = happyGoto action_56
action_3 (28) = happyGoto action_57
action_3 _ = happyFail

action_4 (54) = happyShift action_20
action_4 (22) = happyGoto action_54
action_4 (29) = happyGoto action_55
action_4 _ = happyReduce_28

action_5 (55) = happyShift action_35
action_5 (23) = happyGoto action_50
action_5 (30) = happyGoto action_53
action_5 _ = happyFail

action_6 (55) = happyShift action_35
action_6 (23) = happyGoto action_50
action_6 (30) = happyGoto action_51
action_6 (31) = happyGoto action_52
action_6 _ = happyReduce_31

action_7 (45) = happyShift action_48
action_7 (54) = happyShift action_20
action_7 (22) = happyGoto action_45
action_7 (32) = happyGoto action_49
action_7 _ = happyFail

action_8 (45) = happyShift action_48
action_8 (54) = happyShift action_20
action_8 (22) = happyGoto action_45
action_8 (32) = happyGoto action_46
action_8 (33) = happyGoto action_47
action_8 _ = happyFail

action_9 (34) = happyGoto action_44
action_9 _ = happyReduce_38

action_10 (45) = happyShift action_24
action_10 (50) = happyShift action_43
action_10 (54) = happyShift action_20
action_10 (22) = happyGoto action_25
action_10 (35) = happyGoto action_41
action_10 (41) = happyGoto action_26
action_10 (42) = happyGoto action_42
action_10 _ = happyFail

action_11 (45) = happyShift action_34
action_11 (54) = happyShift action_20
action_11 (55) = happyShift action_35
action_11 (22) = happyGoto action_30
action_11 (23) = happyGoto action_31
action_11 (36) = happyGoto action_39
action_11 (37) = happyGoto action_40
action_11 (38) = happyGoto action_32
action_11 (39) = happyGoto action_38
action_11 _ = happyReduce_42

action_12 (45) = happyShift action_34
action_12 (54) = happyShift action_20
action_12 (55) = happyShift action_35
action_12 (22) = happyGoto action_30
action_12 (23) = happyGoto action_31
action_12 (37) = happyGoto action_37
action_12 (38) = happyGoto action_32
action_12 (39) = happyGoto action_38
action_12 _ = happyFail

action_13 (45) = happyShift action_34
action_13 (54) = happyShift action_20
action_13 (22) = happyGoto action_30
action_13 (38) = happyGoto action_36
action_13 _ = happyFail

action_14 (45) = happyShift action_34
action_14 (54) = happyShift action_20
action_14 (55) = happyShift action_35
action_14 (22) = happyGoto action_30
action_14 (23) = happyGoto action_31
action_14 (38) = happyGoto action_32
action_14 (39) = happyGoto action_33
action_14 _ = happyFail

action_15 (40) = happyGoto action_29
action_15 _ = happyReduce_50

action_16 (45) = happyShift action_24
action_16 (54) = happyShift action_20
action_16 (22) = happyGoto action_21
action_16 (41) = happyGoto action_28
action_16 _ = happyFail

action_17 (45) = happyShift action_24
action_17 (54) = happyShift action_20
action_17 (22) = happyGoto action_25
action_17 (41) = happyGoto action_26
action_17 (42) = happyGoto action_27
action_17 _ = happyFail

action_18 (45) = happyShift action_24
action_18 (54) = happyShift action_20
action_18 (22) = happyGoto action_21
action_18 (41) = happyGoto action_22
action_18 (43) = happyGoto action_23
action_18 _ = happyFail

action_19 (54) = happyShift action_20
action_19 _ = happyFail

action_20 _ = happyReduce_19

action_21 _ = happyReduce_52

action_22 (45) = happyShift action_24
action_22 (54) = happyShift action_20
action_22 (22) = happyGoto action_21
action_22 (41) = happyGoto action_22
action_22 (43) = happyGoto action_83
action_22 _ = happyReduce_56

action_23 (57) = happyAccept
action_23 _ = happyFail

action_24 (45) = happyShift action_24
action_24 (54) = happyShift action_20
action_24 (22) = happyGoto action_25
action_24 (41) = happyGoto action_26
action_24 (42) = happyGoto action_82
action_24 _ = happyFail

action_25 (45) = happyShift action_24
action_25 (54) = happyShift action_20
action_25 (22) = happyGoto action_21
action_25 (41) = happyGoto action_22
action_25 (43) = happyGoto action_81
action_25 _ = happyReduce_52

action_26 _ = happyReduce_55

action_27 (57) = happyAccept
action_27 _ = happyFail

action_28 (57) = happyAccept
action_28 _ = happyFail

action_29 (45) = happyShift action_34
action_29 (54) = happyShift action_20
action_29 (57) = happyAccept
action_29 (22) = happyGoto action_30
action_29 (38) = happyGoto action_80
action_29 _ = happyFail

action_30 _ = happyReduce_46

action_31 (40) = happyGoto action_79
action_31 _ = happyReduce_50

action_32 _ = happyReduce_49

action_33 (57) = happyAccept
action_33 _ = happyFail

action_34 (45) = happyShift action_34
action_34 (54) = happyShift action_20
action_34 (55) = happyShift action_35
action_34 (22) = happyGoto action_30
action_34 (23) = happyGoto action_31
action_34 (38) = happyGoto action_32
action_34 (39) = happyGoto action_78
action_34 _ = happyFail

action_35 _ = happyReduce_20

action_36 (57) = happyAccept
action_36 _ = happyFail

action_37 (57) = happyAccept
action_37 _ = happyFail

action_38 (47) = happyShift action_77
action_38 _ = happyFail

action_39 (57) = happyAccept
action_39 _ = happyFail

action_40 (53) = happyShift action_76
action_40 _ = happyReduce_43

action_41 (57) = happyAccept
action_41 _ = happyFail

action_42 _ = happyReduce_41

action_43 (54) = happyShift action_20
action_43 (22) = happyGoto action_75
action_43 _ = happyFail

action_44 (45) = happyShift action_48
action_44 (54) = happyShift action_20
action_44 (57) = happyAccept
action_44 (22) = happyGoto action_45
action_44 (32) = happyGoto action_46
action_44 (33) = happyGoto action_74
action_44 _ = happyFail

action_45 _ = happyReduce_34

action_46 (47) = happyShift action_73
action_46 _ = happyReduce_37

action_47 (57) = happyAccept
action_47 _ = happyFail

action_48 (45) = happyShift action_48
action_48 (54) = happyShift action_20
action_48 (22) = happyGoto action_45
action_48 (32) = happyGoto action_46
action_48 (33) = happyGoto action_72
action_48 _ = happyFail

action_49 (57) = happyAccept
action_49 _ = happyFail

action_50 (34) = happyGoto action_71
action_50 _ = happyReduce_38

action_51 (53) = happyShift action_70
action_51 _ = happyReduce_32

action_52 (57) = happyAccept
action_52 _ = happyFail

action_53 (57) = happyAccept
action_53 _ = happyFail

action_54 (54) = happyShift action_20
action_54 (22) = happyGoto action_54
action_54 (29) = happyGoto action_69
action_54 _ = happyReduce_28

action_55 (57) = happyAccept
action_55 _ = happyFail

action_56 (48) = happyShift action_68
action_56 _ = happyFail

action_57 (57) = happyAccept
action_57 _ = happyFail

action_58 _ = happyReduce_21

action_59 (57) = happyAccept
action_59 _ = happyFail

action_60 _ = happyReduce_26

action_61 (55) = happyShift action_35
action_61 (23) = happyGoto action_67
action_61 _ = happyFail

action_62 (57) = happyAccept
action_62 _ = happyFail

action_63 (51) = happyShift action_61
action_63 (56) = happyShift action_58
action_63 (24) = happyGoto action_56
action_63 (26) = happyGoto action_66
action_63 (27) = happyGoto action_63
action_63 (28) = happyGoto action_60
action_63 _ = happyReduce_23

action_64 (57) = happyAccept
action_64 _ = happyFail

action_65 _ = happyReduce_22

action_66 _ = happyReduce_24

action_67 (49) = happyShift action_93
action_67 _ = happyFail

action_68 (45) = happyShift action_48
action_68 (54) = happyShift action_20
action_68 (22) = happyGoto action_45
action_68 (32) = happyGoto action_46
action_68 (33) = happyGoto action_92
action_68 _ = happyFail

action_69 _ = happyReduce_29

action_70 (55) = happyShift action_35
action_70 (23) = happyGoto action_50
action_70 (30) = happyGoto action_51
action_70 (31) = happyGoto action_91
action_70 _ = happyReduce_31

action_71 (45) = happyShift action_48
action_71 (54) = happyShift action_20
action_71 (22) = happyGoto action_45
action_71 (32) = happyGoto action_46
action_71 (33) = happyGoto action_74
action_71 _ = happyReduce_30

action_72 (46) = happyShift action_90
action_72 _ = happyFail

action_73 (45) = happyShift action_48
action_73 (54) = happyShift action_20
action_73 (22) = happyGoto action_45
action_73 (32) = happyGoto action_46
action_73 (33) = happyGoto action_89
action_73 _ = happyFail

action_74 _ = happyReduce_39

action_75 (52) = happyShift action_88
action_75 _ = happyFail

action_76 (45) = happyShift action_34
action_76 (54) = happyShift action_20
action_76 (55) = happyShift action_35
action_76 (22) = happyGoto action_30
action_76 (23) = happyGoto action_31
action_76 (36) = happyGoto action_87
action_76 (37) = happyGoto action_40
action_76 (38) = happyGoto action_32
action_76 (39) = happyGoto action_38
action_76 _ = happyReduce_42

action_77 (45) = happyShift action_24
action_77 (54) = happyShift action_20
action_77 (22) = happyGoto action_25
action_77 (41) = happyGoto action_26
action_77 (42) = happyGoto action_86
action_77 _ = happyFail

action_78 (46) = happyShift action_85
action_78 _ = happyFail

action_79 (45) = happyShift action_34
action_79 (54) = happyShift action_20
action_79 (22) = happyGoto action_30
action_79 (38) = happyGoto action_80
action_79 _ = happyReduce_48

action_80 _ = happyReduce_51

action_81 _ = happyReduce_54

action_82 (46) = happyShift action_84
action_82 _ = happyFail

action_83 _ = happyReduce_57

action_84 _ = happyReduce_53

action_85 _ = happyReduce_47

action_86 _ = happyReduce_45

action_87 _ = happyReduce_44

action_88 (45) = happyShift action_34
action_88 (54) = happyShift action_20
action_88 (55) = happyShift action_35
action_88 (22) = happyGoto action_30
action_88 (23) = happyGoto action_31
action_88 (36) = happyGoto action_96
action_88 (37) = happyGoto action_40
action_88 (38) = happyGoto action_32
action_88 (39) = happyGoto action_38
action_88 _ = happyReduce_42

action_89 _ = happyReduce_36

action_90 _ = happyReduce_35

action_91 _ = happyReduce_33

action_92 (44) = happyShift action_95
action_92 _ = happyFail

action_93 (55) = happyShift action_35
action_93 (23) = happyGoto action_50
action_93 (30) = happyGoto action_51
action_93 (31) = happyGoto action_94
action_93 _ = happyReduce_31

action_94 _ = happyReduce_25

action_95 (54) = happyShift action_20
action_95 (22) = happyGoto action_97
action_95 _ = happyFail

action_96 _ = happyReduce_40

action_97 (54) = happyShift action_20
action_97 (22) = happyGoto action_54
action_97 (29) = happyGoto action_98
action_97 _ = happyReduce_28

action_98 (49) = happyShift action_99
action_98 _ = happyFail

action_99 (45) = happyShift action_24
action_99 (50) = happyShift action_43
action_99 (54) = happyShift action_20
action_99 (22) = happyGoto action_25
action_99 (35) = happyGoto action_100
action_99 (41) = happyGoto action_26
action_99 (42) = happyGoto action_42
action_99 _ = happyFail

action_100 _ = happyReduce_27

happyReduce_19 = happySpecReduce_1  22 happyReduction_19
happyReduction_19 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn22
		 (Ident happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  23 happyReduction_20
happyReduction_20 (HappyTerminal (PT _ (T_UIdent happy_var_1)))
	 =  HappyAbsSyn23
		 (UIdent (happy_var_1)
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  24 happyReduction_21
happyReduction_21 (HappyTerminal (PT _ (T_LIdent happy_var_1)))
	 =  HappyAbsSyn24
		 (LIdent (happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  25 happyReduction_22
happyReduction_22 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 (L.Abs.P happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  26 happyReduction_23
happyReduction_23 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((:[]) happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  26 happyReduction_24
happyReduction_24 (HappyAbsSyn26  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 27 happyReduction_25
happyReduction_25 ((HappyAbsSyn31  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (L.Abs.DData happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  27 happyReduction_26
happyReduction_26 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (L.Abs.DFun happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happyReduce 8 28 happyReduction_27
happyReduction_27 ((HappyAbsSyn35  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_6) `HappyStk`
	(HappyAbsSyn22  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (L.Abs.FD happy_var_1 happy_var_3 happy_var_5 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_0  29 happyReduction_28
happyReduction_28  =  HappyAbsSyn29
		 ([]
	)

happyReduce_29 = happySpecReduce_2  29 happyReduction_29
happyReduction_29 (HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  30 happyReduction_30
happyReduction_30 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_0  31 happyReduction_31
happyReduction_31  =  HappyAbsSyn31
		 ([]
	)

happyReduce_32 = happySpecReduce_1  31 happyReduction_32
happyReduction_32 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn31
		 ((:[]) happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  31 happyReduction_33
happyReduction_33 (HappyAbsSyn31  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn31
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  32 happyReduction_34
happyReduction_34 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  32 happyReduction_35
happyReduction_35 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (happy_var_2
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  33 happyReduction_36
happyReduction_36 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  33 happyReduction_37
happyReduction_37 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_0  34 happyReduction_38
happyReduction_38  =  HappyAbsSyn34
		 ([]
	)

happyReduce_39 = happySpecReduce_2  34 happyReduction_39
happyReduction_39 (HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happyReduce 4 35 happyReduction_40
happyReduction_40 ((HappyAbsSyn36  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn35
		 (L.Abs.BCase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_41 = happySpecReduce_1  35 happyReduction_41
happyReduction_41 (HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.BExpr happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  36 happyReduction_42
happyReduction_42  =  HappyAbsSyn36
		 ([]
	)

happyReduce_43 = happySpecReduce_1  36 happyReduction_43
happyReduction_43 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 ((:[]) happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  36 happyReduction_44
happyReduction_44 (HappyAbsSyn36  happy_var_3)
	_
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  37 happyReduction_45
happyReduction_45 (HappyAbsSyn41  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn37
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  38 happyReduction_46
happyReduction_46 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.PVar happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  38 happyReduction_47
happyReduction_47 _
	(HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (happy_var_2
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_2  39 happyReduction_48
happyReduction_48 (HappyAbsSyn40  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.PCon happy_var_1 (reverse happy_var_2)
	)
happyReduction_48 _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  39 happyReduction_49
happyReduction_49 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_0  40 happyReduction_50
happyReduction_50  =  HappyAbsSyn40
		 ([]
	)

happyReduce_51 = happySpecReduce_2  40 happyReduction_51
happyReduction_51 (HappyAbsSyn38  happy_var_2)
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  41 happyReduction_52
happyReduction_52 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn41
		 (L.Abs.EVar happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_3  41 happyReduction_53
happyReduction_53 _
	(HappyAbsSyn41  happy_var_2)
	_
	 =  HappyAbsSyn41
		 (happy_var_2
	)
happyReduction_53 _ _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_2  42 happyReduction_54
happyReduction_54 (HappyAbsSyn43  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn41
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_54 _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  42 happyReduction_55
happyReduction_55 (HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn41
		 (happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  43 happyReduction_56
happyReduction_56 (HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn43
		 ((:[]) happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  43 happyReduction_57
happyReduction_57 (HappyAbsSyn43  happy_var_2)
	(HappyAbsSyn41  happy_var_1)
	 =  HappyAbsSyn43
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 57 57 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 44;
	PT _ (TS _ 2) -> cont 45;
	PT _ (TS _ 3) -> cont 46;
	PT _ (TS _ 4) -> cont 47;
	PT _ (TS _ 5) -> cont 48;
	PT _ (TS _ 6) -> cont 49;
	PT _ (TS _ 7) -> cont 50;
	PT _ (TS _ 8) -> cont 51;
	PT _ (TS _ 9) -> cont 52;
	PT _ (TS _ 10) -> cont 53;
	PT _ (TV happy_dollar_dollar) -> cont 54;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 55;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 56;
	_ -> happyError' (tk:tks)
	}

happyError_ 57 tk tks = happyError' tks
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
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn25 z -> happyReturn z; _other -> notHappyAtAll })

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn26 z -> happyReturn z; _other -> notHappyAtAll })

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pFunDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pListIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pListType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pBody tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn43 z -> happyReturn z; _other -> notHappyAtAll })

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
