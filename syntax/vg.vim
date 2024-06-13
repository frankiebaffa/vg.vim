" Vim syntax file
" Language: Very-Good Templating
" Maintainer: Frankie Baffa

let this_ext = expand('%:e')
if this_ext != 'vg'
	let ext_syn = substitute(this_ext, 'vg-', '', '')
	execute 'runtime! syntax/' . ext_syn . '.vim'

	if exists('b:current_syntax')
		unlet b:current_syntax
	endif
endif

if exists('b:current_syntax')
	finish
endif

let b:current_syntax = "vg"

syn match vgPath '".\+"' contained
hi def link vgPath String

syn match vgIllegalQuote '"' contained
hi def link vgIllegalQuote SpellBad

syn match vgLoopContext /\$loop/
			\ contained
hi def link vgLoopContext Statement

syn match vgContentContext /\$content/
			\ contained
hi def link vgContentContext Statement

syn match vgAlias '[a-zA-Z0-9_\-\.$]\+\({\)\@!'
			\ contained
			\ contains=vgLoopContext,vgContentContext
hi def link vgAlias Type

syn keyword vgInKeyword in
			\ contained
hi def link vgInKeyword Statement

syn keyword vgExistsKeyword exists
			\ contained
hi def link vgExistsKeyword Statement

syn keyword vgEmptyKeyword empty
			\ contained
hi def link vgEmptyKeyword Statement

syn match vgNotCondition '!'
			\ contained
hi def link vgNotCondition Character

syn match vgNullableOperator '?'
			\ contained
hi def link vgNullableOperator Character

syn match vgExtensionMod /|\s*ext\s*/ms=s+1
			\ contained
			\ nextgroup=vgPath
hi def link vgExtensionMod Conditional

syn match vgReverseMod /|\s*reverse\s*/ms=s+1
			\ contained
hi def link vgReverseMod Conditional

syn match vgPathsMod /|\s*paths\s*/ms=s+1
			\ contained
hi def link vgPathsMod Conditional

syn match vgMdMod /|\s*md\s*/ms=s+1
			\ contained
hi def link vgMdMod Conditional

syn match vgRawMod /|\s*raw\s*/ms=s+1
			\ contained
hi def link vgRawMod Conditional

syn match vgSealedMod /|\s*sealed\s*/ms=s+1
			\ contained
hi def link vgSealedMod Conditional

syn match vgAsMod /|\s*as\s*/ms=s+1
			\ contained
hi def link vgAsMod Conditional

syn match vgReplaceMod /\s*replace\s*/ms=s+1
			\ nextgroup=vgPath
			\ contained
hi def link vgReplaceMod Conditional

syn match vgUpperMod /\s*upper\s*/ms=s+1
			\ contained
hi def link vgUpperMod Conditional

syn match vgLowerMod /\s*lower\s*/ms=s+1
			\ contained
hi def link vgLowerMod Conditional

syn region vgChain start=/-/ end=/{/me=s-1
			\ contained
			\ nextgroup=vgBlock
hi def link vgChain Macro

syn match vgComment '[^}]*' contained
hi def link vgComment Comment

syn match vgReason '[^}]*' contained
hi def link vgReason Constant

syn region vgIgnoreTag start='\(\\\)\@<!\!{' end='\(\\\)\@<!}'
			\ contains=vgReason
hi def link vgIgnoreTag Constant

syn region vgExtendTag start='\(\\\)\@<!+{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias
hi def link vgExtendTag Macro

syn region vgCommentTag start='\(\\\)\@<!#{' end='\(\\\)\@<!}'
			\ contains=vgComment
hi def link vgCommentTag Comment

syn region vgIncludeFileTag start='\(\\\)\@<!&{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias,vgSealedMod,vgMdMod,vgRawMod
hi def link vgIncludeFileTag Macro

syn region vgIncludeItemTag start='\(\\\)\@<!\${' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalQuote,vgUpperMod,vgReplaceMod,vgLowerMod
hi def link vgIncludeItemTag Macro

syn region vgSourceTag start='\(\\\)\@<!\.{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias,vgAsMod
hi def link vgSourceTag Macro

syn region vgBlock start='\(\\\)\@<!{' end='\(\\\)\@<!}'
			\ contains=vgIgnoreTag,vgCommentTag,vgSourceTag,vgIfTag,vgForFileTag,vgForItemTag,vgIncludeItemTag,vgIncludeFileTag
			\ nextgroup=vgChain,vgBlock
			\ contained
			\ fold

syn region vgIfTag start='\(\\\)\@<!%{' end='\(\\\)\@<!}'
			\ contains=vgNotCondition,vgExistsKeyword,vgEmptyKeyword,vgAlias,vgIllegalQuote,vgNullableOperator
			\ nextgroup=vgBlock,vgChain
hi def link vgIfTag Macro

syn region vgForItemTag start='\(\\\)\@<!@{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgInKeyword,vgPathsMod,vgReverseMod,vgIllegalQuote
			\ nextgroup=vgBlock,vgChain
hi def link vgForItemTag Macro

syn region vgForFileTag start='\(\\\)\@<!\*{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgInKeyword,vgPath,vgReverseMod
			\ nextgroup=vgBlock,vgChain
hi def link vgForFileTag Macro
