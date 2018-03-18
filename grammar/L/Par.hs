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
	| HappyAbsSyn27 (Thm)
	| HappyAbsSyn28 ([Constructor])
	| HappyAbsSyn29 ([LIdent])
	| HappyAbsSyn30 (Constructor)
	| HappyAbsSyn31 ([Type])
	| HappyAbsSyn32 (Type)
	| HappyAbsSyn34 (Expr)
	| HappyAbsSyn37 ([Expr])
	| HappyAbsSyn38 (Alt)
	| HappyAbsSyn39 ([Alt])
	| HappyAbsSyn40 (Pat)
	| HappyAbsSyn42 ([Pat])

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
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128,
 action_129,
 action_130,
 action_131 :: () => Int -> ({-HappyReduction (Err) = -}
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
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (54) = happyShift action_68
action_0 (56) = happyShift action_63
action_0 (58) = happyShift action_64
action_0 (62) = happyShift action_26
action_0 (23) = happyGoto action_65
action_0 (24) = happyGoto action_71
action_0 (25) = happyGoto action_72
action_0 (26) = happyGoto action_70
action_0 (27) = happyGoto action_67
action_0 _ = happyFail

action_1 (54) = happyShift action_68
action_1 (56) = happyShift action_63
action_1 (58) = happyShift action_64
action_1 (62) = happyShift action_26
action_1 (23) = happyGoto action_65
action_1 (25) = happyGoto action_69
action_1 (26) = happyGoto action_70
action_1 (27) = happyGoto action_67
action_1 _ = happyFail

action_2 (54) = happyShift action_68
action_2 (56) = happyShift action_63
action_2 (58) = happyShift action_64
action_2 (62) = happyShift action_26
action_2 (23) = happyGoto action_65
action_2 (26) = happyGoto action_66
action_2 (27) = happyGoto action_67
action_2 _ = happyFail

action_3 (56) = happyShift action_63
action_3 (58) = happyShift action_64
action_3 (27) = happyGoto action_62
action_3 _ = happyFail

action_4 (61) = happyShift action_20
action_4 (22) = happyGoto action_56
action_4 (28) = happyGoto action_60
action_4 (30) = happyGoto action_61
action_4 _ = happyReduce_31

action_5 (62) = happyShift action_26
action_5 (23) = happyGoto action_58
action_5 (29) = happyGoto action_59
action_5 _ = happyFail

action_6 (61) = happyShift action_20
action_6 (22) = happyGoto action_56
action_6 (30) = happyGoto action_57
action_6 _ = happyFail

action_7 (31) = happyGoto action_55
action_7 _ = happyReduce_37

action_8 (43) = happyShift action_52
action_8 (51) = happyShift action_53
action_8 (61) = happyShift action_20
action_8 (22) = happyGoto action_49
action_8 (32) = happyGoto action_54
action_8 _ = happyFail

action_9 (43) = happyShift action_52
action_9 (51) = happyShift action_53
action_9 (61) = happyShift action_20
action_9 (22) = happyGoto action_49
action_9 (32) = happyGoto action_50
action_9 (33) = happyGoto action_51
action_9 _ = happyFail

action_10 (43) = happyShift action_39
action_10 (61) = happyShift action_20
action_10 (62) = happyShift action_26
action_10 (22) = happyGoto action_35
action_10 (23) = happyGoto action_36
action_10 (34) = happyGoto action_48
action_10 _ = happyFail

action_11 (43) = happyShift action_39
action_11 (61) = happyShift action_20
action_11 (62) = happyShift action_26
action_11 (22) = happyGoto action_35
action_11 (23) = happyGoto action_36
action_11 (34) = happyGoto action_46
action_11 (35) = happyGoto action_47
action_11 _ = happyFail

action_12 (43) = happyShift action_39
action_12 (52) = happyShift action_43
action_12 (53) = happyShift action_44
action_12 (55) = happyShift action_45
action_12 (61) = happyShift action_20
action_12 (62) = happyShift action_26
action_12 (22) = happyGoto action_35
action_12 (23) = happyGoto action_36
action_12 (34) = happyGoto action_40
action_12 (35) = happyGoto action_41
action_12 (36) = happyGoto action_42
action_12 _ = happyFail

action_13 (43) = happyShift action_39
action_13 (61) = happyShift action_20
action_13 (62) = happyShift action_26
action_13 (22) = happyGoto action_35
action_13 (23) = happyGoto action_36
action_13 (34) = happyGoto action_37
action_13 (37) = happyGoto action_38
action_13 _ = happyFail

action_14 (43) = happyShift action_25
action_14 (61) = happyShift action_20
action_14 (62) = happyShift action_26
action_14 (22) = happyGoto action_27
action_14 (23) = happyGoto action_22
action_14 (38) = happyGoto action_34
action_14 (40) = happyGoto action_28
action_14 (41) = happyGoto action_33
action_14 _ = happyFail

action_15 (43) = happyShift action_25
action_15 (61) = happyShift action_20
action_15 (62) = happyShift action_26
action_15 (22) = happyGoto action_27
action_15 (23) = happyGoto action_22
action_15 (38) = happyGoto action_31
action_15 (39) = happyGoto action_32
action_15 (40) = happyGoto action_28
action_15 (41) = happyGoto action_33
action_15 _ = happyReduce_58

action_16 (43) = happyShift action_25
action_16 (61) = happyShift action_20
action_16 (62) = happyShift action_26
action_16 (22) = happyGoto action_21
action_16 (23) = happyGoto action_22
action_16 (40) = happyGoto action_30
action_16 _ = happyFail

action_17 (43) = happyShift action_25
action_17 (61) = happyShift action_20
action_17 (62) = happyShift action_26
action_17 (22) = happyGoto action_27
action_17 (23) = happyGoto action_22
action_17 (40) = happyGoto action_28
action_17 (41) = happyGoto action_29
action_17 _ = happyFail

action_18 (43) = happyShift action_25
action_18 (61) = happyShift action_20
action_18 (62) = happyShift action_26
action_18 (22) = happyGoto action_21
action_18 (23) = happyGoto action_22
action_18 (40) = happyGoto action_23
action_18 (42) = happyGoto action_24
action_18 _ = happyFail

action_19 (61) = happyShift action_20
action_19 _ = happyFail

action_20 _ = happyReduce_19

action_21 _ = happyReduce_62

action_22 _ = happyReduce_61

action_23 (43) = happyShift action_25
action_23 (61) = happyShift action_20
action_23 (62) = happyShift action_26
action_23 (22) = happyGoto action_21
action_23 (23) = happyGoto action_22
action_23 (40) = happyGoto action_23
action_23 (42) = happyGoto action_96
action_23 _ = happyReduce_66

action_24 (63) = happyAccept
action_24 _ = happyFail

action_25 (43) = happyShift action_25
action_25 (61) = happyShift action_20
action_25 (62) = happyShift action_26
action_25 (22) = happyGoto action_27
action_25 (23) = happyGoto action_22
action_25 (40) = happyGoto action_28
action_25 (41) = happyGoto action_95
action_25 _ = happyFail

action_26 _ = happyReduce_20

action_27 (43) = happyShift action_25
action_27 (61) = happyShift action_20
action_27 (62) = happyShift action_26
action_27 (22) = happyGoto action_21
action_27 (23) = happyGoto action_22
action_27 (40) = happyGoto action_23
action_27 (42) = happyGoto action_94
action_27 _ = happyReduce_62

action_28 _ = happyReduce_65

action_29 (63) = happyAccept
action_29 _ = happyFail

action_30 (63) = happyAccept
action_30 _ = happyFail

action_31 (60) = happyShift action_93
action_31 _ = happyReduce_59

action_32 (63) = happyAccept
action_32 _ = happyFail

action_33 (45) = happyShift action_92
action_33 _ = happyFail

action_34 (63) = happyAccept
action_34 _ = happyFail

action_35 _ = happyReduce_45

action_36 _ = happyReduce_44

action_37 (43) = happyShift action_39
action_37 (61) = happyShift action_20
action_37 (62) = happyShift action_26
action_37 (22) = happyGoto action_35
action_37 (23) = happyGoto action_36
action_37 (34) = happyGoto action_37
action_37 (37) = happyGoto action_91
action_37 _ = happyReduce_55

action_38 (63) = happyAccept
action_38 _ = happyFail

action_39 (43) = happyShift action_39
action_39 (52) = happyShift action_43
action_39 (53) = happyShift action_44
action_39 (55) = happyShift action_45
action_39 (61) = happyShift action_20
action_39 (62) = happyShift action_26
action_39 (22) = happyGoto action_35
action_39 (23) = happyGoto action_36
action_39 (34) = happyGoto action_40
action_39 (35) = happyGoto action_41
action_39 (36) = happyGoto action_90
action_39 _ = happyFail

action_40 (43) = happyShift action_39
action_40 (49) = happyShift action_89
action_40 (61) = happyShift action_20
action_40 (62) = happyShift action_26
action_40 (22) = happyGoto action_35
action_40 (23) = happyGoto action_36
action_40 (34) = happyGoto action_37
action_40 (37) = happyGoto action_84
action_40 _ = happyReduce_49

action_41 _ = happyReduce_54

action_42 (63) = happyAccept
action_42 _ = happyFail

action_43 (62) = happyShift action_26
action_43 (23) = happyGoto action_88
action_43 _ = happyFail

action_44 (43) = happyShift action_39
action_44 (52) = happyShift action_43
action_44 (53) = happyShift action_44
action_44 (55) = happyShift action_45
action_44 (61) = happyShift action_20
action_44 (62) = happyShift action_26
action_44 (22) = happyGoto action_35
action_44 (23) = happyGoto action_36
action_44 (34) = happyGoto action_40
action_44 (35) = happyGoto action_41
action_44 (36) = happyGoto action_87
action_44 _ = happyFail

action_45 (62) = happyShift action_26
action_45 (23) = happyGoto action_58
action_45 (29) = happyGoto action_86
action_45 _ = happyFail

action_46 (43) = happyShift action_39
action_46 (49) = happyShift action_85
action_46 (61) = happyShift action_20
action_46 (62) = happyShift action_26
action_46 (22) = happyGoto action_35
action_46 (23) = happyGoto action_36
action_46 (34) = happyGoto action_37
action_46 (37) = happyGoto action_84
action_46 _ = happyReduce_49

action_47 (63) = happyAccept
action_47 _ = happyFail

action_48 (63) = happyAccept
action_48 _ = happyFail

action_49 _ = happyReduce_39

action_50 (45) = happyShift action_83
action_50 _ = happyReduce_43

action_51 (63) = happyAccept
action_51 _ = happyFail

action_52 (43) = happyShift action_52
action_52 (51) = happyShift action_53
action_52 (61) = happyShift action_20
action_52 (22) = happyGoto action_49
action_52 (32) = happyGoto action_50
action_52 (33) = happyGoto action_82
action_52 _ = happyFail

action_53 _ = happyReduce_40

action_54 (63) = happyAccept
action_54 _ = happyFail

action_55 (43) = happyShift action_52
action_55 (51) = happyShift action_53
action_55 (61) = happyShift action_20
action_55 (63) = happyAccept
action_55 (22) = happyGoto action_49
action_55 (32) = happyGoto action_50
action_55 (33) = happyGoto action_81
action_55 _ = happyFail

action_56 (31) = happyGoto action_80
action_56 _ = happyReduce_37

action_57 (63) = happyAccept
action_57 _ = happyFail

action_58 (62) = happyShift action_26
action_58 (23) = happyGoto action_58
action_58 (29) = happyGoto action_79
action_58 _ = happyReduce_34

action_59 (63) = happyAccept
action_59 _ = happyFail

action_60 (63) = happyAccept
action_60 _ = happyFail

action_61 (60) = happyShift action_78
action_61 _ = happyReduce_32

action_62 (63) = happyAccept
action_62 _ = happyFail

action_63 (62) = happyShift action_26
action_63 (23) = happyGoto action_77
action_63 _ = happyFail

action_64 (62) = happyShift action_26
action_64 (23) = happyGoto action_76
action_64 _ = happyFail

action_65 (47) = happyShift action_75
action_65 _ = happyFail

action_66 (63) = happyAccept
action_66 _ = happyFail

action_67 _ = happyReduce_26

action_68 (61) = happyShift action_20
action_68 (22) = happyGoto action_74
action_68 _ = happyFail

action_69 (63) = happyAccept
action_69 _ = happyFail

action_70 (48) = happyShift action_73
action_70 _ = happyFail

action_71 (63) = happyAccept
action_71 _ = happyFail

action_72 _ = happyReduce_21

action_73 (54) = happyShift action_68
action_73 (56) = happyShift action_63
action_73 (58) = happyShift action_64
action_73 (62) = happyShift action_26
action_73 (23) = happyGoto action_65
action_73 (25) = happyGoto action_113
action_73 (26) = happyGoto action_70
action_73 (27) = happyGoto action_67
action_73 _ = happyReduce_22

action_74 (49) = happyShift action_112
action_74 _ = happyFail

action_75 (43) = happyShift action_52
action_75 (51) = happyShift action_53
action_75 (61) = happyShift action_20
action_75 (22) = happyGoto action_49
action_75 (32) = happyGoto action_50
action_75 (33) = happyGoto action_111
action_75 _ = happyFail

action_76 (43) = happyShift action_39
action_76 (52) = happyShift action_43
action_76 (53) = happyShift action_44
action_76 (55) = happyShift action_45
action_76 (61) = happyShift action_20
action_76 (62) = happyShift action_26
action_76 (22) = happyGoto action_35
action_76 (23) = happyGoto action_36
action_76 (34) = happyGoto action_40
action_76 (35) = happyGoto action_41
action_76 (36) = happyGoto action_110
action_76 _ = happyFail

action_77 (43) = happyShift action_39
action_77 (52) = happyShift action_43
action_77 (53) = happyShift action_44
action_77 (55) = happyShift action_45
action_77 (61) = happyShift action_20
action_77 (62) = happyShift action_26
action_77 (22) = happyGoto action_35
action_77 (23) = happyGoto action_36
action_77 (34) = happyGoto action_40
action_77 (35) = happyGoto action_41
action_77 (36) = happyGoto action_109
action_77 _ = happyFail

action_78 (61) = happyShift action_20
action_78 (22) = happyGoto action_56
action_78 (28) = happyGoto action_108
action_78 (30) = happyGoto action_61
action_78 _ = happyReduce_31

action_79 _ = happyReduce_35

action_80 (43) = happyShift action_52
action_80 (51) = happyShift action_53
action_80 (61) = happyShift action_20
action_80 (22) = happyGoto action_49
action_80 (32) = happyGoto action_50
action_80 (33) = happyGoto action_81
action_80 _ = happyReduce_36

action_81 _ = happyReduce_38

action_82 (44) = happyShift action_107
action_82 _ = happyFail

action_83 (43) = happyShift action_52
action_83 (51) = happyShift action_53
action_83 (61) = happyShift action_20
action_83 (22) = happyGoto action_49
action_83 (32) = happyGoto action_50
action_83 (33) = happyGoto action_106
action_83 _ = happyFail

action_84 _ = happyReduce_47

action_85 (43) = happyShift action_39
action_85 (61) = happyShift action_20
action_85 (62) = happyShift action_26
action_85 (22) = happyGoto action_35
action_85 (23) = happyGoto action_36
action_85 (34) = happyGoto action_105
action_85 _ = happyFail

action_86 (47) = happyShift action_104
action_86 _ = happyFail

action_87 (57) = happyShift action_103
action_87 _ = happyFail

action_88 (47) = happyShift action_102
action_88 _ = happyFail

action_89 (43) = happyShift action_39
action_89 (61) = happyShift action_20
action_89 (62) = happyShift action_26
action_89 (22) = happyGoto action_35
action_89 (23) = happyGoto action_36
action_89 (34) = happyGoto action_101
action_89 _ = happyFail

action_90 (44) = happyShift action_100
action_90 _ = happyFail

action_91 _ = happyReduce_56

action_92 (43) = happyShift action_39
action_92 (61) = happyShift action_20
action_92 (62) = happyShift action_26
action_92 (22) = happyGoto action_35
action_92 (23) = happyGoto action_36
action_92 (34) = happyGoto action_46
action_92 (35) = happyGoto action_99
action_92 _ = happyFail

action_93 (43) = happyShift action_25
action_93 (61) = happyShift action_20
action_93 (62) = happyShift action_26
action_93 (22) = happyGoto action_27
action_93 (23) = happyGoto action_22
action_93 (38) = happyGoto action_31
action_93 (39) = happyGoto action_98
action_93 (40) = happyGoto action_28
action_93 (41) = happyGoto action_33
action_93 _ = happyReduce_58

action_94 _ = happyReduce_64

action_95 (44) = happyShift action_97
action_95 _ = happyFail

action_96 _ = happyReduce_67

action_97 _ = happyReduce_63

action_98 _ = happyReduce_60

action_99 _ = happyReduce_57

action_100 _ = happyReduce_46

action_101 (50) = happyShift action_121
action_101 _ = happyReduce_48

action_102 (43) = happyShift action_52
action_102 (51) = happyShift action_53
action_102 (61) = happyShift action_20
action_102 (22) = happyGoto action_49
action_102 (32) = happyGoto action_50
action_102 (33) = happyGoto action_120
action_102 _ = happyFail

action_103 (43) = happyShift action_25
action_103 (61) = happyShift action_20
action_103 (62) = happyShift action_26
action_103 (22) = happyGoto action_27
action_103 (23) = happyGoto action_22
action_103 (38) = happyGoto action_31
action_103 (39) = happyGoto action_119
action_103 (40) = happyGoto action_28
action_103 (41) = happyGoto action_33
action_103 _ = happyReduce_58

action_104 (43) = happyShift action_52
action_104 (51) = happyShift action_53
action_104 (61) = happyShift action_20
action_104 (22) = happyGoto action_49
action_104 (32) = happyGoto action_50
action_104 (33) = happyGoto action_118
action_104 _ = happyFail

action_105 _ = happyReduce_48

action_106 _ = happyReduce_42

action_107 _ = happyReduce_41

action_108 _ = happyReduce_33

action_109 (59) = happyShift action_117
action_109 _ = happyReduce_29

action_110 (59) = happyShift action_116
action_110 _ = happyReduce_27

action_111 (62) = happyShift action_26
action_111 (23) = happyGoto action_115
action_111 _ = happyFail

action_112 (61) = happyShift action_20
action_112 (22) = happyGoto action_56
action_112 (28) = happyGoto action_114
action_112 (30) = happyGoto action_61
action_112 _ = happyReduce_31

action_113 _ = happyReduce_23

action_114 _ = happyReduce_24

action_115 (62) = happyShift action_26
action_115 (23) = happyGoto action_58
action_115 (29) = happyGoto action_127
action_115 _ = happyFail

action_116 (62) = happyShift action_26
action_116 (23) = happyGoto action_58
action_116 (29) = happyGoto action_126
action_116 _ = happyFail

action_117 (62) = happyShift action_26
action_117 (23) = happyGoto action_58
action_117 (29) = happyGoto action_125
action_117 _ = happyFail

action_118 (46) = happyShift action_124
action_118 _ = happyFail

action_119 _ = happyReduce_53

action_120 (46) = happyShift action_123
action_120 _ = happyFail

action_121 (43) = happyShift action_39
action_121 (52) = happyShift action_43
action_121 (53) = happyShift action_44
action_121 (55) = happyShift action_45
action_121 (61) = happyShift action_20
action_121 (62) = happyShift action_26
action_121 (22) = happyGoto action_35
action_121 (23) = happyGoto action_36
action_121 (34) = happyGoto action_40
action_121 (35) = happyGoto action_41
action_121 (36) = happyGoto action_122
action_121 _ = happyFail

action_122 _ = happyReduce_52

action_123 (43) = happyShift action_39
action_123 (52) = happyShift action_43
action_123 (53) = happyShift action_44
action_123 (55) = happyShift action_45
action_123 (61) = happyShift action_20
action_123 (62) = happyShift action_26
action_123 (22) = happyGoto action_35
action_123 (23) = happyGoto action_36
action_123 (34) = happyGoto action_40
action_123 (35) = happyGoto action_41
action_123 (36) = happyGoto action_130
action_123 _ = happyFail

action_124 (43) = happyShift action_39
action_124 (52) = happyShift action_43
action_124 (53) = happyShift action_44
action_124 (55) = happyShift action_45
action_124 (61) = happyShift action_20
action_124 (62) = happyShift action_26
action_124 (22) = happyGoto action_35
action_124 (23) = happyGoto action_36
action_124 (34) = happyGoto action_40
action_124 (35) = happyGoto action_41
action_124 (36) = happyGoto action_129
action_124 _ = happyFail

action_125 _ = happyReduce_30

action_126 _ = happyReduce_28

action_127 (49) = happyShift action_128
action_127 _ = happyFail

action_128 (43) = happyShift action_39
action_128 (52) = happyShift action_43
action_128 (53) = happyShift action_44
action_128 (55) = happyShift action_45
action_128 (61) = happyShift action_20
action_128 (62) = happyShift action_26
action_128 (22) = happyGoto action_35
action_128 (23) = happyGoto action_36
action_128 (34) = happyGoto action_40
action_128 (35) = happyGoto action_41
action_128 (36) = happyGoto action_131
action_128 _ = happyFail

action_129 _ = happyReduce_51

action_130 _ = happyReduce_50

action_131 _ = happyReduce_25

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
happyReduction_24 ((HappyAbsSyn28  happy_var_4) `HappyStk`
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
	(HappyAbsSyn29  happy_var_5) `HappyStk`
	(HappyAbsSyn23  happy_var_4) `HappyStk`
	(HappyAbsSyn32  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn26
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_26 = happySpecReduce_1  26 happyReduction_26
happyReduction_26 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (L.Abs.DThm happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  27 happyReduction_27
happyReduction_27 (HappyAbsSyn34  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (L.Abs.TStandalone happy_var_2 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 27 happyReduction_28
happyReduction_28 ((HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (L.Abs.TUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happySpecReduce_3  27 happyReduction_29
happyReduction_29 (HappyAbsSyn34  happy_var_3)
	(HappyAbsSyn23  happy_var_2)
	_
	 =  HappyAbsSyn27
		 (L.Abs.TLemma happy_var_2 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 27 happyReduction_30
happyReduction_30 ((HappyAbsSyn29  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (L.Abs.TLemmaUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_0  28 happyReduction_31
happyReduction_31  =  HappyAbsSyn28
		 ([]
	)

happyReduce_32 = happySpecReduce_1  28 happyReduction_32
happyReduction_32 (HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn28
		 ((:[]) happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  28 happyReduction_33
happyReduction_33 (HappyAbsSyn28  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn28
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  29 happyReduction_34
happyReduction_34 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn29
		 ((:[]) happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  29 happyReduction_35
happyReduction_35 (HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  30 happyReduction_36
happyReduction_36 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_0  31 happyReduction_37
happyReduction_37  =  HappyAbsSyn31
		 ([]
	)

happyReduce_38 = happySpecReduce_2  31 happyReduction_38
happyReduction_38 (HappyAbsSyn32  happy_var_2)
	(HappyAbsSyn31  happy_var_1)
	 =  HappyAbsSyn31
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  32 happyReduction_39
happyReduction_39 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_1  32 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn32
		 (L.Abs.Formula
	)

happyReduce_41 = happySpecReduce_3  32 happyReduction_41
happyReduction_41 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (happy_var_2
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  33 happyReduction_42
happyReduction_42 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  33 happyReduction_43
happyReduction_43 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  34 happyReduction_44
happyReduction_44 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EVar happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  34 happyReduction_45
happyReduction_45 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.ECon happy_var_1
	)
happyReduction_45 _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  34 happyReduction_46
happyReduction_46 _
	(HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (happy_var_2
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  35 happyReduction_47
happyReduction_47 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_3  35 happyReduction_48
happyReduction_48 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EEqual happy_var_1 happy_var_3
	)
happyReduction_48 _ _ _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  35 happyReduction_49
happyReduction_49 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happyReduce 6 36 happyReduction_50
happyReduction_50 ((HappyAbsSyn34  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.ELam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_51 = happyReduce 6 36 happyReduction_51
happyReduction_51 ((HappyAbsSyn34  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.EAll happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_52 = happyReduce 5 36 happyReduction_52
happyReduction_52 ((HappyAbsSyn34  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.EImpl happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_53 = happyReduce 4 36 happyReduction_53
happyReduction_53 ((HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.ECase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_1  36 happyReduction_54
happyReduction_54 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  37 happyReduction_55
happyReduction_55 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn37
		 ((:[]) happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  37 happyReduction_56
happyReduction_56 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn37
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  38 happyReduction_57
happyReduction_57 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_0  39 happyReduction_58
happyReduction_58  =  HappyAbsSyn39
		 ([]
	)

happyReduce_59 = happySpecReduce_1  39 happyReduction_59
happyReduction_59 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn39
		 ((:[]) happy_var_1
	)
happyReduction_59 _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_3  39 happyReduction_60
happyReduction_60 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn39
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_60 _ _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  40 happyReduction_61
happyReduction_61 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PVar happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  40 happyReduction_62
happyReduction_62 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PConE happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  40 happyReduction_63
happyReduction_63 _
	(HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (happy_var_2
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_2  41 happyReduction_64
happyReduction_64 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PCon happy_var_1 happy_var_2
	)
happyReduction_64 _ _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  41 happyReduction_65
happyReduction_65 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_1  42 happyReduction_66
happyReduction_66 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:[]) happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_2  42 happyReduction_67
happyReduction_67 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_67 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 63 63 notHappyAtAll (HappyState action) sts stk []

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
	PT _ (TS _ 14) -> cont 56;
	PT _ (TS _ 15) -> cont 57;
	PT _ (TS _ 16) -> cont 58;
	PT _ (TS _ 17) -> cont 59;
	PT _ (TS _ 18) -> cont 60;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 61;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 62;
	_ -> happyError' (tk:tks)
	}

happyError_ 63 tk tks = happyError' tks
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

pThm tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pListLIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
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
