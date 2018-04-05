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
	| HappyAbsSyn24 (UIdent)
	| HappyAbsSyn25 (LIdent)
	| HappyAbsSyn26 (Program)
	| HappyAbsSyn27 ([Decl])
	| HappyAbsSyn28 (Decl)
	| HappyAbsSyn29 (Thm)
	| HappyAbsSyn30 ([Constructor])
	| HappyAbsSyn31 ([LIdent])
	| HappyAbsSyn32 (Constructor)
	| HappyAbsSyn33 ([CArg])
	| HappyAbsSyn34 (CArg)
	| HappyAbsSyn35 (Type)
	| HappyAbsSyn37 ([Type])
	| HappyAbsSyn38 (Expr)
	| HappyAbsSyn41 ([Expr])
	| HappyAbsSyn42 (Alt)
	| HappyAbsSyn43 ([Alt])
	| HappyAbsSyn44 (Pat)
	| HappyAbsSyn46 ([Pat])

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
 action_152 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (58) = happyShift action_77
action_0 (61) = happyShift action_72
action_0 (63) = happyShift action_73
action_0 (67) = happyShift action_28
action_0 (25) = happyGoto action_74
action_0 (26) = happyGoto action_80
action_0 (27) = happyGoto action_81
action_0 (28) = happyGoto action_79
action_0 (29) = happyGoto action_76
action_0 _ = happyFail

action_1 (58) = happyShift action_77
action_1 (61) = happyShift action_72
action_1 (63) = happyShift action_73
action_1 (67) = happyShift action_28
action_1 (25) = happyGoto action_74
action_1 (27) = happyGoto action_78
action_1 (28) = happyGoto action_79
action_1 (29) = happyGoto action_76
action_1 _ = happyFail

action_2 (58) = happyShift action_77
action_2 (61) = happyShift action_72
action_2 (63) = happyShift action_73
action_2 (67) = happyShift action_28
action_2 (25) = happyGoto action_74
action_2 (28) = happyGoto action_75
action_2 (29) = happyGoto action_76
action_2 _ = happyFail

action_3 (61) = happyShift action_72
action_3 (63) = happyShift action_73
action_3 (29) = happyGoto action_71
action_3 _ = happyFail

action_4 (66) = happyShift action_22
action_4 (24) = happyGoto action_65
action_4 (30) = happyGoto action_69
action_4 (32) = happyGoto action_70
action_4 _ = happyReduce_33

action_5 (67) = happyShift action_28
action_5 (25) = happyGoto action_67
action_5 (31) = happyGoto action_68
action_5 _ = happyFail

action_6 (66) = happyShift action_22
action_6 (24) = happyGoto action_65
action_6 (32) = happyGoto action_66
action_6 _ = happyFail

action_7 (33) = happyGoto action_64
action_7 _ = happyReduce_39

action_8 (47) = happyShift action_55
action_8 (55) = happyShift action_56
action_8 (66) = happyShift action_22
action_8 (67) = happyShift action_28
action_8 (24) = happyGoto action_51
action_8 (25) = happyGoto action_52
action_8 (34) = happyGoto action_62
action_8 (35) = happyGoto action_63
action_8 _ = happyFail

action_9 (47) = happyShift action_55
action_9 (55) = happyShift action_56
action_9 (66) = happyShift action_22
action_9 (67) = happyShift action_28
action_9 (24) = happyGoto action_51
action_9 (25) = happyGoto action_52
action_9 (35) = happyGoto action_61
action_9 _ = happyFail

action_10 (47) = happyShift action_55
action_10 (55) = happyShift action_56
action_10 (60) = happyShift action_60
action_10 (66) = happyShift action_22
action_10 (67) = happyShift action_28
action_10 (24) = happyGoto action_57
action_10 (25) = happyGoto action_52
action_10 (35) = happyGoto action_58
action_10 (36) = happyGoto action_59
action_10 _ = happyFail

action_11 (47) = happyShift action_55
action_11 (55) = happyShift action_56
action_11 (66) = happyShift action_22
action_11 (67) = happyShift action_28
action_11 (24) = happyGoto action_51
action_11 (25) = happyGoto action_52
action_11 (35) = happyGoto action_53
action_11 (37) = happyGoto action_54
action_11 _ = happyFail

action_12 (47) = happyShift action_41
action_12 (66) = happyShift action_22
action_12 (67) = happyShift action_28
action_12 (24) = happyGoto action_37
action_12 (25) = happyGoto action_38
action_12 (38) = happyGoto action_50
action_12 _ = happyFail

action_13 (47) = happyShift action_41
action_13 (66) = happyShift action_22
action_13 (67) = happyShift action_28
action_13 (24) = happyGoto action_37
action_13 (25) = happyGoto action_38
action_13 (38) = happyGoto action_42
action_13 (39) = happyGoto action_49
action_13 _ = happyFail

action_14 (47) = happyShift action_41
action_14 (56) = happyShift action_45
action_14 (57) = happyShift action_46
action_14 (59) = happyShift action_47
action_14 (60) = happyShift action_48
action_14 (66) = happyShift action_22
action_14 (67) = happyShift action_28
action_14 (24) = happyGoto action_37
action_14 (25) = happyGoto action_38
action_14 (38) = happyGoto action_42
action_14 (39) = happyGoto action_43
action_14 (40) = happyGoto action_44
action_14 _ = happyFail

action_15 (47) = happyShift action_41
action_15 (66) = happyShift action_22
action_15 (67) = happyShift action_28
action_15 (24) = happyGoto action_37
action_15 (25) = happyGoto action_38
action_15 (38) = happyGoto action_39
action_15 (41) = happyGoto action_40
action_15 _ = happyFail

action_16 (47) = happyShift action_27
action_16 (66) = happyShift action_22
action_16 (67) = happyShift action_28
action_16 (24) = happyGoto action_29
action_16 (25) = happyGoto action_24
action_16 (42) = happyGoto action_36
action_16 (44) = happyGoto action_30
action_16 (45) = happyGoto action_35
action_16 _ = happyFail

action_17 (47) = happyShift action_27
action_17 (66) = happyShift action_22
action_17 (67) = happyShift action_28
action_17 (24) = happyGoto action_29
action_17 (25) = happyGoto action_24
action_17 (42) = happyGoto action_33
action_17 (43) = happyGoto action_34
action_17 (44) = happyGoto action_30
action_17 (45) = happyGoto action_35
action_17 _ = happyReduce_67

action_18 (47) = happyShift action_27
action_18 (66) = happyShift action_22
action_18 (67) = happyShift action_28
action_18 (24) = happyGoto action_23
action_18 (25) = happyGoto action_24
action_18 (44) = happyGoto action_32
action_18 _ = happyFail

action_19 (47) = happyShift action_27
action_19 (66) = happyShift action_22
action_19 (67) = happyShift action_28
action_19 (24) = happyGoto action_29
action_19 (25) = happyGoto action_24
action_19 (44) = happyGoto action_30
action_19 (45) = happyGoto action_31
action_19 _ = happyFail

action_20 (47) = happyShift action_27
action_20 (66) = happyShift action_22
action_20 (67) = happyShift action_28
action_20 (24) = happyGoto action_23
action_20 (25) = happyGoto action_24
action_20 (44) = happyGoto action_25
action_20 (46) = happyGoto action_26
action_20 _ = happyFail

action_21 (66) = happyShift action_22
action_21 _ = happyFail

action_22 _ = happyReduce_21

action_23 _ = happyReduce_71

action_24 _ = happyReduce_70

action_25 (47) = happyShift action_27
action_25 (66) = happyShift action_22
action_25 (67) = happyShift action_28
action_25 (24) = happyGoto action_23
action_25 (25) = happyGoto action_24
action_25 (44) = happyGoto action_25
action_25 (46) = happyGoto action_109
action_25 _ = happyReduce_75

action_26 (68) = happyAccept
action_26 _ = happyFail

action_27 (47) = happyShift action_27
action_27 (66) = happyShift action_22
action_27 (67) = happyShift action_28
action_27 (24) = happyGoto action_29
action_27 (25) = happyGoto action_24
action_27 (44) = happyGoto action_30
action_27 (45) = happyGoto action_108
action_27 _ = happyFail

action_28 _ = happyReduce_22

action_29 (47) = happyShift action_27
action_29 (66) = happyShift action_22
action_29 (67) = happyShift action_28
action_29 (24) = happyGoto action_23
action_29 (25) = happyGoto action_24
action_29 (44) = happyGoto action_25
action_29 (46) = happyGoto action_107
action_29 _ = happyReduce_71

action_30 _ = happyReduce_74

action_31 (68) = happyAccept
action_31 _ = happyFail

action_32 (68) = happyAccept
action_32 _ = happyFail

action_33 (65) = happyShift action_106
action_33 _ = happyReduce_68

action_34 (68) = happyAccept
action_34 _ = happyFail

action_35 (49) = happyShift action_105
action_35 _ = happyFail

action_36 (68) = happyAccept
action_36 _ = happyFail

action_37 _ = happyReduce_53

action_38 _ = happyReduce_52

action_39 (47) = happyShift action_41
action_39 (66) = happyShift action_22
action_39 (67) = happyShift action_28
action_39 (24) = happyGoto action_37
action_39 (25) = happyGoto action_38
action_39 (38) = happyGoto action_39
action_39 (41) = happyGoto action_104
action_39 _ = happyReduce_64

action_40 (68) = happyAccept
action_40 _ = happyFail

action_41 (47) = happyShift action_41
action_41 (56) = happyShift action_45
action_41 (57) = happyShift action_46
action_41 (59) = happyShift action_47
action_41 (60) = happyShift action_48
action_41 (66) = happyShift action_22
action_41 (67) = happyShift action_28
action_41 (24) = happyGoto action_37
action_41 (25) = happyGoto action_38
action_41 (38) = happyGoto action_42
action_41 (39) = happyGoto action_43
action_41 (40) = happyGoto action_103
action_41 _ = happyFail

action_42 (47) = happyShift action_41
action_42 (66) = happyShift action_22
action_42 (67) = happyShift action_28
action_42 (24) = happyGoto action_37
action_42 (25) = happyGoto action_38
action_42 (38) = happyGoto action_39
action_42 (41) = happyGoto action_102
action_42 _ = happyReduce_57

action_43 (53) = happyShift action_101
action_43 _ = happyReduce_63

action_44 (68) = happyAccept
action_44 _ = happyFail

action_45 (67) = happyShift action_28
action_45 (25) = happyGoto action_100
action_45 _ = happyFail

action_46 (47) = happyShift action_41
action_46 (56) = happyShift action_45
action_46 (57) = happyShift action_46
action_46 (59) = happyShift action_47
action_46 (60) = happyShift action_48
action_46 (66) = happyShift action_22
action_46 (67) = happyShift action_28
action_46 (24) = happyGoto action_37
action_46 (25) = happyGoto action_38
action_46 (38) = happyGoto action_42
action_46 (39) = happyGoto action_43
action_46 (40) = happyGoto action_99
action_46 _ = happyFail

action_47 (67) = happyShift action_28
action_47 (25) = happyGoto action_67
action_47 (31) = happyGoto action_98
action_47 _ = happyFail

action_48 (67) = happyShift action_28
action_48 (25) = happyGoto action_67
action_48 (31) = happyGoto action_97
action_48 _ = happyFail

action_49 (53) = happyShift action_96
action_49 (68) = happyAccept
action_49 _ = happyFail

action_50 (68) = happyAccept
action_50 _ = happyFail

action_51 _ = happyReduce_44

action_52 _ = happyReduce_43

action_53 (47) = happyShift action_55
action_53 (55) = happyShift action_56
action_53 (66) = happyShift action_22
action_53 (67) = happyShift action_28
action_53 (24) = happyGoto action_51
action_53 (25) = happyGoto action_52
action_53 (35) = happyGoto action_53
action_53 (37) = happyGoto action_95
action_53 _ = happyReduce_50

action_54 (68) = happyAccept
action_54 _ = happyFail

action_55 (47) = happyShift action_55
action_55 (55) = happyShift action_56
action_55 (60) = happyShift action_60
action_55 (66) = happyShift action_22
action_55 (67) = happyShift action_28
action_55 (24) = happyGoto action_57
action_55 (25) = happyGoto action_52
action_55 (35) = happyGoto action_58
action_55 (36) = happyGoto action_94
action_55 _ = happyFail

action_56 _ = happyReduce_42

action_57 (47) = happyShift action_55
action_57 (55) = happyShift action_56
action_57 (66) = happyShift action_22
action_57 (67) = happyShift action_28
action_57 (24) = happyGoto action_51
action_57 (25) = happyGoto action_52
action_57 (35) = happyGoto action_53
action_57 (37) = happyGoto action_93
action_57 _ = happyReduce_44

action_58 (49) = happyShift action_92
action_58 _ = happyReduce_49

action_59 (68) = happyAccept
action_59 _ = happyFail

action_60 (67) = happyShift action_28
action_60 (25) = happyGoto action_91
action_60 _ = happyFail

action_61 (68) = happyAccept
action_61 _ = happyFail

action_62 (68) = happyAccept
action_62 _ = happyFail

action_63 _ = happyReduce_41

action_64 (47) = happyShift action_55
action_64 (55) = happyShift action_56
action_64 (66) = happyShift action_22
action_64 (67) = happyShift action_28
action_64 (68) = happyAccept
action_64 (24) = happyGoto action_51
action_64 (25) = happyGoto action_52
action_64 (34) = happyGoto action_90
action_64 (35) = happyGoto action_63
action_64 _ = happyFail

action_65 (33) = happyGoto action_89
action_65 _ = happyReduce_39

action_66 (68) = happyAccept
action_66 _ = happyFail

action_67 (67) = happyShift action_28
action_67 (25) = happyGoto action_67
action_67 (31) = happyGoto action_88
action_67 _ = happyReduce_36

action_68 (68) = happyAccept
action_68 _ = happyFail

action_69 (68) = happyAccept
action_69 _ = happyFail

action_70 (65) = happyShift action_87
action_70 _ = happyReduce_34

action_71 (68) = happyAccept
action_71 _ = happyFail

action_72 (67) = happyShift action_28
action_72 (25) = happyGoto action_86
action_72 _ = happyFail

action_73 (67) = happyShift action_28
action_73 (25) = happyGoto action_85
action_73 _ = happyFail

action_74 (51) = happyShift action_84
action_74 _ = happyFail

action_75 (68) = happyAccept
action_75 _ = happyFail

action_76 _ = happyReduce_28

action_77 (66) = happyShift action_22
action_77 (24) = happyGoto action_83
action_77 _ = happyFail

action_78 (68) = happyAccept
action_78 _ = happyFail

action_79 (52) = happyShift action_82
action_79 _ = happyFail

action_80 (68) = happyAccept
action_80 _ = happyFail

action_81 _ = happyReduce_23

action_82 (58) = happyShift action_77
action_82 (61) = happyShift action_72
action_82 (63) = happyShift action_73
action_82 (67) = happyShift action_28
action_82 (25) = happyGoto action_74
action_82 (27) = happyGoto action_128
action_82 (28) = happyGoto action_79
action_82 (29) = happyGoto action_76
action_82 _ = happyReduce_24

action_83 (67) = happyShift action_28
action_83 (25) = happyGoto action_67
action_83 (31) = happyGoto action_127
action_83 _ = happyFail

action_84 (47) = happyShift action_55
action_84 (55) = happyShift action_56
action_84 (60) = happyShift action_60
action_84 (66) = happyShift action_22
action_84 (67) = happyShift action_28
action_84 (24) = happyGoto action_57
action_84 (25) = happyGoto action_52
action_84 (35) = happyGoto action_58
action_84 (36) = happyGoto action_126
action_84 _ = happyFail

action_85 (47) = happyShift action_41
action_85 (56) = happyShift action_45
action_85 (57) = happyShift action_46
action_85 (59) = happyShift action_47
action_85 (60) = happyShift action_48
action_85 (66) = happyShift action_22
action_85 (67) = happyShift action_28
action_85 (24) = happyGoto action_37
action_85 (25) = happyGoto action_38
action_85 (38) = happyGoto action_42
action_85 (39) = happyGoto action_43
action_85 (40) = happyGoto action_125
action_85 _ = happyFail

action_86 (47) = happyShift action_41
action_86 (56) = happyShift action_45
action_86 (57) = happyShift action_46
action_86 (59) = happyShift action_47
action_86 (60) = happyShift action_48
action_86 (66) = happyShift action_22
action_86 (67) = happyShift action_28
action_86 (24) = happyGoto action_37
action_86 (25) = happyGoto action_38
action_86 (38) = happyGoto action_42
action_86 (39) = happyGoto action_43
action_86 (40) = happyGoto action_124
action_86 _ = happyFail

action_87 (66) = happyShift action_22
action_87 (24) = happyGoto action_65
action_87 (30) = happyGoto action_123
action_87 (32) = happyGoto action_70
action_87 _ = happyReduce_33

action_88 _ = happyReduce_37

action_89 (47) = happyShift action_55
action_89 (55) = happyShift action_56
action_89 (66) = happyShift action_22
action_89 (67) = happyShift action_28
action_89 (24) = happyGoto action_51
action_89 (25) = happyGoto action_52
action_89 (34) = happyGoto action_90
action_89 (35) = happyGoto action_63
action_89 _ = happyReduce_38

action_90 _ = happyReduce_40

action_91 (50) = happyShift action_122
action_91 _ = happyFail

action_92 (47) = happyShift action_55
action_92 (55) = happyShift action_56
action_92 (60) = happyShift action_60
action_92 (66) = happyShift action_22
action_92 (67) = happyShift action_28
action_92 (24) = happyGoto action_57
action_92 (25) = happyGoto action_52
action_92 (35) = happyGoto action_58
action_92 (36) = happyGoto action_121
action_92 _ = happyFail

action_93 _ = happyReduce_47

action_94 (48) = happyShift action_120
action_94 _ = happyFail

action_95 _ = happyReduce_51

action_96 (47) = happyShift action_41
action_96 (66) = happyShift action_22
action_96 (67) = happyShift action_28
action_96 (24) = happyGoto action_37
action_96 (25) = happyGoto action_38
action_96 (38) = happyGoto action_42
action_96 (39) = happyGoto action_119
action_96 _ = happyFail

action_97 (51) = happyShift action_118
action_97 _ = happyFail

action_98 (51) = happyShift action_117
action_98 _ = happyFail

action_99 (62) = happyShift action_116
action_99 _ = happyFail

action_100 (51) = happyShift action_115
action_100 _ = happyFail

action_101 (47) = happyShift action_41
action_101 (66) = happyShift action_22
action_101 (67) = happyShift action_28
action_101 (24) = happyGoto action_37
action_101 (25) = happyGoto action_38
action_101 (38) = happyGoto action_42
action_101 (39) = happyGoto action_114
action_101 _ = happyFail

action_102 _ = happyReduce_55

action_103 (48) = happyShift action_113
action_103 _ = happyFail

action_104 _ = happyReduce_65

action_105 (47) = happyShift action_41
action_105 (66) = happyShift action_22
action_105 (67) = happyShift action_28
action_105 (24) = happyGoto action_37
action_105 (25) = happyGoto action_38
action_105 (38) = happyGoto action_42
action_105 (39) = happyGoto action_112
action_105 _ = happyFail

action_106 (47) = happyShift action_27
action_106 (66) = happyShift action_22
action_106 (67) = happyShift action_28
action_106 (24) = happyGoto action_29
action_106 (25) = happyGoto action_24
action_106 (42) = happyGoto action_33
action_106 (43) = happyGoto action_111
action_106 (44) = happyGoto action_30
action_106 (45) = happyGoto action_35
action_106 _ = happyReduce_67

action_107 _ = happyReduce_73

action_108 (48) = happyShift action_110
action_108 _ = happyFail

action_109 _ = happyReduce_76

action_110 _ = happyReduce_72

action_111 _ = happyReduce_69

action_112 (53) = happyShift action_96
action_112 _ = happyReduce_66

action_113 _ = happyReduce_54

action_114 (53) = happyShift action_96
action_114 (54) = happyShift action_138
action_114 _ = happyReduce_56

action_115 (47) = happyShift action_55
action_115 (55) = happyShift action_56
action_115 (60) = happyShift action_60
action_115 (66) = happyShift action_22
action_115 (67) = happyShift action_28
action_115 (24) = happyGoto action_57
action_115 (25) = happyGoto action_52
action_115 (35) = happyGoto action_58
action_115 (36) = happyGoto action_137
action_115 _ = happyFail

action_116 (47) = happyShift action_27
action_116 (66) = happyShift action_22
action_116 (67) = happyShift action_28
action_116 (24) = happyGoto action_29
action_116 (25) = happyGoto action_24
action_116 (42) = happyGoto action_33
action_116 (43) = happyGoto action_136
action_116 (44) = happyGoto action_30
action_116 (45) = happyGoto action_35
action_116 _ = happyReduce_67

action_117 (47) = happyShift action_55
action_117 (55) = happyShift action_56
action_117 (60) = happyShift action_60
action_117 (66) = happyShift action_22
action_117 (67) = happyShift action_28
action_117 (24) = happyGoto action_57
action_117 (25) = happyGoto action_52
action_117 (35) = happyGoto action_58
action_117 (36) = happyGoto action_135
action_117 _ = happyFail

action_118 (47) = happyShift action_55
action_118 (55) = happyShift action_56
action_118 (60) = happyShift action_60
action_118 (66) = happyShift action_22
action_118 (67) = happyShift action_28
action_118 (24) = happyGoto action_57
action_118 (25) = happyGoto action_52
action_118 (35) = happyGoto action_58
action_118 (36) = happyGoto action_134
action_118 _ = happyFail

action_119 (53) = happyShift action_96
action_119 _ = happyReduce_56

action_120 _ = happyReduce_45

action_121 _ = happyReduce_46

action_122 (47) = happyShift action_55
action_122 (55) = happyShift action_56
action_122 (60) = happyShift action_60
action_122 (66) = happyShift action_22
action_122 (67) = happyShift action_28
action_122 (24) = happyGoto action_57
action_122 (25) = happyGoto action_52
action_122 (35) = happyGoto action_58
action_122 (36) = happyGoto action_133
action_122 _ = happyFail

action_123 _ = happyReduce_35

action_124 (64) = happyShift action_132
action_124 _ = happyReduce_31

action_125 (64) = happyShift action_131
action_125 _ = happyReduce_29

action_126 (52) = happyShift action_130
action_126 _ = happyFail

action_127 (53) = happyShift action_129
action_127 _ = happyFail

action_128 _ = happyReduce_25

action_129 (66) = happyShift action_22
action_129 (24) = happyGoto action_65
action_129 (30) = happyGoto action_146
action_129 (32) = happyGoto action_70
action_129 _ = happyReduce_33

action_130 (67) = happyShift action_28
action_130 (25) = happyGoto action_145
action_130 _ = happyFail

action_131 (67) = happyShift action_28
action_131 (25) = happyGoto action_67
action_131 (31) = happyGoto action_144
action_131 _ = happyFail

action_132 (67) = happyShift action_28
action_132 (25) = happyGoto action_67
action_132 (31) = happyGoto action_143
action_132 _ = happyFail

action_133 _ = happyReduce_48

action_134 (50) = happyShift action_142
action_134 _ = happyFail

action_135 (50) = happyShift action_141
action_135 _ = happyFail

action_136 _ = happyReduce_62

action_137 (50) = happyShift action_140
action_137 _ = happyFail

action_138 (47) = happyShift action_41
action_138 (56) = happyShift action_45
action_138 (57) = happyShift action_46
action_138 (59) = happyShift action_47
action_138 (60) = happyShift action_48
action_138 (66) = happyShift action_22
action_138 (67) = happyShift action_28
action_138 (24) = happyGoto action_37
action_138 (25) = happyGoto action_38
action_138 (38) = happyGoto action_42
action_138 (39) = happyGoto action_43
action_138 (40) = happyGoto action_139
action_138 _ = happyFail

action_139 _ = happyReduce_61

action_140 (47) = happyShift action_41
action_140 (56) = happyShift action_45
action_140 (57) = happyShift action_46
action_140 (59) = happyShift action_47
action_140 (60) = happyShift action_48
action_140 (66) = happyShift action_22
action_140 (67) = happyShift action_28
action_140 (24) = happyGoto action_37
action_140 (25) = happyGoto action_38
action_140 (38) = happyGoto action_42
action_140 (39) = happyGoto action_43
action_140 (40) = happyGoto action_150
action_140 _ = happyFail

action_141 (47) = happyShift action_41
action_141 (56) = happyShift action_45
action_141 (57) = happyShift action_46
action_141 (59) = happyShift action_47
action_141 (60) = happyShift action_48
action_141 (66) = happyShift action_22
action_141 (67) = happyShift action_28
action_141 (24) = happyGoto action_37
action_141 (25) = happyGoto action_38
action_141 (38) = happyGoto action_42
action_141 (39) = happyGoto action_43
action_141 (40) = happyGoto action_149
action_141 _ = happyFail

action_142 (47) = happyShift action_41
action_142 (56) = happyShift action_45
action_142 (57) = happyShift action_46
action_142 (59) = happyShift action_47
action_142 (60) = happyShift action_48
action_142 (66) = happyShift action_22
action_142 (67) = happyShift action_28
action_142 (24) = happyGoto action_37
action_142 (25) = happyGoto action_38
action_142 (38) = happyGoto action_42
action_142 (39) = happyGoto action_43
action_142 (40) = happyGoto action_148
action_142 _ = happyFail

action_143 _ = happyReduce_32

action_144 _ = happyReduce_30

action_145 (67) = happyShift action_28
action_145 (25) = happyGoto action_67
action_145 (31) = happyGoto action_147
action_145 _ = happyFail

action_146 _ = happyReduce_26

action_147 (53) = happyShift action_151
action_147 _ = happyFail

action_148 _ = happyReduce_59

action_149 _ = happyReduce_60

action_150 _ = happyReduce_58

action_151 (47) = happyShift action_41
action_151 (56) = happyShift action_45
action_151 (57) = happyShift action_46
action_151 (59) = happyShift action_47
action_151 (60) = happyShift action_48
action_151 (66) = happyShift action_22
action_151 (67) = happyShift action_28
action_151 (24) = happyGoto action_37
action_151 (25) = happyGoto action_38
action_151 (38) = happyGoto action_42
action_151 (39) = happyGoto action_43
action_151 (40) = happyGoto action_152
action_151 _ = happyFail

action_152 _ = happyReduce_27

happyReduce_21 = happySpecReduce_1  24 happyReduction_21
happyReduction_21 (HappyTerminal (PT _ (T_UIdent happy_var_1)))
	 =  HappyAbsSyn24
		 (UIdent (happy_var_1)
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  25 happyReduction_22
happyReduction_22 (HappyTerminal (PT _ (T_LIdent happy_var_1)))
	 =  HappyAbsSyn25
		 (LIdent (happy_var_1)
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  26 happyReduction_23
happyReduction_23 (HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 (L.Abs.P happy_var_1
	)
happyReduction_23 _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  27 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ((:[]) happy_var_1
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  27 happyReduction_25
happyReduction_25 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 5 28 happyReduction_26
happyReduction_26 ((HappyAbsSyn30  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_3) `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (L.Abs.DData happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_27 = happyReduce 8 28 happyReduction_27
happyReduction_27 ((HappyAbsSyn38  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_6) `HappyStk`
	(HappyAbsSyn25  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_5 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_28 = happySpecReduce_1  28 happyReduction_28
happyReduction_28 (HappyAbsSyn29  happy_var_1)
	 =  HappyAbsSyn28
		 (L.Abs.DThm happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  29 happyReduction_29
happyReduction_29 (HappyAbsSyn38  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn29
		 (L.Abs.TStandalone happy_var_2 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happyReduce 5 29 happyReduction_30
happyReduction_30 ((HappyAbsSyn31  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (L.Abs.TUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_31 = happySpecReduce_3  29 happyReduction_31
happyReduction_31 (HappyAbsSyn38  happy_var_3)
	(HappyAbsSyn25  happy_var_2)
	_
	 =  HappyAbsSyn29
		 (L.Abs.TLemma happy_var_2 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 5 29 happyReduction_32
happyReduction_32 ((HappyAbsSyn31  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn29
		 (L.Abs.TLemmaUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_33 = happySpecReduce_0  30 happyReduction_33
happyReduction_33  =  HappyAbsSyn30
		 ([]
	)

happyReduce_34 = happySpecReduce_1  30 happyReduction_34
happyReduction_34 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 ((:[]) happy_var_1
	)
happyReduction_34 _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  30 happyReduction_35
happyReduction_35 (HappyAbsSyn30  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn30
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  31 happyReduction_36
happyReduction_36 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn31
		 ((:[]) happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  31 happyReduction_37
happyReduction_37 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn31
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  32 happyReduction_38
happyReduction_38 (HappyAbsSyn33  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_0  33 happyReduction_39
happyReduction_39  =  HappyAbsSyn33
		 ([]
	)

happyReduce_40 = happySpecReduce_2  33 happyReduction_40
happyReduction_40 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn33
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  34 happyReduction_41
happyReduction_41 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.Arg happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  35 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn35
		 (L.Abs.Formula
	)

happyReduce_43 = happySpecReduce_1  35 happyReduction_43
happyReduction_43 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.TypeVar happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  35 happyReduction_44
happyReduction_44 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  35 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn35  happy_var_2)
	_
	 =  HappyAbsSyn35
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_3  36 happyReduction_46
happyReduction_46 (HappyAbsSyn35  happy_var_3)
	_
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_46 _ _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_2  36 happyReduction_47
happyReduction_47 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn35
		 (L.Abs.TypeApp happy_var_1 happy_var_2
	)
happyReduction_47 _ _  = notHappyAtAll 

happyReduce_48 = happyReduce 4 36 happyReduction_48
happyReduction_48 ((HappyAbsSyn35  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn35
		 (L.Abs.TypeAll happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_49 = happySpecReduce_1  36 happyReduction_49
happyReduction_49 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn35
		 (happy_var_1
	)
happyReduction_49 _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_1  37 happyReduction_50
happyReduction_50 (HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn37
		 ((:[]) happy_var_1
	)
happyReduction_50 _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_2  37 happyReduction_51
happyReduction_51 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn35  happy_var_1)
	 =  HappyAbsSyn37
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_51 _ _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_1  38 happyReduction_52
happyReduction_52 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.EVar happy_var_1
	)
happyReduction_52 _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_1  38 happyReduction_53
happyReduction_53 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.ECon happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_3  38 happyReduction_54
happyReduction_54 _
	(HappyAbsSyn38  happy_var_2)
	_
	 =  HappyAbsSyn38
		 (happy_var_2
	)
happyReduction_54 _ _ _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  39 happyReduction_55
happyReduction_55 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  39 happyReduction_56
happyReduction_56 (HappyAbsSyn38  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.EEqual happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_1  39 happyReduction_57
happyReduction_57 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (happy_var_1
	)
happyReduction_57 _  = notHappyAtAll 

happyReduce_58 = happyReduce 6 40 happyReduction_58
happyReduction_58 ((HappyAbsSyn38  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn25  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (L.Abs.ELam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_59 = happyReduce 6 40 happyReduction_59
happyReduction_59 ((HappyAbsSyn38  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (L.Abs.EAll happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_60 = happyReduce 6 40 happyReduction_60
happyReduction_60 ((HappyAbsSyn38  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn35  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (L.Abs.EEx happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_61 = happyReduce 5 40 happyReduction_61
happyReduction_61 ((HappyAbsSyn38  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (L.Abs.EImpl happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_62 = happyReduce 4 40 happyReduction_62
happyReduction_62 ((HappyAbsSyn43  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn38  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn38
		 (L.Abs.ECase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_63 = happySpecReduce_1  40 happyReduction_63
happyReduction_63 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn38
		 (happy_var_1
	)
happyReduction_63 _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  41 happyReduction_64
happyReduction_64 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn41
		 ((:[]) happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_2  41 happyReduction_65
happyReduction_65 (HappyAbsSyn41  happy_var_2)
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn41
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_65 _ _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_3  42 happyReduction_66
happyReduction_66 (HappyAbsSyn38  happy_var_3)
	_
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_66 _ _ _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_0  43 happyReduction_67
happyReduction_67  =  HappyAbsSyn43
		 ([]
	)

happyReduce_68 = happySpecReduce_1  43 happyReduction_68
happyReduction_68 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn43
		 ((:[]) happy_var_1
	)
happyReduction_68 _  = notHappyAtAll 

happyReduce_69 = happySpecReduce_3  43 happyReduction_69
happyReduction_69 (HappyAbsSyn43  happy_var_3)
	_
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn43
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_69 _ _ _  = notHappyAtAll 

happyReduce_70 = happySpecReduce_1  44 happyReduction_70
happyReduction_70 (HappyAbsSyn25  happy_var_1)
	 =  HappyAbsSyn44
		 (L.Abs.PVar happy_var_1
	)
happyReduction_70 _  = notHappyAtAll 

happyReduce_71 = happySpecReduce_1  44 happyReduction_71
happyReduction_71 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn44
		 (L.Abs.PConE happy_var_1
	)
happyReduction_71 _  = notHappyAtAll 

happyReduce_72 = happySpecReduce_3  44 happyReduction_72
happyReduction_72 _
	(HappyAbsSyn44  happy_var_2)
	_
	 =  HappyAbsSyn44
		 (happy_var_2
	)
happyReduction_72 _ _ _  = notHappyAtAll 

happyReduce_73 = happySpecReduce_2  45 happyReduction_73
happyReduction_73 (HappyAbsSyn46  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn44
		 (L.Abs.PCon happy_var_1 happy_var_2
	)
happyReduction_73 _ _  = notHappyAtAll 

happyReduce_74 = happySpecReduce_1  45 happyReduction_74
happyReduction_74 (HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn44
		 (happy_var_1
	)
happyReduction_74 _  = notHappyAtAll 

happyReduce_75 = happySpecReduce_1  46 happyReduction_75
happyReduction_75 (HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn46
		 ((:[]) happy_var_1
	)
happyReduction_75 _  = notHappyAtAll 

happyReduce_76 = happySpecReduce_2  46 happyReduction_76
happyReduction_76 (HappyAbsSyn46  happy_var_2)
	(HappyAbsSyn44  happy_var_1)
	 =  HappyAbsSyn46
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_76 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 68 68 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 47;
	PT _ (TS _ 2) -> cont 48;
	PT _ (TS _ 3) -> cont 49;
	PT _ (TS _ 4) -> cont 50;
	PT _ (TS _ 5) -> cont 51;
	PT _ (TS _ 6) -> cont 52;
	PT _ (TS _ 7) -> cont 53;
	PT _ (TS _ 8) -> cont 54;
	PT _ (TS _ 9) -> cont 55;
	PT _ (TS _ 10) -> cont 56;
	PT _ (TS _ 11) -> cont 57;
	PT _ (TS _ 12) -> cont 58;
	PT _ (TS _ 13) -> cont 59;
	PT _ (TS _ 14) -> cont 60;
	PT _ (TS _ 15) -> cont 61;
	PT _ (TS _ 16) -> cont 62;
	PT _ (TS _ 17) -> cont 63;
	PT _ (TS _ 18) -> cont 64;
	PT _ (TS _ 19) -> cont 65;
	PT _ (T_UIdent happy_dollar_dollar) -> cont 66;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 67;
	_ -> happyError' (tk:tks)
	}

happyError_ 68 tk tks = happyError' tks
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
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn26 z -> happyReturn z; _other -> notHappyAtAll })

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pThm tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListLIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pListCArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn33 z -> happyReturn z; _other -> notHappyAtAll })

pCArg tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn35 z -> happyReturn z; _other -> notHappyAtAll })

pListType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn37 z -> happyReturn z; _other -> notHappyAtAll })

pExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn38 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn43 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn44 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_19 tks) (\x -> case x of {HappyAbsSyn44 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_20 tks) (\x -> case x of {HappyAbsSyn46 z -> happyReturn z; _other -> notHappyAtAll })

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
