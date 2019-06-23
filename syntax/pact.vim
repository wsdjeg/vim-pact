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

" Special forms
syn keyword pactSyntax bless defun defcap defconst defpact defschema
syn keyword pactSyntax deftable let let* step step-with-rollback use module

" all built-in functions
" https://pact-language.readthedocs.io/en/latest/pact-functions.html
" general
syn keyword pactFunc at bind chain-data compose constantly contains
syn keyword pactFunc define-namespace drop
syn keyword pactFunc enforce enforce-one enforce-pact-version filter fold format hash
syn keyword pactFunc identity if length list list-modules make-list map namespace pact-id
syn keyword pactFunc pact-version read-decimal read-integer read-msg remove resume reverse
syn keyword pactFunc sort str-to-int take tx-hash typeof where yield


" Database
syn keyword pactFunc creat-table describe-keyset describe-module describe-table
syn keyword pactFunc insert keylog keys read select txids txlog update
syn keyword pactFunc with-default-read with-read write
" time
syn keyword pactFunc add-time days diff-time format-time hours minutes parse-time time
" Operators
syn keyword pactFunc != * + - / < <= = > >= ^
syn keyword pactFunc abs and and? ceiling exp floor in log mod not not? or or? round sqrt


" Keysets
syn keyword pactFunc define-keyset enforce-keyset keys-2 keys-all keys-any read-keyset

" comments
syn match pactComment /;.*$/ contains=pactTodo,@Spell
" syn region pactMultilineComment start=/#|/ end=/|#/ contains=pactMultilineComment,pactTodo,pactNote,@Spell
syn keyword pactTodo FIXME TODO contained

" Literals
syn region pactString start=/\%(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
syn keyword pactBoolean  true false
syn match pactSymbol /'\S*/

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

