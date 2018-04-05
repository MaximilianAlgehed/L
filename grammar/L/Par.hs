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
	| HappyAbsSyn26 (UIdent)
	| HappyAbsSyn27 (LIdent)
	| HappyAbsSyn28 (Program)
	| HappyAbsSyn29 ([Decl])
	| HappyAbsSyn30 (Decl)
	| HappyAbsSyn31 (TypeArg)
	| HappyAbsSyn32 ([TypeArg])
	| HappyAbsSyn33 (Thm)
	| HappyAbsSyn34 ([Constructor])
	| HappyAbsSyn35 ([LIdent])
	| HappyAbsSyn36 (Constructor)
	| HappyAbsSyn37 ([CArg])
	| HappyAbsSyn38 (CArg)
	| HappyAbsSyn39 (Type)
	| HappyAbsSyn41 ([Type])
	| HappyAbsSyn42 (Expr)
	| HappyAbsSyn45 ([Expr])
	| HappyAbsSyn46 (Alt)
	| HappyAbsSyn47 ([Alt])
	| HappyAbsSyn48 (Pat)
	| HappyAbsSyn50 ([Pat])

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
 action_131,
 action_132,
 action_133,
 action_134,
 action_135,
 action_136,
 action_137,
 action_138,
 action_139,
 action_140,
 action_141,
 action_142,
 action_143,
 action_144,
 action_145,
 action_146,
 action_147,
 action_148,
 action_149,
 action_150,
 action_151,
 action_152,
 action_153,
 action_154,
 action_155,
 action_156,
 action_157,
 action_158 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78,
 happyReduce_79,
 happyReduce_80,
 happyReduce_81 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (62) = happyShift action_82
action_0 (65) = happyShift action_74
action_0 (67) = happyShift action_75
action_0 (71) = happyShift action_30
action_0 (27) = happyGoto action_79
action_0 (28) = happyGoto action_85
action_0 (29) = happyGoto action_86
action_0 (30) = happyGoto action_84
action_0 (33) = happyGoto action_81
action_0 _ = happyFail

action_1 (62) = happyShift action_82
action_1 (65) = happyShift action_74
action_1 (67) = happyShift action_75
action_1 (71) = happyShift action_30
action_1 (27) = happyGoto action_79
action_1 (29) = happyGoto action_83
action_1 (30) = happyGoto action_84
action_1 (33) = happyGoto action_81
action_1 _ = happyFail

action_2 (62) = happyShift action_82
action_2 (65) = happyShift action_74
action_2 (67) = happyShift action_75
action_2 (71) = happyShift action_30
action_2 (27) = happyGoto action_79
action_2 (30) = happyGoto action_80
action_2 (33) = happyGoto action_81
action_2 _ = happyFail

action_3 (71) = happyShift action_30
action_3 (27) = happyGoto action_77
action_3 (31) = happyGoto action_78
action_3 _ = happyFail

action_4 (32) = happyGoto action_76
action_4 _ = happyReduce_32

action_5 (65) = happyShift action_74
action_5 (67) = happyShift action_75
action_5 (33) = happyGoto action_73
action_5 _ = happyFail

action_6 (70) = happyShift action_24
action_6 (26) = happyGoto action_67
action_6 (34) = happyGoto action_71
action_6 (36) = happyGoto action_72
action_6 _ = happyReduce_38

action_7 (71) = happyShift action_30
action_7 (27) = happyGoto action_69
action_7 (35) = happyGoto action_70
action_7 _ = happyFail

action_8 (70) = happyShift action_24
action_8 (26) = happyGoto action_67
action_8 (36) = happyGoto action_68
action_8 _ = happyFail

action_9 (37) = happyGoto action_66
action_9 _ = happyReduce_44

action_10 (51) = happyShift action_57
action_10 (59) = happyShift action_58
action_10 (70) = happyShift action_24
action_10 (71) = happyShift action_30
action_10 (26) = happyGoto action_53
action_10 (27) = happyGoto action_54
action_10 (38) = happyGoto action_64
action_10 (39) = happyGoto action_65
action_10 _ = happyFail

action_11 (51) = happyShift action_57
action_11 (59) = happyShift action_58
action_11 (70) = happyShift action_24
action_11 (71) = happyShift action_30
action_11 (26) = happyGoto action_53
action_11 (27) = happyGoto action_54
action_11 (39) = happyGoto action_63
action_11 _ = happyFail

action_12 (51) = happyShift action_57
action_12 (59) = happyShift action_58
action_12 (64) = happyShift action_62
action_12 (70) = happyShift action_24
action_12 (71) = happyShift action_30
action_12 (26) = happyGoto action_59
action_12 (27) = happyGoto action_54
action_12 (39) = happyGoto action_60
action_12 (40) = happyGoto action_61
action_12 _ = happyFail

action_13 (51) = happyShift action_57
action_13 (59) = happyShift action_58
action_13 (70) = happyShift action_24
action_13 (71) = happyShift action_30
action_13 (26) = happyGoto action_53
action_13 (27) = happyGoto action_54
action_13 (39) = happyGoto action_55
action_13 (41) = happyGoto action_56
action_13 _ = happyFail

action_14 (51) = happyShift action_43
action_14 (70) = happyShift action_24
action_14 (71) = happyShift action_30
action_14 (26) = happyGoto action_39
action_14 (27) = happyGoto action_40
action_14 (42) = happyGoto action_52
action_14 _ = happyFail

action_15 (51) = happyShift action_43
action_15 (70) = happyShift action_24
action_15 (71) = happyShift action_30
action_15 (26) = happyGoto action_39
action_15 (27) = happyGoto action_40
action_15 (42) = happyGoto action_44
action_15 (43) = happyGoto action_51
action_15 _ = happyFail

action_16 (51) = happyShift action_43
action_16 (60) = happyShift action_47
action_16 (61) = happyShift action_48
action_16 (63) = happyShift action_49
action_16 (64) = happyShift action_50
action_16 (70) = happyShift action_24
action_16 (71) = happyShift action_30
action_16 (26) = happyGoto action_39
action_16 (27) = happyGoto action_40
action_16 (42) = happyGoto action_44
action_16 (43) = happyGoto action_45
action_16 (44) = happyGoto action_46
action_16 _ = happyFail

action_17 (51) = happyShift action_43
action_17 (70) = happyShift action_24
action_17 (71) = happyShift action_30
action_17 (26) = happyGoto action_39
action_17 (27) = happyGoto action_40
action_17 (42) = happyGoto action_41
action_17 (45) = happyGoto action_42
action_17 _ = happyFail

action_18 (51) = happyShift action_29
action_18 (70) = happyShift action_24
action_18 (71) = happyShift action_30
action_18 (26) = happyGoto action_31
action_18 (27) = happyGoto action_26
action_18 (46) = happyGoto action_38
action_18 (48) = happyGoto action_32
action_18 (49) = happyGoto action_37
action_18 _ = happyFail

action_19 (51) = happyShift action_29
action_19 (70) = happyShift action_24
action_19 (71) = happyShift action_30
action_19 (26) = happyGoto action_31
action_19 (27) = happyGoto action_26
action_19 (46) = happyGoto action_35
action_19 (47) = happyGoto action_36
action_19 (48) = happyGoto action_32
action_19 (49) = happyGoto action_37
action_19 _ = happyReduce_72

action_20 (51) = happyShift action_29
action_20 (70) = happyShift action_24
action_20 (71) = happyShift action_30
action_20 (26) = happyGoto action_25
action_20 (27) = happyGoto action_26
action_20 (48) = happyGoto action_34
action_20 _ = happyFail

action_21 (51) = happyShift action_29
action_21 (70) = happyShift action_24
action_21 (71) = happyShift action_30
action_21 (26) = happyGoto action_31
action_21 (27) = happyGoto action_26
action_21 (48) = happyGoto action_32
action_21 (49) = happyGoto action_33
action_21 _ = happyFail

action_22 (51) = happyShift action_29
action_22 (70) = happyShift action_24
action_22 (71) = happyShift action_30
action_22 (26) = happyGoto action_25
action_22 (27) = happyGoto action_26
action_22 (48) = happyGoto action_27
action_22 (50) = happyGoto action_28
action_22 _ = happyFail

action_23 (70) = happyShift action_24
action_23 _ = happyFail

action_24 _ = happyReduce_23

action_25 _ = happyReduce_76

action_26 _ = happyReduce_75

action_27 (51) = happyShift action_29
action_27 (70) = happyShift action_24
action_27 (71) = happyShift action_30
action_27 (26) = happyGoto action_25
action_27 (27) = happyGoto action_26
action_27 (48) = happyGoto action_27
action_27 (50) = happyGoto action_115
action_27 _ = happyReduce_80

action_28 (72) = happyAccept
action_28 _ = happyFail

action_29 (51) = happyShift action_29
action_29 (70) = happyShift action_24
action_29 (71) = happyShift action_30
action_29 (26) = happyGoto action_31
action_29 (27) = happyGoto action_26
action_29 (48) = happyGoto action_32
action_29 (49) = happyGoto action_114
action_29 _ = happyFail

action_30 _ = happyReduce_24

action_31 (51) = happyShift action_29
action_31 (70) = happyShift action_24
action_31 (71) = happyShift action_30
action_31 (26) = happyGoto action_25
action_31 (27) = happyGoto action_26
action_31 (48) = happyGoto action_27
action_31 (50) = happyGoto action_113
action_31 _ = happyReduce_76

action_32 _ = happyReduce_79

action_33 (72) = happyAccept
action_33 _ = happyFail

action_34 (72) = happyAccept
action_34 _ = happyFail

action_35 (69) = happyShift action_112
action_35 _ = happyReduce_73

action_36 (72) = happyAccept
action_36 _ = happyFail

action_37 (53) = happyShift action_111
action_37 _ = happyFail

action_38 (72) = happyAccept
action_38 _ = happyFail

action_39 _ = happyReduce_58

action_40 _ = happyReduce_57

action_41 (51) = happyShift action_43
action_41 (70) = happyShift action_24
action_41 (71) = happyShift action_30
action_41 (26) = happyGoto action_39
action_41 (27) = happyGoto action_40
action_41 (42) = happyGoto action_41
action_41 (45) = happyGoto action_110
action_41 _ = happyReduce_69

action_42 (72) = happyAccept
action_42 _ = happyFail

action_43 (51) = happyShift action_43
action_43 (60) = happyShift action_47
action_43 (61) = happyShift action_48
action_43 (63) = happyShift action_49
action_43 (64) = happyShift action_50
action_43 (70) = happyShift action_24
action_43 (71) = happyShift action_30
action_43 (26) = happyGoto action_39
action_43 (27) = happyGoto action_40
action_43 (42) = happyGoto action_44
action_43 (43) = happyGoto action_45
action_43 (44) = happyGoto action_109
action_43 _ = happyFail

action_44 (51) = happyShift action_43
action_44 (70) = happyShift action_24
action_44 (71) = happyShift action_30
action_44 (26) = happyGoto action_39
action_44 (27) = happyGoto action_40
action_44 (42) = happyGoto action_41
action_44 (45) = happyGoto action_108
action_44 _ = happyReduce_62

action_45 (57) = happyShift action_107
action_45 _ = happyReduce_68

action_46 (72) = happyAccept
action_46 _ = happyFail

action_47 (71) = happyShift action_30
action_47 (27) = happyGoto action_106
action_47 _ = happyFail

action_48 (51) = happyShift action_43
action_48 (60) = happyShift action_47
action_48 (61) = happyShift action_48
action_48 (63) = happyShift action_49
action_48 (64) = happyShift action_50
action_48 (70) = happyShift action_24
action_48 (71) = happyShift action_30
action_48 (26) = happyGoto action_39
action_48 (27) = happyGoto action_40
action_48 (42) = happyGoto action_44
action_48 (43) = happyGoto action_45
action_48 (44) = happyGoto action_105
action_48 _ = happyFail

action_49 (71) = happyShift action_30
action_49 (27) = happyGoto action_69
action_49 (35) = happyGoto action_104
action_49 _ = happyFail

action_50 (71) = happyShift action_30
action_50 (27) = happyGoto action_69
action_50 (35) = happyGoto action_103
action_50 _ = happyFail

action_51 (57) = happyShift action_102
action_51 (72) = happyAccept
action_51 _ = happyFail

action_52 (72) = happyAccept
action_52 _ = happyFail

action_53 _ = happyReduce_49

action_54 _ = happyReduce_48

action_55 (51) = happyShift action_57
action_55 (59) = happyShift action_58
action_55 (70) = happyShift action_24
action_55 (71) = happyShift action_30
action_55 (26) = happyGoto action_53
action_55 (27) = happyGoto action_54
action_55 (39) = happyGoto action_55
action_55 (41) = happyGoto action_101
action_55 _ = happyReduce_55

action_56 (72) = happyAccept
action_56 _ = happyFail

action_57 (51) = happyShift action_57
action_57 (59) = happyShift action_58
action_57 (64) = happyShift action_62
action_57 (70) = happyShift action_24
action_57 (71) = happyShift action_30
action_57 (26) = happyGoto action_59
action_57 (27) = happyGoto action_54
action_57 (39) = happyGoto action_60
action_57 (40) = happyGoto action_100
action_57 _ = happyFail

action_58 _ = happyReduce_47

action_59 (51) = happyShift action_57
action_59 (59) = happyShift action_58
action_59 (70) = happyShift action_24
action_59 (71) = happyShift action_30
action_59 (26) = happyGoto action_53
action_59 (27) = happyGoto action_54
action_59 (39) = happyGoto action_55
action_59 (41) = happyGoto action_99
action_59 _ = happyReduce_49

action_60 (53) = happyShift action_98
action_60 _ = happyReduce_54

action_61 (72) = happyAccept
action_61 _ = happyFail

action_62 (71) = happyShift action_30
action_62 (27) = happyGoto action_97
action_62 _ = happyFail

action_63 (72) = happyAccept
action_63 _ = happyFail

action_64 (72) = happyAccept
action_64 _ = happyFail

action_65 _ = happyReduce_46

action_66 (51) = happyShift action_57
action_66 (59) = happyShift action_58
action_66 (70) = happyShift action_24
action_66 (71) = happyShift action_30
action_66 (72) = happyAccept
action_66 (26) = happyGoto action_53
action_66 (27) = happyGoto action_54
action_66 (38) = happyGoto action_96
action_66 (39) = happyGoto action_65
action_66 _ = happyFail

action_67 (37) = happyGoto action_95
action_67 _ = happyReduce_44

action_68 (72) = happyAccept
action_68 _ = happyFail

action_69 (71) = happyShift action_30
action_69 (27) = happyGoto action_69
action_69 (35) = happyGoto action_94
action_69 _ = happyReduce_41

action_70 (72) = happyAccept
action_70 _ = happyFail

action_71 (72) = happyAccept
action_71 _ = happyFail

action_72 (69) = happyShift action_93
action_72 _ = happyReduce_39

action_73 (72) = happyAccept
action_73 _ = happyFail

action_74 (71) = happyShift action_30
action_74 (27) = happyGoto action_92
action_74 _ = happyFail

action_75 (71) = happyShift action_30
action_75 (27) = happyGoto action_91
action_75 _ = happyFail

action_76 (71) = happyShift action_30
action_76 (72) = happyAccept
action_76 (27) = happyGoto action_77
action_76 (31) = happyGoto action_90
action_76 _ = happyFail

action_77 _ = happyReduce_31

action_78 (72) = happyAccept
action_78 _ = happyFail

action_79 (55) = happyShift action_89
action_79 _ = happyFail

action_80 (72) = happyAccept
action_80 _ = happyFail

action_81 _ = happyReduce_30

action_82 (70) = happyShift action_24
action_82 (26) = happyGoto action_88
action_82 _ = happyFail

action_83 (72) = happyAccept
action_83 _ = happyFail

action_84 (56) = happyShift action_87
action_84 _ = happyFail

action_85 (72) = happyAccept
action_85 _ = happyFail

action_86 _ = happyReduce_25

action_87 (62) = happyShift action_82
action_87 (65) = happyShift action_74
action_87 (67) = happyShift action_75
action_87 (71) = happyShift action_30
action_87 (27) = happyGoto action_79
action_87 (29) = happyGoto action_134
action_87 (30) = happyGoto action_84
action_87 (33) = happyGoto action_81
action_87 _ = happyReduce_26

action_88 (32) = happyGoto action_133
action_88 _ = happyReduce_32

action_89 (51) = happyShift action_57
action_89 (59) = happyShift action_58
action_89 (64) = happyShift action_62
action_89 (70) = happyShift action_24
action_89 (71) = happyShift action_30
action_89 (26) = happyGoto action_59
action_89 (27) = happyGoto action_54
action_89 (39) = happyGoto action_60
action_89 (40) = happyGoto action_132
action_89 _ = happyFail

action_90 _ = happyReduce_33

action_91 (51) = happyShift action_43
action_91 (60) = happyShift action_47
action_91 (61) = happyShift action_48
action_91 (63) = happyShift action_49
action_91 (64) = happyShift action_50
action_91 (70) = happyShift action_24
action_91 (71) = happyShift action_30
action_91 (26) = happyGoto action_39
action_91 (27) = happyGoto action_40
action_91 (42) = happyGoto action_44
action_91 (43) = happyGoto action_45
action_91 (44) = happyGoto action_131
action_91 _ = happyFail

action_92 (51) = happyShift action_43
action_92 (60) = happyShift action_47
action_92 (61) = happyShift action_48
action_92 (63) = happyShift action_49
action_92 (64) = happyShift action_50
action_92 (70) = happyShift action_24
action_92 (71) = happyShift action_30
action_92 (26) = happyGoto action_39
action_92 (27) = happyGoto action_40
action_92 (42) = happyGoto action_44
action_92 (43) = happyGoto action_45
action_92 (44) = happyGoto action_130
action_92 _ = happyFail

action_93 (70) = happyShift action_24
action_93 (26) = happyGoto action_67
action_93 (34) = happyGoto action_129
action_93 (36) = happyGoto action_72
action_93 _ = happyReduce_38

action_94 _ = happyReduce_42

action_95 (51) = happyShift action_57
action_95 (59) = happyShift action_58
action_95 (70) = happyShift action_24
action_95 (71) = happyShift action_30
action_95 (26) = happyGoto action_53
action_95 (27) = happyGoto action_54
action_95 (38) = happyGoto action_96
action_95 (39) = happyGoto action_65
action_95 _ = happyReduce_43

action_96 _ = happyReduce_45

action_97 (54) = happyShift action_128
action_97 _ = happyFail

action_98 (51) = happyShift action_57
action_98 (59) = happyShift action_58
action_98 (64) = happyShift action_62
action_98 (70) = happyShift action_24
action_98 (71) = happyShift action_30
action_98 (26) = happyGoto action_59
action_98 (27) = happyGoto action_54
action_98 (39) = happyGoto action_60
action_98 (40) = happyGoto action_127
action_98 _ = happyFail

action_99 _ = happyReduce_52

action_100 (52) = happyShift action_126
action_100 _ = happyFail

action_101 _ = happyReduce_56

action_102 (51) = happyShift action_43
action_102 (70) = happyShift action_24
action_102 (71) = happyShift action_30
action_102 (26) = happyGoto action_39
action_102 (27) = happyGoto action_40
action_102 (42) = happyGoto action_44
action_102 (43) = happyGoto action_125
action_102 _ = happyFail

action_103 (55) = happyShift action_124
action_103 _ = happyFail

action_104 (55) = happyShift action_123
action_104 _ = happyFail

action_105 (66) = happyShift action_122
action_105 _ = happyFail

action_106 (55) = happyShift action_121
action_106 _ = happyFail

action_107 (51) = happyShift action_43
action_107 (70) = happyShift action_24
action_107 (71) = happyShift action_30
action_107 (26) = happyGoto action_39
action_107 (27) = happyGoto action_40
action_107 (42) = happyGoto action_44
action_107 (43) = happyGoto action_120
action_107 _ = happyFail

action_108 _ = happyReduce_60

action_109 (52) = happyShift action_119
action_109 _ = happyFail

action_110 _ = happyReduce_70

action_111 (51) = happyShift action_43
action_111 (70) = happyShift action_24
action_111 (71) = happyShift action_30
action_111 (26) = happyGoto action_39
action_111 (27) = happyGoto action_40
action_111 (42) = happyGoto action_44
action_111 (43) = happyGoto action_118
action_111 _ = happyFail

action_112 (51) = happyShift action_29
action_112 (70) = happyShift action_24
action_112 (71) = happyShift action_30
action_112 (26) = happyGoto action_31
action_112 (27) = happyGoto action_26
action_112 (46) = happyGoto action_35
action_112 (47) = happyGoto action_117
action_112 (48) = happyGoto action_32
action_112 (49) = happyGoto action_37
action_112 _ = happyReduce_72

action_113 _ = happyReduce_78

action_114 (52) = happyShift action_116
action_114 _ = happyFail

action_115 _ = happyReduce_81

action_116 _ = happyReduce_77

action_117 _ = happyReduce_74

action_118 (57) = happyShift action_102
action_118 _ = happyReduce_71

action_119 _ = happyReduce_59

action_120 (57) = happyShift action_102
action_120 (58) = happyShift action_144
action_120 _ = happyReduce_61

action_121 (51) = happyShift action_57
action_121 (59) = happyShift action_58
action_121 (64) = happyShift action_62
action_121 (70) = happyShift action_24
action_121 (71) = happyShift action_30
action_121 (26) = happyGoto action_59
action_121 (27) = happyGoto action_54
action_121 (39) = happyGoto action_60
action_121 (40) = happyGoto action_143
action_121 _ = happyFail

action_122 (51) = happyShift action_29
action_122 (70) = happyShift action_24
action_122 (71) = happyShift action_30
action_122 (26) = happyGoto action_31
action_122 (27) = happyGoto action_26
action_122 (46) = happyGoto action_35
action_122 (47) = happyGoto action_142
action_122 (48) = happyGoto action_32
action_122 (49) = happyGoto action_37
action_122 _ = happyReduce_72

action_123 (51) = happyShift action_57
action_123 (59) = happyShift action_58
action_123 (64) = happyShift action_62
action_123 (70) = happyShift action_24
action_123 (71) = happyShift action_30
action_123 (26) = happyGoto action_59
action_123 (27) = happyGoto action_54
action_123 (39) = happyGoto action_60
action_123 (40) = happyGoto action_141
action_123 _ = happyFail

action_124 (51) = happyShift action_57
action_124 (59) = happyShift action_58
action_124 (64) = happyShift action_62
action_124 (70) = happyShift action_24
action_124 (71) = happyShift action_30
action_124 (26) = happyGoto action_59
action_124 (27) = happyGoto action_54
action_124 (39) = happyGoto action_60
action_124 (40) = happyGoto action_140
action_124 _ = happyFail

action_125 (57) = happyShift action_102
action_125 _ = happyReduce_61

action_126 _ = happyReduce_50

action_127 _ = happyReduce_51

action_128 (51) = happyShift action_57
action_128 (59) = happyShift action_58
action_128 (64) = happyShift action_62
action_128 (70) = happyShift action_24
action_128 (71) = happyShift action_30
action_128 (26) = happyGoto action_59
action_128 (27) = happyGoto action_54
action_128 (39) = happyGoto action_60
action_128 (40) = happyGoto action_139
action_128 _ = happyFail

action_129 _ = happyReduce_40

action_130 (68) = happyShift action_138
action_130 _ = happyReduce_36

action_131 (68) = happyShift action_137
action_131 _ = happyReduce_34

action_132 (56) = happyShift action_136
action_132 _ = happyFail

action_133 (57) = happyShift action_135
action_133 (71) = happyShift action_30
action_133 (27) = happyGoto action_77
action_133 (31) = happyGoto action_90
action_133 _ = happyFail

action_134 _ = happyReduce_27

action_135 (70) = happyShift action_24
action_135 (26) = happyGoto action_67
action_135 (34) = happyGoto action_152
action_135 (36) = happyGoto action_72
action_135 _ = happyReduce_38

action_136 (71) = happyShift action_30
action_136 (27) = happyGoto action_151
action_136 _ = happyFail

action_137 (71) = happyShift action_30
action_137 (27) = happyGoto action_69
action_137 (35) = happyGoto action_150
action_137 _ = happyFail

action_138 (71) = happyShift action_30
action_138 (27) = happyGoto action_69
action_138 (35) = happyGoto action_149
action_138 _ = happyFail

action_139 _ = happyReduce_53

action_140 (54) = happyShift action_148
action_140 _ = happyFail

action_141 (54) = happyShift action_147
action_141 _ = happyFail

action_142 _ = happyReduce_67

action_143 (54) = happyShift action_146
action_143 _ = happyFail

action_144 (51) = happyShift action_43
action_144 (60) = happyShift action_47
action_144 (61) = happyShift action_48
action_144 (63) = happyShift action_49
action_144 (64) = happyShift action_50
action_144 (70) = happyShift action_24
action_144 (71) = happyShift action_30
action_144 (26) = happyGoto action_39
action_144 (27) = happyGoto action_40
action_144 (42) = happyGoto action_44
action_144 (43) = happyGoto action_45
action_144 (44) = happyGoto action_145
action_144 _ = happyFail

action_145 _ = happyReduce_66

action_146 (51) = happyShift action_43
action_146 (60) = happyShift action_47
action_146 (61) = happyShift action_48
action_146 (63) = happyShift action_49
action_146 (64) = happyShift action_50
action_146 (70) = happyShift action_24
action_146 (71) = happyShift action_30
action_146 (26) = happyGoto action_39
action_146 (27) = happyGoto action_40
action_146 (42) = happyGoto action_44
action_146 (43) = happyGoto action_45
action_146 (44) = happyGoto action_156
action_146 _ = happyFail

action_147 (51) = happyShift action_43
action_147 (60) = happyShift action_47
action_147 (61) = happyShift action_48
action_147 (63) = happyShift action_49
action_147 (64) = happyShift action_50
action_147 (70) = happyShift action_24
action_147 (71) = happyShift action_30
action_147 (26) = happyGoto action_39
action_147 (27) = happyGoto action_40
action_147 (42) = happyGoto action_44
action_147 (43) = happyGoto action_45
action_147 (44) = happyGoto action_155
action_147 _ = happyFail

action_148 (51) = happyShift action_43
action_148 (60) = happyShift action_47
action_148 (61) = happyShift action_48
action_148 (63) = happyShift action_49
action_148 (64) = happyShift action_50
action_148 (70) = happyShift action_24
action_148 (71) = happyShift action_30
action_148 (26) = happyGoto action_39
action_148 (27) = happyGoto action_40
action_148 (42) = happyGoto action_44
action_148 (43) = happyGoto action_45
action_148 (44) = happyGoto action_154
action_148 _ = happyFail

action_149 _ = happyReduce_37

action_150 _ = happyReduce_35

action_151 (71) = happyShift action_30
action_151 (27) = happyGoto action_69
action_151 (35) = happyGoto action_153
action_151 _ = happyFail

action_152 _ = happyReduce_28

action_153 (57) = happyShift action_157
action_153 _ = happyFail

action_154 _ = happyReduce_64

action_155 _ = happyReduce_65

action_156 _ = happyReduce_63

action_157 (51) = happyShift action_43
action_157 (60) = happyShift action_47
action_157 (61) = happyShift action_48
action_157 (63) = happyShift action_49
action_157 (64) = happyShift action_50
action_157 (70) = happyShift action_24
action_157 (71) = happyShift action_30
action_157 (26) = happyGoto action_39
action_157 (27) = happyGoto action_40
action_157 (42) = happyGoto action_44
action_157 (43) = happyGoto action_45
action_157 (44) = happyGoto action_158
action_157 _ = happyFail

action_158 _ = happyReduce_29

happyReduce_23 = happySpecReduce_1  26 happyReduction_23
happyReduction_23 (HappyTerminal (PT _ (T_UIdent happy_var_1)))
	 =  HappyAbsSyn26
		 (UIdent (happy_var_1)
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  27 happyReduction_24
happyReduction_24 (HappyTerminal (PT _ (T_LIdent happy_var_1)))
	 =  HappyAbsSyn27
		 (LIdent (happy_var_1)
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  28 happyReduction_25
happyReduction_25 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (L.Abs.P happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  29 happyReduction_26
happyReduction_26 _
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 ((:[]) happy_var_1
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  29 happyReduction_27
happyReduction_27 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn30  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happyReduce 5 30 happyReduction_28
happyReduction_28 ((HappyAbsSyn34  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_3) `HappyStk`
	(HappyAbsSyn26  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (L.Abs.DData happy_var_2 (reverse happy_var_3) happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 8 30 happyReduction_29
happyReduction_29 ((HappyAbsSyn42  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_6) `HappyStk`
	(HappyAbsSyn27  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_5 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_1  30 happyReduction_30
happyReduction_30 (HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.DThm happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  31 happyReduction_31
happyReduction_31 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn31
		 (L.Abs.TA happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_0  32 happyReduction_32
happyReduction_32  =  HappyAbsSyn32
		 ([]
	)

happyReduce_33 = happySpecReduce_2  32 happyReduction_33
happyReduction_33 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  33 happyReduction_34
happyReduction_34 (HappyAbsSyn42  happy_var_3)
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (L.Abs.TStandalone happy_var_2 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 5 33 happyReduction_35
happyReduction_35 ((HappyAbsSyn35  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn42  happy_var_3) `HappyStk`
	(HappyAbsSyn27  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (L.Abs.TUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_3  33 happyReduction_36
happyReduction_36 (HappyAbsSyn42  happy_var_3)
	(HappyAbsSyn27  happy_var_2)
	_
	 =  HappyAbsSyn33
		 (L.Abs.TLemma happy_var_2 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 5 33 happyReduction_37
happyReduction_37 ((HappyAbsSyn35  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn42  happy_var_3) `HappyStk`
	(HappyAbsSyn27  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn33
		 (L.Abs.TLemmaUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_38 = happySpecReduce_0  34 happyReduction_38
happyReduction_38  =  HappyAbsSyn34
		 ([]
	)

happyReduce_39 = happySpecReduce_1  34 happyReduction_39
happyReduction_39 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 ((:[]) happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  34 happyReduction_40
happyReduction_40 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn34
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  35 happyReduction_41
happyReduction_41 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn35
		 ((:[]) happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_2  35 happyReduction_42
happyReduction_42 (HappyAbsSyn35  happy_var_2)
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn35
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_2  36 happyReduction_43
happyReduction_43 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_43 _ _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_0  37 happyReduction_44
happyReduction_44  =  HappyAbsSyn37
		 ([]
	)

happyReduce_45 = happySpecReduce_2  37 happyReduction_45
happyReduction_45 (HappyAbsSyn38  happy_var_2)
	(HappyAbsSyn37  happy_var_1)
	 =  HappyAbsSyn37
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_45 _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  38 happyReduction_46
happyReduction_46 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.Arg happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  39 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn39
		 (L.Abs.Formula
	)

happyReduce_48 = happySpecReduce_1  39 happyReduction_48
happyReduction_48 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.TypeVar happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_1  39 happyReduction_49
happyReduction_49 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_3  39 happyReduction_50
happyReduction_50 _
	(HappyAbsSyn39  happy_var_2)
	_
	 =  HappyAbsSyn39
		 (happy_var_2
	)
happyReduction_50 _ _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_3  40 happyReduction_51
happyReduction_51 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  40 happyReduction_52
happyReduction_52 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn39
		 (L.Abs.TypeApp happy_var_1 happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happyReduce 4 40 happyReduction_53
happyReduction_53 ((HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn39
		 (L.Abs.TypeAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_54 = happySpecReduce_1  40 happyReduction_54
happyReduction_54 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn39
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_1  41 happyReduction_55
happyReduction_55 (HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn41
		 ((:[]) happy_var_1
	)
happyReduction_55 _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_2  41 happyReduction_56
happyReduction_56 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn39  happy_var_1)
	 =  HappyAbsSyn41
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_56 _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  42 happyReduction_57
happyReduction_57 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.EVar happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  42 happyReduction_58
happyReduction_58 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.ECon happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  42 happyReduction_59
happyReduction_59 _
	(HappyAbsSyn42  happy_var_2)
	_
	 =  HappyAbsSyn42
		 (happy_var_2
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_2  43 happyReduction_60
happyReduction_60 (HappyAbsSyn45  happy_var_2)
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_60 _ _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  43 happyReduction_61
happyReduction_61 (HappyAbsSyn42  happy_var_3)
	_
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.EEqual happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  43 happyReduction_62
happyReduction_62 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happyReduce 6 44 happyReduction_63
happyReduction_63 ((HappyAbsSyn42  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn27  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn42
		 (L.Abs.ELam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_64 = happyReduce 6 44 happyReduction_64
happyReduction_64 ((HappyAbsSyn42  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn42
		 (L.Abs.EAll happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_65 = happyReduce 6 44 happyReduction_65
happyReduction_65 ((HappyAbsSyn42  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn42
		 (L.Abs.EEx happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_66 = happyReduce 5 44 happyReduction_66
happyReduction_66 ((HappyAbsSyn42  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn42  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn42  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn42
		 (L.Abs.EImpl happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_67 = happyReduce 4 44 happyReduction_67
happyReduction_67 ((HappyAbsSyn47  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn42  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn42
		 (L.Abs.ECase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_68 = happySpecReduce_1  44 happyReduction_68
happyReduction_68 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_1  45 happyReduction_69
happyReduction_69 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn45
		 ((:[]) happy_var_1
	)
happyReduction_69 _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_2  45 happyReduction_70
happyReduction_70 (HappyAbsSyn45  happy_var_2)
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn45
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_70 _ _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_3  46 happyReduction_71
happyReduction_71 (HappyAbsSyn42  happy_var_3)
	_
	(HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn46
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_71 _ _ _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_0  47 happyReduction_72
happyReduction_72  =  HappyAbsSyn47
		 ([]
	)

happyReduce_73 = happySpecReduce_1  47 happyReduction_73
happyReduction_73 (HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn47
		 ((:[]) happy_var_1
	)
happyReduction_73 _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_3  47 happyReduction_74
happyReduction_74 (HappyAbsSyn47  happy_var_3)
	_
	(HappyAbsSyn46  happy_var_1)
	 =  HappyAbsSyn47
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_74 _ _ _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  48 happyReduction_75
happyReduction_75 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn48
		 (L.Abs.PVar happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_1  48 happyReduction_76
happyReduction_76 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn48
		 (L.Abs.PConE happy_var_1
	)
happyReduction_76 _  = notHappyAtAll 

happyReduce_77 = happySpecReduce_3  48 happyReduction_77
happyReduction_77 _
	(HappyAbsSyn48  happy_var_2)
	_
	 =  HappyAbsSyn48
		 (happy_var_2
	)
happyReduction_77 _ _ _  = notHappyAtAll 

happyReduce_78 = happySpecReduce_2  49 happyReduction_78
happyReduction_78 (HappyAbsSyn50  happy_var_2)
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn48
		 (L.Abs.PCon happy_var_1 happy_var_2
	)
happyReduction_78 _ _  = notHappyAtAll 

happyReduce_79 = happySpecReduce_1  49 happyReduction_79
happyReduction_79 (HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn48
		 (happy_var_1
	)
happyReduction_79 _  = notHappyAtAll 

happyReduce_80 = happySpecReduce_1  50 happyReduction_80
happyReduction_80 (HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn50
		 ((:[]) happy_var_1
	)
happyReduction_80 _  = notHappyAtAll 

happyReduce_81 = happySpecReduce_2  50 happyReduction_81
happyReduction_81 (HappyAbsSyn50  happy_var_2)
	(HappyAbsSyn48  happy_var_1)
	 =  HappyAbsSyn50
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_81 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 72 72 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 51;
	PT _ (TS _ 2) -> cont 52;
	PT _ (TS _ 3) -> cont 53;
	PT _ (TS _ 4) -> cont 54;
	PT _ (TS _ 5) -> cont 55;
	PT _ (TS _ 6) -> cont 56;
	PT _ (TS _ 7) -> cont 57;
	PT _ (TS _ 8) -> cont 58;
	PT _ (TS _ 9) -> cont 59;
	PT _ (TS _ 10) -> cont 60;
	PT _ (TS _ 11) -> cont 61;
	PT _ (TS _ 12) -> cont 62;
	PT _ (TS _ 13) -> cont 63;
	PT _ (TS _ 14) -> cont 64;
	PT _ (TS _ 15) -> cont 65;
	PT _ (TS _ 16) -> cont 66;
	PT _ (TS _ 17) -> cont 67;
	PT _ (TS _ 18) -> cont 68;
	PT _ (TS _ 19) -> cont 69;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 70;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 71;
	_ -> happyError' (tk:tks)
	}

happyError_ 72 tk tks = happyError' tks
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
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pTypeArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pListTypeArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pThm tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn33 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pListLIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pListCArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pCArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pListType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn45 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn46 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_19 tks) (\x -> case x of {HappyAbsSyn47 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_20 tks) (\x -> case x of {HappyAbsSyn48 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_21 tks) (\x -> case x of {HappyAbsSyn48 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_22 tks) (\x -> case x of {HappyAbsSyn50 z -> happyReturn z; _other -> notHappyAtAll })

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
