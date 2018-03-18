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
 action_127 :: () => Int -> ({-HappyReduction (Err) = -}
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
 happyReduce_66 :: () => ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

action_0 (53) = happyShift action_66
action_0 (55) = happyShift action_61
action_0 (57) = happyShift action_62
action_0 (61) = happyShift action_26
action_0 (23) = happyGoto action_63
action_0 (24) = happyGoto action_69
action_0 (25) = happyGoto action_70
action_0 (26) = happyGoto action_68
action_0 (27) = happyGoto action_65
action_0 _ = happyFail

action_1 (53) = happyShift action_66
action_1 (55) = happyShift action_61
action_1 (57) = happyShift action_62
action_1 (61) = happyShift action_26
action_1 (23) = happyGoto action_63
action_1 (25) = happyGoto action_67
action_1 (26) = happyGoto action_68
action_1 (27) = happyGoto action_65
action_1 _ = happyFail

action_2 (53) = happyShift action_66
action_2 (55) = happyShift action_61
action_2 (57) = happyShift action_62
action_2 (61) = happyShift action_26
action_2 (23) = happyGoto action_63
action_2 (26) = happyGoto action_64
action_2 (27) = happyGoto action_65
action_2 _ = happyFail

action_3 (55) = happyShift action_61
action_3 (57) = happyShift action_62
action_3 (27) = happyGoto action_60
action_3 _ = happyFail

action_4 (60) = happyShift action_20
action_4 (22) = happyGoto action_54
action_4 (28) = happyGoto action_58
action_4 (30) = happyGoto action_59
action_4 _ = happyReduce_31

action_5 (61) = happyShift action_26
action_5 (23) = happyGoto action_56
action_5 (29) = happyGoto action_57
action_5 _ = happyFail

action_6 (60) = happyShift action_20
action_6 (22) = happyGoto action_54
action_6 (30) = happyGoto action_55
action_6 _ = happyFail

action_7 (31) = happyGoto action_53
action_7 _ = happyReduce_37

action_8 (43) = happyShift action_51
action_8 (60) = happyShift action_20
action_8 (22) = happyGoto action_48
action_8 (32) = happyGoto action_52
action_8 _ = happyFail

action_9 (43) = happyShift action_51
action_9 (60) = happyShift action_20
action_9 (22) = happyGoto action_48
action_9 (32) = happyGoto action_49
action_9 (33) = happyGoto action_50
action_9 _ = happyFail

action_10 (43) = happyShift action_39
action_10 (60) = happyShift action_20
action_10 (61) = happyShift action_26
action_10 (22) = happyGoto action_35
action_10 (23) = happyGoto action_36
action_10 (34) = happyGoto action_47
action_10 _ = happyFail

action_11 (43) = happyShift action_39
action_11 (60) = happyShift action_20
action_11 (61) = happyShift action_26
action_11 (22) = happyGoto action_35
action_11 (23) = happyGoto action_36
action_11 (34) = happyGoto action_40
action_11 (35) = happyGoto action_46
action_11 _ = happyFail

action_12 (43) = happyShift action_39
action_12 (51) = happyShift action_43
action_12 (52) = happyShift action_44
action_12 (54) = happyShift action_45
action_12 (60) = happyShift action_20
action_12 (61) = happyShift action_26
action_12 (22) = happyGoto action_35
action_12 (23) = happyGoto action_36
action_12 (34) = happyGoto action_40
action_12 (35) = happyGoto action_41
action_12 (36) = happyGoto action_42
action_12 _ = happyFail

action_13 (43) = happyShift action_39
action_13 (60) = happyShift action_20
action_13 (61) = happyShift action_26
action_13 (22) = happyGoto action_35
action_13 (23) = happyGoto action_36
action_13 (34) = happyGoto action_37
action_13 (37) = happyGoto action_38
action_13 _ = happyFail

action_14 (43) = happyShift action_25
action_14 (60) = happyShift action_20
action_14 (61) = happyShift action_26
action_14 (22) = happyGoto action_27
action_14 (23) = happyGoto action_22
action_14 (38) = happyGoto action_34
action_14 (40) = happyGoto action_28
action_14 (41) = happyGoto action_33
action_14 _ = happyFail

action_15 (43) = happyShift action_25
action_15 (60) = happyShift action_20
action_15 (61) = happyShift action_26
action_15 (22) = happyGoto action_27
action_15 (23) = happyGoto action_22
action_15 (38) = happyGoto action_31
action_15 (39) = happyGoto action_32
action_15 (40) = happyGoto action_28
action_15 (41) = happyGoto action_33
action_15 _ = happyReduce_57

action_16 (43) = happyShift action_25
action_16 (60) = happyShift action_20
action_16 (61) = happyShift action_26
action_16 (22) = happyGoto action_21
action_16 (23) = happyGoto action_22
action_16 (40) = happyGoto action_30
action_16 _ = happyFail

action_17 (43) = happyShift action_25
action_17 (60) = happyShift action_20
action_17 (61) = happyShift action_26
action_17 (22) = happyGoto action_27
action_17 (23) = happyGoto action_22
action_17 (40) = happyGoto action_28
action_17 (41) = happyGoto action_29
action_17 _ = happyFail

action_18 (43) = happyShift action_25
action_18 (60) = happyShift action_20
action_18 (61) = happyShift action_26
action_18 (22) = happyGoto action_21
action_18 (23) = happyGoto action_22
action_18 (40) = happyGoto action_23
action_18 (42) = happyGoto action_24
action_18 _ = happyFail

action_19 (60) = happyShift action_20
action_19 _ = happyFail

action_20 _ = happyReduce_19

action_21 _ = happyReduce_61

action_22 _ = happyReduce_60

action_23 (43) = happyShift action_25
action_23 (60) = happyShift action_20
action_23 (61) = happyShift action_26
action_23 (22) = happyGoto action_21
action_23 (23) = happyGoto action_22
action_23 (40) = happyGoto action_23
action_23 (42) = happyGoto action_94
action_23 _ = happyReduce_65

action_24 (62) = happyAccept
action_24 _ = happyFail

action_25 (43) = happyShift action_25
action_25 (60) = happyShift action_20
action_25 (61) = happyShift action_26
action_25 (22) = happyGoto action_27
action_25 (23) = happyGoto action_22
action_25 (40) = happyGoto action_28
action_25 (41) = happyGoto action_93
action_25 _ = happyFail

action_26 _ = happyReduce_20

action_27 (43) = happyShift action_25
action_27 (60) = happyShift action_20
action_27 (61) = happyShift action_26
action_27 (22) = happyGoto action_21
action_27 (23) = happyGoto action_22
action_27 (40) = happyGoto action_23
action_27 (42) = happyGoto action_92
action_27 _ = happyReduce_61

action_28 _ = happyReduce_64

action_29 (62) = happyAccept
action_29 _ = happyFail

action_30 (62) = happyAccept
action_30 _ = happyFail

action_31 (59) = happyShift action_91
action_31 _ = happyReduce_58

action_32 (62) = happyAccept
action_32 _ = happyFail

action_33 (45) = happyShift action_90
action_33 _ = happyFail

action_34 (62) = happyAccept
action_34 _ = happyFail

action_35 _ = happyReduce_44

action_36 _ = happyReduce_43

action_37 (43) = happyShift action_39
action_37 (60) = happyShift action_20
action_37 (61) = happyShift action_26
action_37 (22) = happyGoto action_35
action_37 (23) = happyGoto action_36
action_37 (34) = happyGoto action_37
action_37 (37) = happyGoto action_89
action_37 _ = happyReduce_54

action_38 (62) = happyAccept
action_38 _ = happyFail

action_39 (43) = happyShift action_39
action_39 (51) = happyShift action_43
action_39 (52) = happyShift action_44
action_39 (54) = happyShift action_45
action_39 (60) = happyShift action_20
action_39 (61) = happyShift action_26
action_39 (22) = happyGoto action_35
action_39 (23) = happyGoto action_36
action_39 (34) = happyGoto action_40
action_39 (35) = happyGoto action_41
action_39 (36) = happyGoto action_88
action_39 _ = happyFail

action_40 (43) = happyShift action_39
action_40 (49) = happyShift action_87
action_40 (60) = happyShift action_20
action_40 (61) = happyShift action_26
action_40 (22) = happyGoto action_35
action_40 (23) = happyGoto action_36
action_40 (34) = happyGoto action_37
action_40 (37) = happyGoto action_86
action_40 _ = happyReduce_48

action_41 (50) = happyShift action_85
action_41 _ = happyReduce_53

action_42 (62) = happyAccept
action_42 _ = happyFail

action_43 (61) = happyShift action_26
action_43 (23) = happyGoto action_84
action_43 _ = happyFail

action_44 (43) = happyShift action_39
action_44 (51) = happyShift action_43
action_44 (52) = happyShift action_44
action_44 (54) = happyShift action_45
action_44 (60) = happyShift action_20
action_44 (61) = happyShift action_26
action_44 (22) = happyGoto action_35
action_44 (23) = happyGoto action_36
action_44 (34) = happyGoto action_40
action_44 (35) = happyGoto action_41
action_44 (36) = happyGoto action_83
action_44 _ = happyFail

action_45 (61) = happyShift action_26
action_45 (23) = happyGoto action_56
action_45 (29) = happyGoto action_82
action_45 _ = happyFail

action_46 (62) = happyAccept
action_46 _ = happyFail

action_47 (62) = happyAccept
action_47 _ = happyFail

action_48 _ = happyReduce_39

action_49 (45) = happyShift action_81
action_49 _ = happyReduce_42

action_50 (62) = happyAccept
action_50 _ = happyFail

action_51 (43) = happyShift action_51
action_51 (60) = happyShift action_20
action_51 (22) = happyGoto action_48
action_51 (32) = happyGoto action_49
action_51 (33) = happyGoto action_80
action_51 _ = happyFail

action_52 (62) = happyAccept
action_52 _ = happyFail

action_53 (43) = happyShift action_51
action_53 (60) = happyShift action_20
action_53 (62) = happyAccept
action_53 (22) = happyGoto action_48
action_53 (32) = happyGoto action_49
action_53 (33) = happyGoto action_79
action_53 _ = happyFail

action_54 (31) = happyGoto action_78
action_54 _ = happyReduce_37

action_55 (62) = happyAccept
action_55 _ = happyFail

action_56 (61) = happyShift action_26
action_56 (23) = happyGoto action_56
action_56 (29) = happyGoto action_77
action_56 _ = happyReduce_34

action_57 (62) = happyAccept
action_57 _ = happyFail

action_58 (62) = happyAccept
action_58 _ = happyFail

action_59 (59) = happyShift action_76
action_59 _ = happyReduce_32

action_60 (62) = happyAccept
action_60 _ = happyFail

action_61 (61) = happyShift action_26
action_61 (23) = happyGoto action_75
action_61 _ = happyFail

action_62 (61) = happyShift action_26
action_62 (23) = happyGoto action_74
action_62 _ = happyFail

action_63 (47) = happyShift action_73
action_63 _ = happyFail

action_64 (62) = happyAccept
action_64 _ = happyFail

action_65 _ = happyReduce_26

action_66 (60) = happyShift action_20
action_66 (22) = happyGoto action_72
action_66 _ = happyFail

action_67 (62) = happyAccept
action_67 _ = happyFail

action_68 (48) = happyShift action_71
action_68 _ = happyFail

action_69 (62) = happyAccept
action_69 _ = happyFail

action_70 _ = happyReduce_21

action_71 (53) = happyShift action_66
action_71 (55) = happyShift action_61
action_71 (57) = happyShift action_62
action_71 (61) = happyShift action_26
action_71 (23) = happyGoto action_63
action_71 (25) = happyGoto action_111
action_71 (26) = happyGoto action_68
action_71 (27) = happyGoto action_65
action_71 _ = happyReduce_22

action_72 (49) = happyShift action_110
action_72 _ = happyFail

action_73 (43) = happyShift action_51
action_73 (60) = happyShift action_20
action_73 (22) = happyGoto action_48
action_73 (32) = happyGoto action_49
action_73 (33) = happyGoto action_109
action_73 _ = happyFail

action_74 (43) = happyShift action_39
action_74 (51) = happyShift action_43
action_74 (52) = happyShift action_44
action_74 (54) = happyShift action_45
action_74 (60) = happyShift action_20
action_74 (61) = happyShift action_26
action_74 (22) = happyGoto action_35
action_74 (23) = happyGoto action_36
action_74 (34) = happyGoto action_40
action_74 (35) = happyGoto action_41
action_74 (36) = happyGoto action_108
action_74 _ = happyFail

action_75 (43) = happyShift action_39
action_75 (51) = happyShift action_43
action_75 (52) = happyShift action_44
action_75 (54) = happyShift action_45
action_75 (60) = happyShift action_20
action_75 (61) = happyShift action_26
action_75 (22) = happyGoto action_35
action_75 (23) = happyGoto action_36
action_75 (34) = happyGoto action_40
action_75 (35) = happyGoto action_41
action_75 (36) = happyGoto action_107
action_75 _ = happyFail

action_76 (60) = happyShift action_20
action_76 (22) = happyGoto action_54
action_76 (28) = happyGoto action_106
action_76 (30) = happyGoto action_59
action_76 _ = happyReduce_31

action_77 _ = happyReduce_35

action_78 (43) = happyShift action_51
action_78 (60) = happyShift action_20
action_78 (22) = happyGoto action_48
action_78 (32) = happyGoto action_49
action_78 (33) = happyGoto action_79
action_78 _ = happyReduce_36

action_79 _ = happyReduce_38

action_80 (44) = happyShift action_105
action_80 _ = happyFail

action_81 (43) = happyShift action_51
action_81 (60) = happyShift action_20
action_81 (22) = happyGoto action_48
action_81 (32) = happyGoto action_49
action_81 (33) = happyGoto action_104
action_81 _ = happyFail

action_82 (47) = happyShift action_103
action_82 _ = happyFail

action_83 (56) = happyShift action_102
action_83 _ = happyFail

action_84 (47) = happyShift action_101
action_84 _ = happyFail

action_85 (43) = happyShift action_39
action_85 (51) = happyShift action_43
action_85 (52) = happyShift action_44
action_85 (54) = happyShift action_45
action_85 (60) = happyShift action_20
action_85 (61) = happyShift action_26
action_85 (22) = happyGoto action_35
action_85 (23) = happyGoto action_36
action_85 (34) = happyGoto action_40
action_85 (35) = happyGoto action_41
action_85 (36) = happyGoto action_100
action_85 _ = happyFail

action_86 _ = happyReduce_46

action_87 (43) = happyShift action_39
action_87 (60) = happyShift action_20
action_87 (61) = happyShift action_26
action_87 (22) = happyGoto action_35
action_87 (23) = happyGoto action_36
action_87 (34) = happyGoto action_99
action_87 _ = happyFail

action_88 (44) = happyShift action_98
action_88 _ = happyFail

action_89 _ = happyReduce_55

action_90 (43) = happyShift action_39
action_90 (60) = happyShift action_20
action_90 (61) = happyShift action_26
action_90 (22) = happyGoto action_35
action_90 (23) = happyGoto action_36
action_90 (34) = happyGoto action_40
action_90 (35) = happyGoto action_97
action_90 _ = happyFail

action_91 (43) = happyShift action_25
action_91 (60) = happyShift action_20
action_91 (61) = happyShift action_26
action_91 (22) = happyGoto action_27
action_91 (23) = happyGoto action_22
action_91 (38) = happyGoto action_31
action_91 (39) = happyGoto action_96
action_91 (40) = happyGoto action_28
action_91 (41) = happyGoto action_33
action_91 _ = happyReduce_57

action_92 _ = happyReduce_63

action_93 (44) = happyShift action_95
action_93 _ = happyFail

action_94 _ = happyReduce_66

action_95 _ = happyReduce_62

action_96 _ = happyReduce_59

action_97 _ = happyReduce_56

action_98 _ = happyReduce_45

action_99 _ = happyReduce_47

action_100 _ = happyReduce_51

action_101 (43) = happyShift action_51
action_101 (60) = happyShift action_20
action_101 (22) = happyGoto action_48
action_101 (32) = happyGoto action_49
action_101 (33) = happyGoto action_118
action_101 _ = happyFail

action_102 (43) = happyShift action_25
action_102 (60) = happyShift action_20
action_102 (61) = happyShift action_26
action_102 (22) = happyGoto action_27
action_102 (23) = happyGoto action_22
action_102 (38) = happyGoto action_31
action_102 (39) = happyGoto action_117
action_102 (40) = happyGoto action_28
action_102 (41) = happyGoto action_33
action_102 _ = happyReduce_57

action_103 (43) = happyShift action_51
action_103 (60) = happyShift action_20
action_103 (22) = happyGoto action_48
action_103 (32) = happyGoto action_49
action_103 (33) = happyGoto action_116
action_103 _ = happyFail

action_104 _ = happyReduce_41

action_105 _ = happyReduce_40

action_106 _ = happyReduce_33

action_107 (58) = happyShift action_115
action_107 _ = happyReduce_29

action_108 (58) = happyShift action_114
action_108 _ = happyReduce_27

action_109 (61) = happyShift action_26
action_109 (23) = happyGoto action_113
action_109 _ = happyFail

action_110 (60) = happyShift action_20
action_110 (22) = happyGoto action_54
action_110 (28) = happyGoto action_112
action_110 (30) = happyGoto action_59
action_110 _ = happyReduce_31

action_111 _ = happyReduce_23

action_112 _ = happyReduce_24

action_113 (61) = happyShift action_26
action_113 (23) = happyGoto action_56
action_113 (29) = happyGoto action_123
action_113 _ = happyFail

action_114 (61) = happyShift action_26
action_114 (23) = happyGoto action_56
action_114 (29) = happyGoto action_122
action_114 _ = happyFail

action_115 (61) = happyShift action_26
action_115 (23) = happyGoto action_56
action_115 (29) = happyGoto action_121
action_115 _ = happyFail

action_116 (46) = happyShift action_120
action_116 _ = happyFail

action_117 _ = happyReduce_52

action_118 (46) = happyShift action_119
action_118 _ = happyFail

action_119 (43) = happyShift action_39
action_119 (51) = happyShift action_43
action_119 (52) = happyShift action_44
action_119 (54) = happyShift action_45
action_119 (60) = happyShift action_20
action_119 (61) = happyShift action_26
action_119 (22) = happyGoto action_35
action_119 (23) = happyGoto action_36
action_119 (34) = happyGoto action_40
action_119 (35) = happyGoto action_41
action_119 (36) = happyGoto action_126
action_119 _ = happyFail

action_120 (43) = happyShift action_39
action_120 (51) = happyShift action_43
action_120 (52) = happyShift action_44
action_120 (54) = happyShift action_45
action_120 (60) = happyShift action_20
action_120 (61) = happyShift action_26
action_120 (22) = happyGoto action_35
action_120 (23) = happyGoto action_36
action_120 (34) = happyGoto action_40
action_120 (35) = happyGoto action_41
action_120 (36) = happyGoto action_125
action_120 _ = happyFail

action_121 _ = happyReduce_30

action_122 _ = happyReduce_28

action_123 (49) = happyShift action_124
action_123 _ = happyFail

action_124 (43) = happyShift action_39
action_124 (51) = happyShift action_43
action_124 (52) = happyShift action_44
action_124 (54) = happyShift action_45
action_124 (60) = happyShift action_20
action_124 (61) = happyShift action_26
action_124 (22) = happyGoto action_35
action_124 (23) = happyGoto action_36
action_124 (34) = happyGoto action_40
action_124 (35) = happyGoto action_41
action_124 (36) = happyGoto action_127
action_124 _ = happyFail

action_125 _ = happyReduce_50

action_126 _ = happyReduce_49

action_127 _ = happyReduce_25

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

happyReduce_40 = happySpecReduce_3  32 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn32  happy_var_2)
	_
	 =  HappyAbsSyn32
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_3  33 happyReduction_41
happyReduction_41 (HappyAbsSyn32  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_41 _ _ _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  33 happyReduction_42
happyReduction_42 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn32
		 (happy_var_1
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  34 happyReduction_43
happyReduction_43 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EVar happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  34 happyReduction_44
happyReduction_44 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.ECon happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  34 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_2  35 happyReduction_46
happyReduction_46 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_46 _ _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_3  35 happyReduction_47
happyReduction_47 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EEqual happy_var_1 happy_var_3
	)
happyReduction_47 _ _ _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  35 happyReduction_48
happyReduction_48 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happyReduce 6 36 happyReduction_49
happyReduction_49 ((HappyAbsSyn34  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.ELam happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_50 = happyReduce 6 36 happyReduction_50
happyReduction_50 ((HappyAbsSyn34  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn32  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn29  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.EAll happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_3  36 happyReduction_51
happyReduction_51 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.EImpl happy_var_1 happy_var_3
	)
happyReduction_51 _ _ _  = notHappyAtAll 

happyReduce_52 = happyReduce 4 36 happyReduction_52
happyReduction_52 ((HappyAbsSyn39  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn34
		 (L.Abs.ECase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_1  36 happyReduction_53
happyReduction_53 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  37 happyReduction_54
happyReduction_54 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn37
		 ((:[]) happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  37 happyReduction_55
happyReduction_55 (HappyAbsSyn37  happy_var_2)
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn37
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  38 happyReduction_56
happyReduction_56 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn38
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_0  39 happyReduction_57
happyReduction_57  =  HappyAbsSyn39
		 ([]
	)

happyReduce_58 = happySpecReduce_1  39 happyReduction_58
happyReduction_58 (HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn39
		 ((:[]) happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  39 happyReduction_59
happyReduction_59 (HappyAbsSyn39  happy_var_3)
	_
	(HappyAbsSyn38  happy_var_1)
	 =  HappyAbsSyn39
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  40 happyReduction_60
happyReduction_60 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PVar happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  40 happyReduction_61
happyReduction_61 (HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PConE happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  40 happyReduction_62
happyReduction_62 _
	(HappyAbsSyn40  happy_var_2)
	_
	 =  HappyAbsSyn40
		 (happy_var_2
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  41 happyReduction_63
happyReduction_63 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn22  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.PCon happy_var_1 happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  41 happyReduction_64
happyReduction_64 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn40
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  42 happyReduction_65
happyReduction_65 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:[]) happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  42 happyReduction_66
happyReduction_66 (HappyAbsSyn42  happy_var_2)
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn42
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_66 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

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
	PT _ (T_UIdent happy_dollar_dollar) -> cont 60;
	PT _ (T_LIdent happy_dollar_dollar) -> cont 61;
	_ -> happyError' (tk:tks)
	}

happyError_ 62 tk tks = happyError' tks
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
