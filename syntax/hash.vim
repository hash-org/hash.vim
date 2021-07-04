" Operators
syn match hashOperator display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"

" Keywords
syn keyword hashKeyword let if else match for while loop struct enum where return break continue trait

" Import
syn keyword hashImport import

" Boolean literals
syn keyword hashBoolean true false

" Types
syn keyword hashType int float str bool never void char
syn match hashType display "\<[A-Z][A-Za-z0-9_]*\>"

" Function call
syn match hashIntrinsicCall "#[A-Za-z0-9_]\+("he=e-1,me=e-1
syn match hashFnCall "[A-Za-z0-9_]\+("he=e-1,me=e-1
syn match hashTypeCall "[A-Z][A-Za-z0-9_]*("he=e-1,me=e-1

" Number literals
syn match hashDecNumber display "\<[0-9][0-9_]*"
syn match hashHexNumber display "\<0x[a-fA-F0-9_]\+"
syn match hashOctNumber display "\<0o[0-7_]\+"
syn match hashBinNumber display "\<0b[01_]\+"
syn match hashFloat display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)"

" Strings and characters
syn match hashEscapeError display contained /\\./
syn match hashEscape display contained /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match hashEscapeUnicode display contained /\\u{\%(\x_*\)\{1,6}}/
syn region hashString start=/"/ skip=/\\"/ end=/"/ oneline contains=hashEscape,hashEscapeUnicode,hashEscapeError
syn match hashCharacterInvalid display contained /b\?'\zs[\n\r\t']\ze'/
syn match hashCharacterInvalidUnicode display contained /b'\zs[^[:cntrl:][:graph:][:alnum:][:space:]]\ze'/
syn match hashCharacter /b'\([^\\]\|\\\(.\|x\x\{2}\)\)'/ contains=hashEscape,hashEscapeError,hashCharacterInvalid,hashCharacterInvalidUnicode
syn match hashCharacter /'\([^\\]\|\\\(.\|x\x\{2}\|u{\%(\x_*\)\{1,6}}\)\)'/ contains=hashEscape,hashEscapeUnicode,hashEscapeError,hashCharacterInvalid

" Comments
syn region hashCommentLine start="//" end="$"
syn region hashCommentBlock matchgroup=hashCommentBlock start="/\*" end="\*/" contains=hashCommentBlockNest
syn region hashCommentBlockNest matchgroup=hashCommentBlock start="/\*" end="\*/" contains=hashCommentBlockNest contained transparent

hi def link hashDecNumber Number
hi def link hashHexNumber Number
hi def link hashOctNumber Number
hi def link hashBinNumber Number
hi def link hashFloat Number
hi def link hashBoolean Boolean
hi def link hashKeyword Keyword
hi def link hashString String
hi def link hashCharacter Character
hi def link hashEscape Special
hi def link hashEscapeUnicode hashEscape
hi def link hashEscapeError Error
hi def link hashCommentLine Comment
hi def link hashCommentBlock Comment
hi def link hashCommentBlockNest Comment
hi def link hashOperator Operator
hi def link hashType Type
hi def link hashImport Macro
hi def link hashIntrinsicCall Macro
hi def link hashTypeCall Constant
hi def link hashFnCall Function
