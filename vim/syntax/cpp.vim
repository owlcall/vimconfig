" Vim syntax file
" Language: C++
" Maintainer: Tim Vasko
" Latest Revision: 06 August 2017

if exists("b:current_syntax")
	finish
endif

" Keywords
"=============================================================================
syn keyword CustomTypes		string

" Matches
"=============================================================================

" Match C++ namespaces and parameterized functions
syn match   cCustomParen    "(" contains=cParen,cCppParen
syn match	cCustomParam	"<" 
syn match   cCustomFunc     "\w\+\s*(" contains=cCustomParen
syn match	cCustomFunc		"\w\+\s*<" contains=cCustomParam
syn match   cCustomScope    "::"
syn match   cCustomClass    "\w\+\s*::" contains=cCustomScope

syn match	Macro			"\v<[A-Z0-9_]+>"	" All uppercase words

" Regions
"=============================================================================

" Highlighting the keywords
"=============================================================================

hi def link STLTypes		Type
hi def link CustomTypes 	Function

hi def link Macro 			PreProc
hi def link CustomMacro 	PreProc

" Generic C++ highlight matches (functions/constructors/methods/namespaces)
hi def link STLFuncs		Function
hi def link CustomFuncs		Function
hi def link cCustomFunc 	Function
hi def link cCustomClass	Function


