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
	| HappyAbsSyn23 (UIdent)
	| HappyAbsSyn24 (LIdent)
	| HappyAbsSyn25 (Program)
	| HappyAbsSyn26 ([Decl])
	| HappyAbsSyn27 (Decl)
	| HappyAbsSyn28 (Thm)
	| HappyAbsSyn29 ([Constructor])
	| HappyAbsSyn30 (Proposition)
	| HappyAbsSyn31 ([LIdent])
	| HappyAbsSyn32 (Constructor)
	| HappyAbsSyn33 ([Type])
	| HappyAbsSyn34 (Type)
	| HappyAbsSyn36 (Expr)
	| HappyAbsSyn39 ([Expr])
	| HappyAbsSyn40 (Alt)
	| HappyAbsSyn41 ([Alt])
	| HappyAbsSyn42 (Pat)
	| HappyAbsSyn44 ([Pat])

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
 action_122 :: () => Int -> ({-HappyReduction (Err) = -}
	   Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

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

action_0 (53) = happyShift action_68
action_0 (55) = happyShift action_63
action_0 (57) = happyShift action_64
action_0 (61) = happyShift action_27
action_0 (24) = happyGoto action_65
action_0 (25) = happyGoto action_71
action_0 (26) = happyGoto action_72
action_0 (27) = happyGoto action_70
action_0 (28) = happyGoto action_67
action_0 _ = happyFail

action_1 (53) = happyShift action_68
action_1 (55) = happyShift action_63
action_1 (57) = happyShift action_64
action_1 (61) = happyShift action_27
action_1 (24) = happyGoto action_65
action_1 (26) = happyGoto action_69
action_1 (27) = happyGoto action_70
action_1 (28) = happyGoto action_67
action_1 _ = happyFail

action_2 (53) = happyShift action_68
action_2 (55) = happyShift action_63
action_2 (57) = happyShift action_64
action_2 (61) = happyShift action_27
action_2 (24) = happyGoto action_65
action_2 (27) = happyGoto action_66
action_2 (28) = happyGoto action_67
action_2 _ = happyFail

action_3 (55) = happyShift action_63
action_3 (57) = happyShift action_64
action_3 (28) = happyGoto action_62
action_3 _ = happyFail

action_4 (60) = happyShift action_21
action_4 (23) = happyGoto action_53
action_4 (29) = happyGoto action_60
action_4 (32) = happyGoto action_61
action_4 _ = happyReduce_32

action_5 (45) = happyShift action_40
action_5 (52) = happyShift action_44
action_5 (54) = happyShift action_59
action_5 (60) = happyShift action_21
action_5 (61) = happyShift action_27
action_5 (23) = happyGoto action_36
action_5 (24) = happyGoto action_37
action_5 (30) = happyGoto action_57
action_5 (36) = happyGoto action_41
action_5 (37) = happyGoto action_42
action_5 (38) = happyGoto action_58
action_5 _ = happyFail

action_6 (61) = happyShift action_27
action_6 (24) = happyGoto action_55
action_6 (31) = happyGoto action_56
action_6 _ = happyFail

action_7 (60) = happyShift action_21
action_7 (23) = happyGoto action_53
action_7 (32) = happyGoto action_54
action_7 _ = happyFail

action_8 (33) = happyGoto action_52
action_8 _ = happyReduce_41

action_9 (45) = happyShift action_50
action_9 (60) = happyShift action_21
action_9 (23) = happyGoto action_47
action_9 (34) = happyGoto action_51
action_9 _ = happyFail

action_10 (45) = happyShift action_50
action_10 (60) = happyShift action_21
action_10 (23) = happyGoto action_47
action_10 (34) = happyGoto action_48
action_10 (35) = happyGoto action_49
action_10 _ = happyFail

action_11 (45) = happyShift action_40
action_11 (60) = happyShift action_21
action_11 (61) = happyShift action_27
action_11 (23) = happyGoto action_36
action_11 (24) = happyGoto action_37
action_11 (36) = happyGoto action_46
action_11 _ = happyFail

action_12 (45) = happyShift action_40
action_12 (60) = happyShift action_21
action_12 (61) = happyShift action_27
action_12 (23) = happyGoto action_36
action_12 (24) = happyGoto action_37
action_12 (36) = happyGoto action_41
action_12 (37) = happyGoto action_45
action_12 _ = happyFail

action_13 (45) = happyShift action_40
action_13 (52) = happyShift action_44
action_13 (60) = happyShift action_21
action_13 (61) = happyShift action_27
action_13 (23) = happyGoto action_36
action_13 (24) = happyGoto action_37
action_13 (36) = happyGoto action_41
action_13 (37) = happyGoto action_42
action_13 (38) = happyGoto action_43
action_13 _ = happyFail

action_14 (45) = happyShift action_40
action_14 (60) = happyShift action_21
action_14 (61) = happyShift action_27
action_14 (23) = happyGoto action_36
action_14 (24) = happyGoto action_37
action_14 (36) = happyGoto action_38
action_14 (39) = happyGoto action_39
action_14 _ = happyFail

action_15 (45) = happyShift action_26
action_15 (60) = happyShift action_21
action_15 (61) = happyShift action_27
action_15 (23) = happyGoto action_28
action_15 (24) = happyGoto action_23
action_15 (40) = happyGoto action_35
action_15 (42) = happyGoto action_29
action_15 (43) = happyGoto action_34
action_15 _ = happyFail

action_16 (45) = happyShift action_26
action_16 (60) = happyShift action_21
action_16 (61) = happyShift action_27
action_16 (23) = happyGoto action_28
action_16 (24) = happyGoto action_23
action_16 (40) = happyGoto action_32
action_16 (41) = happyGoto action_33
action_16 (42) = happyGoto action_29
action_16 (43) = happyGoto action_34
action_16 _ = happyReduce_57

action_17 (45) = happyShift action_26
action_17 (60) = happyShift action_21
action_17 (61) = happyShift action_27
action_17 (23) = happyGoto action_22
action_17 (24) = happyGoto action_23
action_17 (42) = happyGoto action_31
action_17 _ = happyFail

action_18 (45) = happyShift action_26
action_18 (60) = happyShift action_21
action_18 (61) = happyShift action_27
action_18 (23) = happyGoto action_28
action_18 (24) = happyGoto action_23
action_18 (42) = happyGoto action_29
action_18 (43) = happyGoto action_30
action_18 _ = happyFail

action_19 (45) = happyShift action_26
action_19 (60) = happyShift action_21
action_19 (61) = happyShift action_27
action_19 (23) = happyGoto action_22
action_19 (24) = happyGoto action_23
action_19 (42) = happyGoto action_24
action_19 (44) = happyGoto action_25
action_19 _ = happyFail

action_20 (60) = happyShift action_21
action_20 _ = happyFail

action_21 _ = happyReduce_20

action_22 _ = happyReduce_61

action_23 _ = happyReduce_60

action_24 (45) = happyShift action_26
action_24 (60) = happyShift action_21
action_24 (61) = happyShift action_27
action_24 (23) = happyGoto action_22
action_24 (24) = happyGoto action_23
action_24 (42) = happyGoto action_24
action_24 (44) = happyGoto action_94
action_24 _ = happyReduce_65

action_25 (62) = happyAccept
action_25 _ = happyFail

action_26 (45) = happyShift action_26
action_26 (60) = happyShift action_21
action_26 (61) = happyShift action_27
action_26 (23) = happyGoto action_28
action_26 (24) = happyGoto action_23
action_26 (42) = happyGoto action_29
action_26 (43) = happyGoto action_93
action_26 _ = happyFail

action_27 _ = happyReduce_21

action_28 (45) = happyShift action_26
action_28 (60) = happyShift action_21
action_28 (61) = happyShift action_27
action_28 (23) = happyGoto action_22
action_28 (24) = happyGoto action_23
action_28 (42) = happyGoto action_24
action_28 (44) = happyGoto action_92
action_28 _ = happyReduce_61

action_29 _ = happyReduce_64

action_30 (62) = happyAccept
action_30 _ = happyFail

action_31 (62) = happyAccept
action_31 _ = happyFail

action_32 (59) = happyShift action_91
action_32 _ = happyReduce_58

action_33 (62) = happyAccept
action_33 _ = happyFail

action_34 (47) = happyShift action_90
action_34 _ = happyFail

action_35 (62) = happyAccept
action_35 _ = happyFail

action_36 _ = happyReduce_48

action_37 _ = happyReduce_47

action_38 (45) = happyShift action_40
action_38 (60) = happyShift action_21
action_38 (61) = happyShift action_27
action_38 (23) = happyGoto action_36
action_38 (24) = happyGoto action_37
action_38 (36) = happyGoto action_38
action_38 (39) = happyGoto action_89
action_38 _ = happyReduce_54

action_39 (62) = happyAccept
action_39 _ = happyFail

action_40 (45) = happyShift action_40
action_40 (52) = happyShift action_44
action_40 (60) = happyShift action_21
action_40 (61) = happyShift action_27
action_40 (23) = happyGoto action_36
action_40 (24) = happyGoto action_37
action_40 (36) = happyGoto action_41
action_40 (37) = happyGoto action_42
action_40 (38) = happyGoto action_88
action_40 _ = happyFail

action_41 (45) = happyShift action_40
action_41 (60) = happyShift action_21
action_41 (61) = happyShift action_27
action_41 (23) = happyGoto action_36
action_41 (24) = happyGoto action_37
action_41 (36) = happyGoto action_38
action_41 (39) = happyGoto action_87
action_41 _ = happyReduce_51

action_42 _ = happyReduce_53

action_43 (62) = happyAccept
action_43 _ = happyFail

action_44 (45) = happyShift action_40
action_44 (52) = happyShift action_44
action_44 (60) = happyShift action_21
action_44 (61) = happyShift action_27
action_44 (23) = happyGoto action_36
action_44 (24) = happyGoto action_37
action_44 (36) = happyGoto action_41
action_44 (37) = happyGoto action_42
action_44 (38) = happyGoto action_86
action_44 _ = happyFail

action_45 (62) = happyAccept
action_45 _ = happyFail

action_46 (62) = happyAccept
action_46 _ = happyFail

action_47 _ = happyReduce_43

action_48 (47) = happyShift action_85
action_48 _ = happyReduce_46

action_49 (62) = happyAccept
action_49 _ = happyFail

action_50 (45) = happyShift action_50
action_50 (60) = happyShift action_21
action_50 (23) = happyGoto action_47
action_50 (34) = happyGoto action_48
action_50 (35) = happyGoto action_84
action_50 _ = happyFail

action_51 (62) = happyAccept
action_51 _ = happyFail

action_52 (45) = happyShift action_50
action_52 (60) = happyShift action_21
action_52 (62) = happyAccept
action_52 (23) = happyGoto action_47
action_52 (34) = happyGoto action_48
action_52 (35) = happyGoto action_83
action_52 _ = happyFail

action_53 (33) = happyGoto action_82
action_53 _ = happyReduce_41

action_54 (62) = happyAccept
action_54 _ = happyFail

action_55 (61) = happyShift action_27
action_55 (24) = happyGoto action_55
action_55 (31) = happyGoto action_81
action_55 _ = happyReduce_38

action_56 (62) = happyAccept
action_56 _ = happyFail

action_57 (62) = happyAccept
action_57 _ = happyFail

action_58 (51) = happyShift action_80
action_58 _ = happyReduce_37

action_59 (61) = happyShift action_27
action_59 (24) = happyGoto action_55
action_59 (31) = happyGoto action_79
action_59 _ = happyFail

action_60 (62) = happyAccept
action_60 _ = happyFail

action_61 (59) = happyShift action_78
action_61 _ = happyReduce_33

action_62 (62) = happyAccept
action_62 _ = happyFail

action_63 (61) = happyShift action_27
action_63 (24) = happyGoto action_77
action_63 _ = happyFail

action_64 (61) = happyShift action_27
action_64 (24) = happyGoto action_76
action_64 _ = happyFail

action_65 (49) = happyShift action_75
action_65 _ = happyFail

action_66 (62) = happyAccept
action_66 _ = happyFail

action_67 _ = happyReduce_27

action_68 (60) = happyShift action_21
action_68 (23) = happyGoto action_74
action_68 _ = happyFail

action_69 (62) = happyAccept
action_69 _ = happyFail

action_70 (50) = happyShift action_73
action_70 _ = happyFail

action_71 (62) = happyAccept
action_71 _ = happyFail

action_72 _ = happyReduce_22

action_73 (53) = happyShift action_68
action_73 (55) = happyShift action_63
action_73 (57) = happyShift action_64
action_73 (61) = happyShift action_27
action_73 (24) = happyGoto action_65
action_73 (26) = happyGoto action_109
action_73 (27) = happyGoto action_70
action_73 (28) = happyGoto action_67
action_73 _ = happyReduce_23

action_74 (51) = happyShift action_108
action_74 _ = happyFail

action_75 (45) = happyShift action_50
action_75 (60) = happyShift action_21
action_75 (23) = happyGoto action_47
action_75 (34) = happyGoto action_48
action_75 (35) = happyGoto action_107
action_75 _ = happyFail

action_76 (45) = happyShift action_40
action_76 (52) = happyShift action_44
action_76 (54) = happyShift action_59
action_76 (60) = happyShift action_21
action_76 (61) = happyShift action_27
action_76 (23) = happyGoto action_36
action_76 (24) = happyGoto action_37
action_76 (30) = happyGoto action_106
action_76 (36) = happyGoto action_41
action_76 (37) = happyGoto action_42
action_76 (38) = happyGoto action_58
action_76 _ = happyFail

action_77 (45) = happyShift action_40
action_77 (52) = happyShift action_44
action_77 (54) = happyShift action_59
action_77 (60) = happyShift action_21
action_77 (61) = happyShift action_27
action_77 (23) = happyGoto action_36
action_77 (24) = happyGoto action_37
action_77 (30) = happyGoto action_105
action_77 (36) = happyGoto action_41
action_77 (37) = happyGoto action_42
action_77 (38) = happyGoto action_58
action_77 _ = happyFail

action_78 (60) = happyShift action_21
action_78 (23) = happyGoto action_53
action_78 (29) = happyGoto action_104
action_78 (32) = happyGoto action_61
action_78 _ = happyReduce_32

action_79 (49) = happyShift action_103
action_79 _ = happyFail

action_80 (45) = happyShift action_40
action_80 (52) = happyShift action_44
action_80 (60) = happyShift action_21
action_80 (61) = happyShift action_27
action_80 (23) = happyGoto action_36
action_80 (24) = happyGoto action_37
action_80 (36) = happyGoto action_41
action_80 (37) = happyGoto action_42
action_80 (38) = happyGoto action_102
action_80 _ = happyFail

action_81 _ = happyReduce_39

action_82 (45) = happyShift action_50
action_82 (60) = happyShift action_21
action_82 (23) = happyGoto action_47
action_82 (34) = happyGoto action_48
action_82 (35) = happyGoto action_83
action_82 _ = happyReduce_40

action_83 _ = happyReduce_42

action_84 (46) = happyShift action_101
action_84 _ = happyFail

action_85 (45) = happyShift action_50
action_85 (60) = happyShift action_21
action_85 (23) = happyGoto action_47
action_85 (34) = happyGoto action_48
action_85 (35) = happyGoto action_100
action_85 _ = happyFail

action_86 (56) = happyShift action_99
action_86 _ = happyFail

action_87 _ = happyReduce_50

action_88 (46) = happyShift action_98
action_88 _ = happyFail

action_89 _ = happyReduce_55

action_90 (45) = happyShift action_40
action_90 (60) = happyShift action_21
action_90 (61) = happyShift action_27
action_90 (23) = happyGoto action_36
action_90 (24) = happyGoto action_37
action_90 (36) = happyGoto action_41
action_90 (37) = happyGoto action_97
action_90 _ = happyFail

action_91 (45) = happyShift action_26
action_91 (60) = happyShift action_21
action_91 (61) = happyShift action_27
action_91 (23) = happyGoto action_28
action_91 (24) = happyGoto action_23
action_91 (40) = happyGoto action_32
action_91 (41) = happyGoto action_96
action_91 (42) = happyGoto action_29
action_91 (43) = happyGoto action_34
action_91 _ = happyReduce_57

action_92 _ = happyReduce_63

action_93 (46) = happyShift action_95
action_93 _ = happyFail

action_94 _ = happyReduce_66

action_95 _ = happyReduce_62

action_96 _ = happyReduce_59

action_97 _ = happyReduce_56

action_98 _ = happyReduce_49

action_99 (45) = happyShift action_26
action_99 (60) = happyShift action_21
action_99 (61) = happyShift action_27
action_99 (23) = happyGoto action_28
action_99 (24) = happyGoto action_23
action_99 (40) = happyGoto action_32
action_99 (41) = happyGoto action_115
action_99 (42) = happyGoto action_29
action_99 (43) = happyGoto action_34
action_99 _ = happyReduce_57

action_100 _ = happyReduce_45

action_101 _ = happyReduce_44

action_102 _ = happyReduce_36

action_103 (45) = happyShift action_50
action_103 (60) = happyShift action_21
action_103 (23) = happyGoto action_47
action_103 (34) = happyGoto action_48
action_103 (35) = happyGoto action_114
action_103 _ = happyFail

action_104 _ = happyReduce_34

action_105 (58) = happyShift action_113
action_105 _ = happyReduce_30

action_106 (58) = happyShift action_112
action_106 _ = happyReduce_28

action_107 (61) = happyShift action_27
action_107 (24) = happyGoto action_111
action_107 _ = happyFail

action_108 (60) = happyShift action_21
action_108 (23) = happyGoto action_53
action_108 (29) = happyGoto action_110
action_108 (32) = happyGoto action_61
action_108 _ = happyReduce_32

action_109 _ = happyReduce_24

action_110 _ = happyReduce_25

action_111 (61) = happyShift action_27
action_111 (24) = happyGoto action_55
action_111 (31) = happyGoto action_119
action_111 _ = happyFail

action_112 (61) = happyShift action_27
action_112 (24) = happyGoto action_55
action_112 (31) = happyGoto action_118
action_112 _ = happyFail

action_113 (61) = happyShift action_27
action_113 (24) = happyGoto action_55
action_113 (31) = happyGoto action_117
action_113 _ = happyFail

action_114 (48) = happyShift action_116
action_114 _ = happyFail

action_115 _ = happyReduce_52

action_116 (45) = happyShift action_40
action_116 (52) = happyShift action_44
action_116 (54) = happyShift action_59
action_116 (60) = happyShift action_21
action_116 (61) = happyShift action_27
action_116 (23) = happyGoto action_36
action_116 (24) = happyGoto action_37
action_116 (30) = happyGoto action_121
action_116 (36) = happyGoto action_41
action_116 (37) = happyGoto action_42
action_116 (38) = happyGoto action_58
action_116 _ = happyFail

action_117 _ = happyReduce_31

action_118 _ = happyReduce_29

action_119 (51) = happyShift action_120
action_119 _ = happyFail

action_120 (45) = happyShift action_40
action_120 (52) = happyShift action_44
action_120 (60) = happyShift action_21
action_120 (61) = happyShift action_27
action_120 (23) = happyGoto action_36
action_120 (24) = happyGoto action_37
action_120 (36) = happyGoto action_41
action_120 (37) = happyGoto action_42
action_120 (38) = happyGoto action_122
action_120 _ = happyFail

action_121 _ = happyReduce_35

action_122 _ = happyReduce_26

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

happyReduce_23 = happySpecReduce_2  26 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((:[]) happy_var_1
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  26 happyReduction_24
happyReduction_24 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn27  happy_var_1)
	 =  HappyAbsSyn26
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happyReduce 4 27 happyReduction_25
happyReduction_25 ((HappyAbsSyn29  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn23  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (L.Abs.DData happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_26 = happyReduce 7 27 happyReduction_26
happyReduction_26 ((HappyAbsSyn36  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_5) `HappyStk`
	(HappyAbsSyn24  happy_var_4) `HappyStk`
	(HappyAbsSyn34  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn24  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn27
		 (L.Abs.DFun happy_var_1 happy_var_3 happy_var_4 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  27 happyReduction_27
happyReduction_27 (HappyAbsSyn28  happy_var_1)
	 =  HappyAbsSyn27
		 (L.Abs.DThm happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  28 happyReduction_28
happyReduction_28 (HappyAbsSyn30  happy_var_3)
	(HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn28
		 (L.Abs.TStandalone happy_var_2 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happyReduce 5 28 happyReduction_29
happyReduction_29 ((HappyAbsSyn31  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_3) `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (L.Abs.TUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  28 happyReduction_30
happyReduction_30 (HappyAbsSyn30  happy_var_3)
	(HappyAbsSyn24  happy_var_2)
	_
	 =  HappyAbsSyn28
		 (L.Abs.TLemma happy_var_2 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 5 28 happyReduction_31
happyReduction_31 ((HappyAbsSyn31  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn30  happy_var_3) `HappyStk`
	(HappyAbsSyn24  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn28
		 (L.Abs.TLemmaUsing happy_var_2 happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_32 = happySpecReduce_0  29 happyReduction_32
happyReduction_32  =  HappyAbsSyn29
		 ([]
	)

happyReduce_33 = happySpecReduce_1  29 happyReduction_33
happyReduction_33 (HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn29
		 ((:[]) happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  29 happyReduction_34
happyReduction_34 (HappyAbsSyn29  happy_var_3)
	_
	(HappyAbsSyn32  happy_var_1)
	 =  HappyAbsSyn29
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 6 30 happyReduction_35
happyReduction_35 ((HappyAbsSyn30  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn34  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn31  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn30
		 (L.Abs.PForall happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_3  30 happyReduction_36
happyReduction_36 (HappyAbsSyn36  happy_var_3)
	_
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.PEqual happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  30 happyReduction_37
happyReduction_37 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn30
		 (L.Abs.PExpr happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  31 happyReduction_38
happyReduction_38 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn31
		 ((:[]) happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_2  31 happyReduction_39
happyReduction_39 (HappyAbsSyn31  happy_var_2)
	(HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn31
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_39 _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  32 happyReduction_40
happyReduction_40 (HappyAbsSyn33  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn32
		 (L.Abs.C happy_var_1 (reverse happy_var_2)
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_0  33 happyReduction_41
happyReduction_41  =  HappyAbsSyn33
		 ([]
	)

happyReduce_42 = happySpecReduce_2  33 happyReduction_42
happyReduction_42 (HappyAbsSyn34  happy_var_2)
	(HappyAbsSyn33  happy_var_1)
	 =  HappyAbsSyn33
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_42 _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  34 happyReduction_43
happyReduction_43 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.MonoType happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_3  34 happyReduction_44
happyReduction_44 _
	(HappyAbsSyn34  happy_var_2)
	_
	 =  HappyAbsSyn34
		 (happy_var_2
	)
happyReduction_44 _ _ _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  35 happyReduction_45
happyReduction_45 (HappyAbsSyn34  happy_var_3)
	_
	(HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (L.Abs.FunType happy_var_1 happy_var_3
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyReduce_46 = happySpecReduce_1  35 happyReduction_46
happyReduction_46 (HappyAbsSyn34  happy_var_1)
	 =  HappyAbsSyn34
		 (happy_var_1
	)
happyReduction_46 _  = notHappyAtAll 

happyReduce_47 = happySpecReduce_1  36 happyReduction_47
happyReduction_47 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.EVar happy_var_1
	)
happyReduction_47 _  = notHappyAtAll 

happyReduce_48 = happySpecReduce_1  36 happyReduction_48
happyReduction_48 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.ECon happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  36 happyReduction_49
happyReduction_49 _
	(HappyAbsSyn36  happy_var_2)
	_
	 =  HappyAbsSyn36
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happySpecReduce_2  37 happyReduction_50
happyReduction_50 (HappyAbsSyn39  happy_var_2)
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn36
		 (L.Abs.EApp happy_var_1 happy_var_2
	)
happyReduction_50 _ _  = notHappyAtAll 

happyReduce_51 = happySpecReduce_1  37 happyReduction_51
happyReduction_51 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happyReduce 4 38 happyReduction_52
happyReduction_52 ((HappyAbsSyn41  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn36  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn36
		 (L.Abs.ECase happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_53 = happySpecReduce_1  38 happyReduction_53
happyReduction_53 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn36
		 (happy_var_1
	)
happyReduction_53 _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  39 happyReduction_54
happyReduction_54 (HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn39
		 ((:[]) happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_2  39 happyReduction_55
happyReduction_55 (HappyAbsSyn39  happy_var_2)
	(HappyAbsSyn36  happy_var_1)
	 =  HappyAbsSyn39
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_55 _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_3  40 happyReduction_56
happyReduction_56 (HappyAbsSyn36  happy_var_3)
	_
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn40
		 (L.Abs.A happy_var_1 happy_var_3
	)
happyReduction_56 _ _ _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_0  41 happyReduction_57
happyReduction_57  =  HappyAbsSyn41
		 ([]
	)

happyReduce_58 = happySpecReduce_1  41 happyReduction_58
happyReduction_58 (HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn41
		 ((:[]) happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  41 happyReduction_59
happyReduction_59 (HappyAbsSyn41  happy_var_3)
	_
	(HappyAbsSyn40  happy_var_1)
	 =  HappyAbsSyn41
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  42 happyReduction_60
happyReduction_60 (HappyAbsSyn24  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.PVar happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_1  42 happyReduction_61
happyReduction_61 (HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.PConE happy_var_1
	)
happyReduction_61 _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_3  42 happyReduction_62
happyReduction_62 _
	(HappyAbsSyn42  happy_var_2)
	_
	 =  HappyAbsSyn42
		 (happy_var_2
	)
happyReduction_62 _ _ _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_2  43 happyReduction_63
happyReduction_63 (HappyAbsSyn44  happy_var_2)
	(HappyAbsSyn23  happy_var_1)
	 =  HappyAbsSyn42
		 (L.Abs.PCon happy_var_1 happy_var_2
	)
happyReduction_63 _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  43 happyReduction_64
happyReduction_64 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn42
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_1  44 happyReduction_65
happyReduction_65 (HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn44
		 ((:[]) happy_var_1
	)
happyReduction_65 _  = notHappyAtAll 

happyReduce_66 = happySpecReduce_2  44 happyReduction_66
happyReduction_66 (HappyAbsSyn44  happy_var_2)
	(HappyAbsSyn42  happy_var_1)
	 =  HappyAbsSyn44
		 ((:) happy_var_1 happy_var_2
	)
happyReduction_66 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 45;
	PT _ (TS _ 2) -> cont 46;
	PT _ (TS _ 3) -> cont 47;
	PT _ (TS _ 4) -> cont 48;
	PT _ (TS _ 5) -> cont 49;
	PT _ (TS _ 6) -> cont 50;
	PT _ (TS _ 7) -> cont 51;
	PT _ (TS _ 8) -> cont 52;
	PT _ (TS _ 9) -> cont 53;
	PT _ (TS _ 10) -> cont 54;
	PT _ (TS _ 11) -> cont 55;
	PT _ (TS _ 12) -> cont 56;
	PT _ (TS _ 13) -> cont 57;
	PT _ (TS _ 14) -> cont 58;
	PT _ (TS _ 15) -> cont 59;
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
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn25 z -> happyReturn z; _other -> notHappyAtAll })

pListDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn26 z -> happyReturn z; _other -> notHappyAtAll })

pDecl tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_2 tks) (\x -> case x of {HappyAbsSyn27 z -> happyReturn z; _other -> notHappyAtAll })

pThm tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_3 tks) (\x -> case x of {HappyAbsSyn28 z -> happyReturn z; _other -> notHappyAtAll })

pListConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_4 tks) (\x -> case x of {HappyAbsSyn29 z -> happyReturn z; _other -> notHappyAtAll })

pProposition tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_5 tks) (\x -> case x of {HappyAbsSyn30 z -> happyReturn z; _other -> notHappyAtAll })

pListLIdent tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_6 tks) (\x -> case x of {HappyAbsSyn31 z -> happyReturn z; _other -> notHappyAtAll })

pConstructor tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_7 tks) (\x -> case x of {HappyAbsSyn32 z -> happyReturn z; _other -> notHappyAtAll })

pListType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_8 tks) (\x -> case x of {HappyAbsSyn33 z -> happyReturn z; _other -> notHappyAtAll })

pType1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_9 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pType tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_10 tks) (\x -> case x of {HappyAbsSyn34 z -> happyReturn z; _other -> notHappyAtAll })

pExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_11 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pExpr1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_12 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pExpr tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_13 tks) (\x -> case x of {HappyAbsSyn36 z -> happyReturn z; _other -> notHappyAtAll })

pListExpr2 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_14 tks) (\x -> case x of {HappyAbsSyn39 z -> happyReturn z; _other -> notHappyAtAll })

pAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_15 tks) (\x -> case x of {HappyAbsSyn40 z -> happyReturn z; _other -> notHappyAtAll })

pListAlt tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_16 tks) (\x -> case x of {HappyAbsSyn41 z -> happyReturn z; _other -> notHappyAtAll })

pPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_17 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pPat tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_18 tks) (\x -> case x of {HappyAbsSyn42 z -> happyReturn z; _other -> notHappyAtAll })

pListPat1 tks = happySomeParser where
  happySomeParser = happyThen (happyParse action_19 tks) (\x -> case x of {HappyAbsSyn44 z -> happyReturn z; _other -> notHappyAtAll })

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
