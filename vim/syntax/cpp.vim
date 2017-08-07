" Vim syntax file
" Language: C++
" Maintainer: Tim Vasko
" Latest Revision: 06 August 2017

if exists("b:current_syntax")
	finish
endif

" Keywords
"=============================================================================
"syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2
syn keyword STL				string
syn keyword STL				dynamic_pointer_cast
syn keyword STL				static_pointer_cast

syn keyword CustomTypes		Hash  
syn keyword CustomFuncs 	make_hash
syn keyword CustomMacro 	LOG 

" Matches
"=============================================================================
"syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite

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
"syn region syntaxElementRegion start='x' end='y'

" Highlighting the keywords
"=============================================================================

hi def link STLTypes		Type
hi def link CustomTypes 	Type

hi def link Macro 			PreProc
hi def link CustomMacro 	PreProc

" Generic C++ highlight matches (functions/constructors/methods/namespaces)
hi def link STLFuncs		Function
hi def link CustomFuncs		Function
hi def link cCustomFunc 	Function
hi def link cCustomClass	Function


