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
	| HappyAbsSyn22 (UIdent)
	| HappyAbsSyn23 (LIdent)
	| HappyAbsSyn24 (Program)
	| HappyAbsSyn25 ([Decl])
	| HappyAbsSyn26 (Decl)
	| HappyAbsSyn27 ([Constructor])
	| HappyAbsSyn28 ([LIdent])
	| HappyAbsSyn29 (Proposition)
	| HappyAbsSyn30 (Constructor)
	| HappyAbsSyn31 ([Type])
	| HappyAbsSyn32 (Type)
	| HappyAbsSyn34 (Body)
	| HappyAbsSyn35 ([Alt])
	| HappyAbsSyn36 (Alt)
	| HappyAbsSyn37 (Pat)
	| HappyAbsSyn39 ([Pat])
	| HappyAbsSyn40 (Expr)
	| HappyAbsSyn42 ([Expr])

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
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113 :: () => Int -> ({-HappyReduction (Err) = -}
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
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (51) = happyShift action_63
action_0 (54) = happyShift action_64
action_0 (57) = happyShift action_26
action_0 (23) = happyGoto action_61
action_0 (24) = happyGoto action_67
action_0 (25) = happyGoto action_68
action_0 (26) = happyGoto action_66
action_0 _ = happyFail

action_1 (51) = happyShift action_63
action_1 (54) = happyShift action_64
action_1 (57) = happyShift action_26
action_1 (23) = happyGoto action_61
action_1 (25) = happyGoto action_65
action_1 (26) = happyGoto action_66
action_1 _ = happyFail

action_2 (51) = happyShift action_63
action_2 (54) = happyShift action_64
action_2 (57) = happyShift action_26
action_2 (23) = happyGoto action_61
action_2 (26) = happyGoto action_62
action_2 _ = happyFail

action_3 (56) = happyShift action_20
action_3 (22) = happyGoto action_52
action_3 (27) = happyGoto action_59
action_3 (30) = happyGoto action_60
action_3 _ = happyReduce_27

action_4 (57) = happyShift action_26
action_4 (23) = happyGoto action_57
action_4 (28) = happyGoto action_58
action_4 _ = happyReduce_30

action_5 (43) = happyShift action_25
action_5 (52) = happyShift action_56
action_5 (56) = happyShift action_20
action_5 (57) = happyShift action_26
action_5 (22) = happyGoto action_27
action_5 (23) = happyGoto action_28
action_5 (29) = happyGoto action_54
action_5 (40) = happyGoto action_29
action_5 (41) = happyGoto action_55
action_5 _ = happyFail

action_6 (56) = happyShift action_20
action_6 (22) = happyGoto action_52
action_6 (30) = happyGoto action_53
action_6 _ = happyFail

action_7 (31) = happyGoto action_51
action_7 _ = happyReduce_36

action_8 (43) = happyShift action_49
action_8 (56) = happyShift action_20
action_8 (22) = happyGoto action_46
action_8 (32) = happyGoto action_50
action_8 _ = happyFail

action_9 (43) = happyShift action_49
action_9 (56) = happyShift action_20
action_9 (22) = happyGoto action_46
action_9 (32) = happyGoto action_47
action_9 (33) = happyGoto action_48
action_9 _ = happyFail

action_10 (43) = happyShift action_25
action_10 (50) = happyShift action_45
action_10 (56) = happyShift action_20
action_10 (57) = happyShift action_26
action_10 (22) = happyGoto action_27
action_10 (23) = happyGoto action_28
action_10 (34) = happyGoto action_43
action_10 (40) = happyGoto action_29
action_10 (41) = happyGoto action_44
action_10 _ = happyFail

action_11 (43) = happyShift action_37
action_11 (56) = happyShift action_20
action_11 (57) = happyShift action_26
action_11 (22) = happyGoto action_33
action_11 (23) = happyGoto action_34
action_11 (35) = happyGoto action_41
action_11 (36) = happyGoto action_42
action_11 (37) = happyGoto action_35
action_11 (38) = happyGoto action_40
action_11 _ = happyReduce_44

action_12 (43) = happyShift action_37
action_12 (56) = happyShift action_20
action_12 (57) = happyShift action_26
action_12 (22) = happyGoto action_33
action_12 (23) = happyGoto action_34
action_12 (36) = happyGoto action_39
action_12 (37) = happyGoto action_35
action_12 (38) = happyGoto action_40
action_12 _ = happyFail

action_13 (43) = happyShift action_37
action_13 (57) = happyShift action_26
action_13 (23) = happyGoto action_34
action_13 (37) = happyGoto action_38
action_13 _ = happyFail

action_14 (43) = happyShift action_37
action_14 (56) = happyShift action_20
action_14 (57) = happyShift action_26
action_14 (22) = happyGoto action_33
action_14 (23) = happyGoto action_34
action_14 (37) = happyGoto action_35
action_14 (38) = happyGoto action_36
action_14 _ = happyFail

action_15 (39) = happyGoto action_32
action_15 _ = happyReduce_52

action_16 (43) = happyShift action_25
action_16 (56) = happyShift action_20
action_16 (57) = happyShift action_26
action_16 (22) = happyGoto action_21
action_16 (23) = happyGoto action_22
action_16 (40) = happyGoto action_31
action_16 _ = happyFail

action_17 (43) = happyShift action_25
action_17 (56) = happyShift action_20
action_17 (57) = happyShift action_26
action_17 (22) = happyGoto action_27
action_17 (23) = happyGoto action_28
action_17 (40) = happyGoto action_29
action_17 (41) = happyGoto action_30
action_17 _ = happyFail

action_18 (43) = happyShift action_25
action_18 (56) = happyShift action_20
action_18 (57) = happyShift action_26
action_18 (22) = happyGoto action_21
action_18 (23) = happyGoto action_22
action_18 (40) = happyGoto action_23
action_18 (42) = happyGoto action_24
action_18 _ = happyFail

action_19 (56) = happyShift action_20
action_19 _ = happyFail

action_20 _ = happyReduce_19

action_21 _ = happyReduce_55

action_22 _ = happyReduce_54

action_23 (43) = happyShift action_25
action_23 (56) = happyShift action_20
action_23 (57) = happyShift action_26
action_23 (22) = happyGoto action_21
action_23 (23) = happyGoto action_22
action_23 (40) = happyGoto action_23
action_23 (42) = happyGoto action_90
action_23 _ = happyReduce_60

action_24 (58) = happyAccept
action_24 _ = happyFail

action_25 (43) = happyShift action_25
action_25 (56) = happyShift action_20
action_25 (57) = happyShift action_26
action_25 (22) = happyGoto action_27
action_25 (23) = happyGoto action_28
action_25 (40) = happyGoto action_29
action_25 (41) = happyGoto action_89
action_25 _ = happyFail

action_26 _ = happyReduce_20

action_27 (43) = happyShift action_25
action_27 (56) = happyShift action_20
action_27 (57) = happyShift action_26
action_27 (22) = happyGoto action_21
action_27 (23) = happyGoto action_22
action_27 (40) = happyGoto action_23
action_27 (42) = happyGoto action_88
action_27 _ = happyReduce_55

action_28 (43) = happyShift action_25
action_28 (56) = happyShift action_20
action_28 (57) = happyShift action_26
action_28 (22) = happyGoto action_21
action_28 (23) = happyGoto action_22
action_28 (40) = happyGoto action_23
action_28 (42) = happyGoto action_87
action_28 _ = happyReduce_54

action_29 _ = happyReduce_59

action_30 (58) = happyAccept
action_30 _ = happyFail

action_31 (58) = happyAccept
action_31 _ = happyFail

action_32 (43) = happyShift action_37
action_32 (57) = happyShift action_26
action_32 (58) = happyAccept
action_32 (23) = happyGoto action_34
action_32 (37) = happyGoto action_86
action_32 _ = happyFail

action_33 (39) = happyGoto action_85
action_33 _ = happyReduce_52

action_34 _ = happyReduce_48

action_35 _ = happyReduce_51

action_36 (58) = happyAccept
action_36 _ = happyFail

action_37 (43) = happyShift action_37
action_37 (56) = happyShift action_20
action_37 (57) = happyShift action_26
action_37 (22) = happyGoto action_33
action_37 (23) = happyGoto action_34
action_37 (37) = happyGoto action_35
action_37 (38) = happyGoto action_84
action_37 _ = happyFail

action_38 (58) = happyAccept
action_38 _ = happyFail

action_39 (58) = happyAccept
action_39 _ = happyFail

action_40 (45) = happyShift action_83
action_40 _ = happyFail

action_41 (58) = happyAccept
action_41 _ = happyFail

action_42 (55) = happyShift action_82
action_42 _ = happyReduce_45

action_43 (58) = happyAccept
action_43 _ = happyFail

action_44 _ = happyReduce_43

action_45 (57) = happyShift action_26
action_45 (23) = happyGoto action_81
action_45 _ = happyFail

action_46 _ = happyReduce_38

action_47 (45) = happyShift action_80
action_47 _ = happyReduce_41

action_48 (58) = happyAccept
action_48 _ = happyFail

action_49 (43) = happyShift action_49
action_49 (56) = happyShift action_20
action_49 (22) = happyGoto action_46
action_49 (32) = happyGoto action_47
action_49 (33) = happyGoto action_79
action_49 _ = happyFail

action_50 (58) = happyAccept
action_50 _ = happyFail

action_51 (43) = happyShift action_49
action_51 (56) = happyShift action_20
action_51 (58) = happyAccept
action_51 (22) = happyGoto action_46
action_51 (32) = happyGoto action_47
action_51 (33) = happyGoto action_78
action_51 _ = happyFail

action_52 (31) = happyGoto action_77
action_52 _ = happyReduce_36

action_53 (58) = happyAccept
action_53 _ = happyFail

action_54 (58) = happyAccept
action_54 _ = happyFail

action_55 (49) = happyShift action_76
action_55 _ = happyReduce_34

action_56 (57) = happyShift action_26
action_56 (23) = happyGoto action_75
action_56 _ = happyFail

action_57 (57) = happyShift action_26
action_57 (23) = happyGoto action_57
action_57 (28) = happyGoto action_74
action_57 _ = happyReduce_30

action_58 (58) = happyAccept
action_58 _ = happyFail

action_59 (58) = happyAccept
action_59 _ = happyFail

action_60 (55) = happyShift action_73
action_60 _ = happyReduce_28

action_61 (47) = happyShift action_72
action_61 _ = happyFail

action_62 (58) = happyAccept
action_62 _ = happyFail

action_63 (56) = happyShift action_20
action_63 (22) = happyGoto action_71
action_63 _ = happyFail

action_64 (57) = happyShift action_26
action_64 (23) = happyGoto action_70
action_64 _ = happyFail

action_65 (58) = happyAccept
action_65 _ = happyFail

action_66 (48) = happyShift action_69
action_66 _ = happyFail

action_67 (58) = happyAccept
action_67 _ = happyFail

action_68 _ = happyReduce_21

action_69 (51) = happyShift action_63
action_69 (54) = happyShift action_64
action_69 (57) = happyShift action_26
action_69 (23) = happyGoto action_61
action_69 (25) = happyGoto action_104
action_69 (26) = happyGoto action_66
action_69 _ = happyReduce_22

action_70 (43) = happyShift action_25
action_70 (52) = happyShift action_56
action_70 (56) = happyShift action_20
action_70 (57) = happyShift action_26
action_70 (22) = happyGoto action_27
action_70 (23) = happyGoto action_28
action_70 (29) = happyGoto action_103
action_70 (40) = happyGoto action_29
action_70 (41) = happyGoto action_55
action_70 _ = happyFail

action_71 (49) = happyShift action_102
action_71 _ = happyFail

action_72 (43) = happyShift action_49
action_72 (56) = happyShift action_20
action_72 (22) = happyGoto action_46
action_72 (32) = happyGoto action_47
action_72 (33) = happyGoto action_101
action_72 _ = happyFail

action_73 (56) = happyShift action_20
action_73 (22) = happyGoto action_52
action_73 (27) = happyGoto action_100
action_73 (30) = happyGoto action_60
action_73 _ = happyReduce_27

action_74 _ = happyReduce_31

action_75 (47) = happyShift action_99
action_75 _ = happyFail

action_76 (43) = happyShift action_25
action_76 (56) = happyShift action_20
action_76 (57) = happyShift action_26
action_76 (22) = happyGoto action_27
action_76 (23) = happyGoto action_28
action_76 (40) = happyGoto action_29
action_76 (41) = happyGoto action_98
action_76 _ = happyFail

action_77 (43) = happyShift action_49
action_77 (56) = happyShift action_20
action_77 (22) = happyGoto action_46
action_77 (32) = happyGoto action_47
action_77 (33) = happyGoto action_78
action_77 _ = happyReduce_35

action_78 _ = happyReduce_37

action_79 (44) = happyShift action_97
action_79 _ = happyFail

action_80 (43) = happyShift action_49
action_80 (56) = happyShift action_20
action_80 (22) = happyGoto action_46
action_80 (32) = happyGoto action_47
action_80 (33) = happyGoto action_96
action_80 _ = happyFail

action_81 (53) = happyShift action_95
action_81 _ = happyFail

action_82 (43) = happyShift action_37
action_82 (56) = happyShift action_20
action_82 (57) = happyShift action_26
action_82 (22) = happyGoto action_33
action_82 (23) = happyGoto action_34
action_82 (35) = happyGoto action_94
action_82 (36) = happyGoto action_42
action_82 (37) = happyGoto action_35
action_82 (38) = happyGoto action_40
action_82 _ = happyReduce_44

action_83 (43) = happyShift action_25
action_83 (56) = happyShift action_20
action_83 (57) = happyShift action_26
action_83 (22) = happyGoto action_27
action_83 (23) = happyGoto action_28
action_83 (40) = happyGoto action_29
action_83 (41) = happyGoto action_93
action_83 _ = happyFail

action_84 (44) = happyShift action_92
action_84 _ = happyFail

action_85 (43) = happyShift action_37
action_85 (57) = happyShift action_26
action_85 (23) = happyGoto action_34
action_85 (37) = happyGoto action_86
action_85 _ = happyReduce_50

action_86 _ = happyReduce_53

action_87 _ = happyReduce_57

action_88 _ = happyReduce_58

action_89 (44) = happyShift action_91
action_89 _ = happyFail

action_90 _ = happyReduce_61

action_91 _ = happyReduce_56

action_92 _ = happyReduce_49

action_93 _ = happyReduce_47

action_94 _ = happyReduce_46

action_95 (43) = happyShift action_37
action_95 (56) = happyShift action_20
action_95 (57) = happyShift action_26
action_95 (22) = happyGoto action_33
action_95 (23) = happyGoto action_34
action_95 (35) = happyGoto action_108
action_95 (36) = happyGoto action_42
action_95 (37) = happyGoto action_35
action_95 (38) = happyGoto action_40
action_95 _ = happyReduce_44

action_96 _ = happyReduce_40

action_97 _ = happyReduce_39

action_98 _ = happyReduce_33

action_99 (43) = happyShift action_49
action_99 (56) = happyShift action_20
action_99 (22) = happyGoto action_46
action_99 (32) = happyGoto action_47
action_99 (33) = happyGoto action_107
action_99 _ = happyFail

action_100 _ = happyReduce_29

action_101 (57) = happyShift action_26
action_101 (23) = happyGoto action_106
action_101 _ = happyFail

action_102 (56) = happyShift action_20
action_102 (22) = happyGoto action_52
action_102 (27) = happyGoto action_105
action_102 (30) = happyGoto action_60
action_102 _ = happyReduce_27

action_103 _ = happyReduce_26

action_104 _ = happyReduce_23

action_105 _ = happyReduce_24

action_106 (57) = happyShift action_26
action_106 (23) = happyGoto action_57
action_106 (28) = happyGoto action_110
action_106 _ = happyReduce_30

action_107 (46) = happyShift action_109
action_107 _ = happyFail

action_108 _ = happyReduce_42

action_109 (43) = happyShift action_25
action_109 (52) = happyShift action_56
action_109 (56) = happyShift action_20
action_109 (57) = happyShift action_26
action_109 (22) = happyGoto action_27
action_109 (23) = happyGoto action_28
action_109 (29) = happyGoto action_112
action_109 (40) = happyGoto action_29
action_109 (41) = happyGoto action_55
action_109 _ = happyFail

action_110 (49) = happyShift action_111
action_110 _ = happyFail

action_111 (43) = happyShift action_25
action_111 (50) = happyShift action_45
action_111 (56) = happyShift action_20
action_111 (57) = happyShift action_26
action_111 (22) = happyGoto action_27
action_111 (23) = happyGoto action_28
action_111 (34) = happyGoto action_113
action_111 (40) = happyGoto action_29
action_111 (41) = happyGoto action_44
action_111 _ = happyFail

action_112 _ = happyReduce_32

action_113 _ = happyReduce_25

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

happyReduce_22 = happySpecReduce_2  25 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 ((:[]) happy_var_1
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  25 happyReduction_23
happyReduction_23 (HappyAbsSyn25  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn25
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4 26 happyReduction_24
happyReduction_24 ((HappyAbsSyn27  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn22  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (L.Abs.DData happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_25 = happyReduce 7 26 happyReduction_25
happyReduction_25 ((HappyAbsSyn34  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn28  happy_var_5) `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyAbsSyn32  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_3  26 happyReduction_26
happyReduction_26 (HappyAbsSyn29  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn26
		 (L.Abs.DThm happy_var_2 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_0  27 happyReduction_27
happyReduction_27  =  HappyAbsSyn27
		 ([]
	)

happyReduce_28 = happySpecReduce_1  27 happyReduction_28
happyReduction_28 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn27
		 ((:[]) happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  27 happyReduction_29
happyReduction_29 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn27
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_0  28 happyReduction_30
happyReduction_30  =  HappyAbsSyn28
		 ([]
	)

happyReduce_31 = happySpecReduce_2  28 happyReduction_31
happyReduction_31 (HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn28
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 6 29 happyReduction_32
happyReduction_32 ((HappyAbsSyn29  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (L.Abs.PForall happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_3  29 happyReduction_33
happyReduction_33 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn29
		 (L.Abs.PEqual happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  29 happyReduction_34
happyReduction_34 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn29
		 (L.Abs.PExpr happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  30 happyReduction_35
happyReduction_35 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_0  31 happyReduction_36
happyReduction_36  =  HappyAbsSyn31
		 ([]
	)

happyReduce_37 = happySpecReduce_2  31 happyReduction_37
happyReduction_37 (HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn31
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  32 happyReduction_38
happyReduction_38 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  32 happyReduction_39
happyReduction_39 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (happy_var_2
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  33 happyReduction_40
happyReduction_40 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  33 happyReduction_41
happyReduction_41 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happyReduce 4 34 happyReduction_42
happyReduction_42 ((HappyAbsSyn35  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.BCase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_43 = happySpecReduce_1  34 happyReduction_43
happyReduction_43 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.BExpr happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  35 happyReduction_44
happyReduction_44  =  HappyAbsSyn35
		 ([]
	)

happyReduce_45 = happySpecReduce_1  35 happyReduction_45
happyReduction_45 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 ((:[]) happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  35 happyReduction_46
happyReduction_46 (HappyAbsSyn35  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn35
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  36 happyReduction_47
happyReduction_47 (HappyAbsSyn40  happy_var_3)
	_
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  37 happyReduction_48
happyReduction_48 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn37
		 (L.Abs.PVar happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  37 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn37  happy_var_2)
	_
	 =  HappyAbsSyn37
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  38 happyReduction_50
happyReduction_50 (HappyAbsSyn39  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn37
		 (L.Abs.PCon happy_var_1 (reverse happy_var_2)
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  38 happyReduction_51
happyReduction_51 (HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn37
		 (happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_0  39 happyReduction_52
happyReduction_52  =  HappyAbsSyn39
		 ([]
	)

happyReduce_53 = happySpecReduce_2  39 happyReduction_53
happyReduction_53 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  40 happyReduction_54
happyReduction_54 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.EVar happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  40 happyReduction_55
happyReduction_55 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.ECon happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  40 happyReduction_56
happyReduction_56 _
	(HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (happy_var_2
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_2  41 happyReduction_57
happyReduction_57 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.EFApp happy_var_1 happy_var_2
	)
happyReduction_57 _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_2  41 happyReduction_58
happyReduction_58 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.ECApp happy_var_1 happy_var_2
	)
happyReduction_58 _ _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_1  41 happyReduction_59
happyReduction_59 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  42 happyReduction_60
happyReduction_60 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:[]) happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_2  42 happyReduction_61
happyReduction_61 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_61 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 43;
	PT _ (TS _ 2) -> cont 44;
	PT _ (TS _ 3) -> cont 45;
	PT _ (TS _ 4) -> cont 46;
	PT _ (TS _ 5) -> cont 47;
	PT _ (TS _ 6) -> cont 48;
	PT _ (TS _ 7) -> cont 49;
	PT _ (TS _ 8) -> cont 50;
	PT _ (TS _ 9) -> cont 51;
	PT _ (TS _ 10) -> cont 52;
	PT _ (TS _ 11) -> cont 53;
	PT _ (TS _ 12) -> cont 54;
	PT _ (TS _ 13) -> cont 55;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 56;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 57;
	_ -> happyError' (tk:tks)
	}

happyError_ 58 tk tks = happyError' tks
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

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pListLIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pProposition tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pBody tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

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
