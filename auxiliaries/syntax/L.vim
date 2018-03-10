if exists("b:current_syntax")
    finish
endif

syn match hsVarSym "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=[-!#$%&\*\+/<=>\?@\\^|~.][-!#$%&\*\+/<=>\?@\\^|~:.]*"
syn match hsConSym "\(\<[A-Z][a-zA-Z0-9_']*\.\)\=:[-!#$%&\*\+./<=>\?@\\^|~:]*"

" Strings and constants
syn region  hsString		start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=hsSpecialChar
syn match   hsCharacter		"[^a-zA-Z0-9_']'\([^\\]\|\\[^']\+\|\\'\)'"lc=1 contains=hsSpecialChar,hsSpecialCharError
syn match   hsCharacter		"^'\([^\\]\|\\[^']\+\|\\'\)'" contains=hsSpecialChar,hsSpecialCharError
syn match   hsNumber		"\v<[0-9]%(_*[0-9])*>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*>|<0[oO]_*%(_*[0-7])*>|<0[bB]_*[01]%(_*[01])*>"
syn match   hsFloat		"\v<[0-9]%(_*[0-9])*\.[0-9]%(_*[0-9])*%(_*[eE][-+]?[0-9]%(_*[0-9])*)?>|<[0-9]%(_*[0-9])*_*[eE][-+]?[0-9]%(_*[0-9])*>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*\.[0-9a-fA-F]%(_*[0-9a-fA-F])*%(_*[pP][-+]?[0-9]%(_*[0-9])*)?>|<0[xX]_*[0-9a-fA-F]%(_*[0-9a-fA-F])*_*[pP][-+]?[0-9]%(_*[0-9])*>"

" Keyword definitions. These must be patterns instead of keywords
" because otherwise they would match as keywords at the start of a
" "literate" comment (see lhs.vim).
syn match hsStructure		"\<\(data\|theorem\|lemma\|using\)\>"
syn match hsStatement		"\<\(case\|of\|forall\)\>"

" Comments
syn match   hsLineComment      "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$"
syn region  hsBlockComment     start="{-"  end="-}" contains=hsBlockComment

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link hsStructure			  Structure
hi def link hsStatement			  Statement
hi def link hsConditional			  Conditional
hi def link hsVarSym			  hsOperator
hi def link hsConSym			  hsOperator
hi def link hsString			  String
hi def link hsCharacter			  Character
hi def link hsNumber			  Number
hi def link hsFloat			  Float
hi def link hsConditional			  Conditional
hi def link hsLiterateComment		  hsComment
hi def link hsBlockComment		  hsComment
hi def link hsLineComment			  hsComment
hi def link hsComment			  Comment

syntax match op "\v-\>"
syntax match op "\v\="
syntax match op "\v\:"
syntax match op "\v\|"

highlight link op Operator

let b:current_syntax = "L"
