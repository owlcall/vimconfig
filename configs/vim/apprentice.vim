" 'apprentice.vim' -- Vim color scheme.
" Author:       Romain Lafourcade (romainlafourcade@gmail.com)
" Description:  Essentially a streamlining and conversion to xterm colors of
"               'sorcerer' by Jeet Sukumaran (jeetsukumaran@gmailcom)
" Last Change:  2017 Aug 06

" MADE-UP NAME    HEX        RGB                   XTERM  ANSI
" ========================================================================
" almost black    #1c1c1c    rgb(28, 28, 28)       234    0
" darker grey     #262626    rgb(38, 38, 38)       235    background color
" dark grey       #303030    rgb(48, 48, 48)       236    8
" grey            #444444    rgb(68, 68, 68)       238    8
" medium grey     #585858    rgb(88, 88, 88)       240    8
" light grey      #6c6c6c    rgb(108, 108, 108)    242    7
" lighter grey    #bcbcbc    rgb(188, 188, 188)    250    foreground color
" white           #ffffff    rgb(255, 255, 255)    231    15
" purple          #5f5f87    rgb(95, 95, 135)      60     5
" light purple    #8787af    rgb(135, 135, 175)    103    13
" green           #5f875f    rgb(95, 135, 95)      65     2
" light green     #87af87    rgb(135, 175, 135)    108    10
" aqua            #5f8787    rgb(95, 135, 135)     66     6
" light aqua      #5fafaf    rgb(95, 175, 175)     73     14
" blue            #5f87af    rgb(95, 135, 175)     67     4
" light blue      #8fafd7    rgb(143, 175, 215)    110    12
" red             #af5f5f    rgb(175, 95, 95)      131    1
" orange          #ff8700    rgb(255, 135, 0)      208    9
" ocre            #87875f    rgb(135, 135, 95)     101    3
" yellow          #ffffaf    rgb(255, 255, 175)    229    11

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "apprentice"
let s:BG       = 'none'
let s:disable_italic = 0

if (has('gui_running'))  "Graphical Vim
  "Set color palette with RGB colors
  let s:RED    = '#EA4335'
  let s:GREEN  = '#34A853'
  let s:YELLOW = '#FBBC05'
  let s:BLUE   = '#4285F4'
  let s:BLACK  = '#000000'
  let s:DGREY  = '#656565'
  let s:LGREY  = '#EEEEEE'
  let s:WHITE  = '#FFFFFF'

  "Set gui mode and italics
  let s:M = 'gui'
  let s:I = s:disable_italic ? 'none' : 'italic'
  let s:B = 'bold'
  let s:R = 'reverse'
  let s:N = 'none'
  let s:U = 'underline'

else                     "Console Vim
  if &t_Co == 256
    "Set color palette with 256 colors
    "let s:RED    = '167'
    "let s:YELLOW = '220'
    "let s:BLACK  = '16'
	let s:LBROWN = '143'	" Done
	let s:MBROWN = '101'	" Done
	let s:LGREEN = '108'	" Done
    let s:GREEN  = '28'		" Done
    let s:BLUE   = '67'		" Done
	let s:LYELLOW= '229'	" Done
	let s:TEAL   = '66'		" Done
	let s:LTEAL  = '73'		" Done
	let s:DTEAL  = '110'	" Done
	let s:LORANGE= '208'	" Done
	let s:MORANGE= '173'	" Done
	let s:ORANGE = '167'	" Done
	let s:LPURPLE= '103'	" Done
	let s:PINK   = '163'	" Done
	let s:DPINK  = '131'	" Done
    let s:DGREY  = '234'	" Done
	let s:MGREY  = '235'	" Done
	let s:MLGREY = '236'	" Done
    let s:LGREY  = '238'	" Done
    let s:VLGREY = '240'	" Done
    let s:ULGREY = '242'	" Done
    let s:DWHITE = '250'	" Done
	let s:WHITE  = '231'	" Done
  else
    "Set color palette with color names
    let s:RED    = 'red'
    let s:GREEN  = 'green'
    let s:YELLOW = 'yellow'
    let s:BLUE   = 'blue'
    let s:BLACK  = 'black'
    let s:DGREY  = 'grey'
    let s:LGREY  = 'grey'
    let s:WHITE  = 'white'
  endif

  "Set terminal mode and italics (if supported)
  let s:M = 'cterm'
  let s:I = 'none'
  let s:B = 'bold'
  let s:R = 'reverse'
  let s:N = 'none'
  let s:U = 'underline'
  if !s:disable_italic
    let s:terms = ['rxvt', 'gnome-terminal']
    for s:term in s:terms
      if $TERM_PROGRAM =~ s:term
        let s:I = 'italic'
      endif
    endfor
  endif
endif

exe 'hi Normal         '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:DWHITE  .' '.s:M.'='.s:N
exe 'hi LineNr         '.s:M.'bg='.s:DGREY  .' '.s:M.'fg='.s:ULGREY  .' '.s:M.'='.s:N
exe 'hi FoldColumn     '.s:M.'bg='.s:DGREY  .' '.s:M.'fg='.s:ULGREY  .' '.s:M.'='.s:N
exe 'hi Folded         '.s:M.'bg='.s:DGREY  .' '.s:M.'fg='.s:ULGREY  .' '.s:M.'='.s:N
exe 'hi MatchParen     '.s:M.'bg='.s:DGREY  .' '.s:M.'fg='.s:LYELLOW .' '.s:M.'='.s:N
exe 'hi signColumn     '.s:M.'bg='.s:DGREY  .' '.s:M.'fg='.s:ULGREY  .' '.s:M.'='.s:N

set background=dark

exe 'hi Comment          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:GREEN   .' '.s:M.'='.s:N
exe 'hi Conceal          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:DWHITE  .' '.s:M.'='.s:N
exe 'hi Constant         '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:ORANGE  .' '.s:M.'='.s:N
exe 'hi Error            '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:DPINK  .' '.s:M.'='.s:R
exe 'hi Identifier       '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BLUE   .' '.s:M.'='.s:N
exe 'hi Ignore           '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N
exe 'hi PreProc          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:MORANGE  .' '.s:M.'='.s:N
exe 'hi Special          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:LBROWN   .' '.s:M.'='.s:N
exe 'hi Statement        '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:PINK  .' '.s:M.'='.s:N
exe 'hi String           '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:ORANGE  .' '.s:M.'='.s:N
exe 'hi Todo             '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:R
exe 'hi Type             '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:PINK  .' '.s:M.'='.s:N
exe 'hi Underlined       '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:TEAL   .' '.s:M.'='.s:U

exe 'hi NonText          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:VLGREY  .' '.s:M.'='.s:N

exe 'hi Pmenu            '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:DWHITE  .' '.s:M.'='.s:N
exe 'hi PmenuSbar        '.s:M.'bg='.s:VLGREY  .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N
exe 'hi PmenuSel         '.s:M.'bg='.s:TEAL   .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N
exe 'hi PmenuThumb       '.s:M.'bg='.s:TEAL   .' '.s:M.'fg='.s:TEAL   .' '.s:M.'='.s:N

exe 'hi ErrorMsg         '.s:M.'bg='.s:DPINK  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N
exe 'hi ModeMsg          '.s:M.'bg='.s:LGREEN  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N
exe 'hi MoreMsg          '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:TEAL   .' '.s:M.'='.s:N
exe 'hi Question         '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:LGREEN  .' '.s:M.'='.s:N
exe 'hi WarningMsg       '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:DPINK  .' '.s:M.'='.s:N

exe 'hi TabLine          '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:MBROWN  .' '.s:M.'='.s:N
exe 'hi TabLineFill      '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:LGREY  .' '.s:M.'='.s:N
exe 'hi TabLineSel       '.s:M.'bg='.s:MBROWN  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N

exe 'hi Cursor           '.s:M.'bg='.s:ULGREY  .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N
exe 'hi CursorColumn     '.s:M.'bg='.s:MLGREY  .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N
exe 'hi CursorLineNr     '.s:M.'bg='.s:MLGREY  .' '.s:M.'fg='.s:LTEAL   .' '.s:M.'='.s:N
exe 'hi CursorLine       '.s:M.'bg='.s:MLGREY  .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N

exe 'hi helpLeadBlank    '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N
exe 'hi helpNormal       '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N

exe 'hi StatusLine       '.s:M.'bg='.s:MBROWN  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N
exe 'hi StatusLineNC     '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:MBROWN  .' '.s:M.'='.s:N

exe 'hi Visual           '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:DTEAL  .' '.s:M.'='.s:R
exe 'hi VisualNOS        '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:U

exe 'hi VertSplit        '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:LGREY  .' '.s:M.'='.s:N
exe 'hi WildMenu         '.s:M.'bg='.s:DTEAL  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N

exe 'hi Function         '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:DTEAL  .' '.s:M.'='.s:N
exe 'hi SpecialKey       '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:VLGREY  .' '.s:M.'='.s:N
exe 'hi Title            '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:WHITE  .' '.s:M.'='.s:N

exe 'hi DiffAdd          '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:LGREEN  .' '.s:M.'='.s:R
exe 'hi DiffChange       '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:LPURPLE  .' '.s:M.'='.s:R
exe 'hi DiffDelete       '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:DPINK  .' '.s:M.'='.s:R
exe 'hi DiffText         '.s:M.'bg='.s:MGREY  .' '.s:M.'fg='.s:LORANGE  .' '.s:M.'='.s:R

exe 'hi IncSearch        '.s:M.'bg='.s:DPINK  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N
exe 'hi Search           '.s:M.'bg='.s:LYELLOW  .' '.s:M.'fg='.s:MGREY  .' '.s:M.'='.s:N

exe 'hi Directory        '.s:M.'bg='.s:BG .' '.s:M.'fg='.s:LTEAL   .' '.s:M.'='.s:N

exe 'hi ColorColumn      '.s:M.'bg='.s:LGREY  .' '.s:M.'fg='.s:BG .' '.s:M.'='.s:N

"if has("gui_running")
"hi SpellBad         ctermbg=NONE ctermfg=131  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#af5f5f
"hi SpellCap         ctermbg=NONE ctermfg=73   guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#5fafaf
"hi SpellLocal       ctermbg=NONE ctermfg=65   guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#5f875f
"hi SpellRare        ctermbg=NONE ctermfg=208  guibg=NONE    guifg=NONE    cterm=undercurl      gui=undercurl guisp=#ff8700
"else
"hi SpellBad         ctermbg=NONE ctermfg=131  guibg=NONE    guifg=#af5f5f cterm=undercurl      gui=undercurl guisp=NONE
"hi SpellCap         ctermbg=NONE ctermfg=73   guibg=NONE    guifg=#5fafaf cterm=undercurl      gui=undercurl guisp=NONE
"hi SpellLocal       ctermbg=NONE ctermfg=65   guibg=NONE    guifg=#5f875f cterm=undercurl      gui=undercurl guisp=NONE
"hi SpellRare        ctermbg=NONE ctermfg=208  guibg=NONE    guifg=#ff8700 cterm=undercurl      gui=undercurl guisp=NONE
"endif


hi link Boolean                  Constant
hi link Character                Constant
hi link Conditional              Statement
hi link Debug                    Special
hi link Define                   PreProc
hi link Delimiter                Special
hi link Exception                Statement
hi link Float                    Number
hi link HelpCommand              Statement
hi link HelpExample              Statement
hi link Include                  PreProc
hi link Keyword                  Statement
hi link Label                    Statement
hi link Macro                    PreProc
hi link Number                   Constant
hi link Operator                 Statement
hi link PreCondit                PreProc
hi link Repeat                   Statement
hi link SpecialChar              Special
hi link SpecialComment           Special
hi link StorageClass             Type
hi link Structure                Type
hi link Tag                      Special
hi link Typedef                  Function

hi link htmlEndTag               htmlTagName
hi link htmlLink                 Function
hi link htmlSpecialTagName       htmlTagName
hi link htmlTag                  htmlTagName
hi link htmlBold                 Normal
hi link htmlItalic               Normal
hi link xmlTag                   Statement
hi link xmlTagName               Statement
hi link xmlEndTag                Statement

hi link markdownItalic           Preproc
hi link asciidocQuotedEmphasized Preproc

hi link diffBDiffer              WarningMsg
hi link diffCommon               WarningMsg
hi link diffDiffer               WarningMsg
hi link diffIdentical            WarningMsg
hi link diffIsA                  WarningMsg
hi link diffNoEOL                WarningMsg
hi link diffOnly                 WarningMsg
hi link diffRemoved              WarningMsg
hi link diffAdded                String
