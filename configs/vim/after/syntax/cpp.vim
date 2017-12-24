" Vim syntax file
" Language: C++
" Maintainer: Tim Vasko
" Latest Revision: 06 August 2017

"if exists("b:current_syntax")
	"finish
"endif

" Keywords
"=============================================================================
syn keyword CustomTypes		string
syn keyword MissingKeyword	sizeof static_assert

" Matches
"=============================================================================

"" Match C++ namespaces and parameterized functions
"syn match   cCustomParen    "(" contains=cParen,cCppParen
"syn match	cCustomParam	"<" 
"syn match   cCustomFunc     "\w\+\s*(" contains=cCustomParen
"syn match	cCustomFunc		"\w\+\s*<" contains=cCustomParam
"syn match   cCustomScope    "::"
"syn match   cCustomClass    "\w\+\s*::" contains=cCustomScope

" Regions
"=============================================================================


" Highlighting the keywords
"=============================================================================
hi def link CustomTypes 	Type
hi def link MissingKeyword	Keyword

"" Generic C++ highlight matches (functions/constructors/methods/namespaces)
"hi def link cCustomFunc 	Function
"hi def link cCustomClass	Function
"hi def link cCustomScope	Function

