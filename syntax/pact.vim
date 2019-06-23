" Vim syntax file
" Language:     pact
" Maintainer:   Shidong Wang <wsdjeg@outlook.com>
" URL:          http://github.com/wsdjeg/vim-pact.git
" Description:  Contains all of the keywords in #lang pact

" Initializing:
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" Highlight unmatched parens
" syn match pactError ,[]})],

if version < 600
  set iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
else
  setlocal iskeyword=33,35-39,42-58,60-90,94,95,97-122,126,_
endif

syn keyword pactSyntax module module* module+ require provide quote

" all built-in functions
" https://pact-language.readthedocs.io/en/latest/pact-functions.html
syn keyword pactFunc at
syn region pactString start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
if version >= 508 || !exists("did_pact_syntax_inits")
  if version < 508
    let did_pact_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pactSyntax             Statement
  HiLink pactFunc               Function

  HiLink pactString             String
  HiLink pactChar               Character
  HiLink pactBoolean            Boolean

  HiLink pactNumber             Number
  HiLink pactNumberError        Error
  HiLink pactContainedNumberError Error

  HiLink pactQuoted             Structure
  HiLink pactQuotedStruc        Structure
  HiLink pactSymbol             Structure

  HiLink pactDelimiter          Delimiter
  HiLink pactConstant           Constant

  HiLink pactComment            Comment
  HiLink pactMultilineComment   Comment
  HiLink pactTodo               Todo
  HiLink pactNote               SpecialComment
  HiLink pactError              Error

  HiLink pactExtSyntax          Type
  HiLink pactExtFunc            PreProc
  delcommand HiLink
endif

let b:current_syntax = "pact"

