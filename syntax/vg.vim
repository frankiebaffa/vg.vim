" Vim syntax file
" Language: Very-Good Templating
" Maintainer: Frankie Baffa

if exists('b:current_syntax')
	finish
endif

let b:current_syntax = "vg"

syn match vgPath '".\{-}"' contained
hi def link vgPath String

syn match vgIllegalPath '".\{-}"' contained
hi def link vgIllegalPath SpellBad

syn match vgUnmatchedEndblock '\(\\\)\@<!}'
hi def link vgUnmatchedEndblock SpellBad

syn match vgLoopContext /\$loop/
			\ contained
hi def link vgLoopContext Statement

syn match vgContentContext /\$content/
			\ contained
hi def link vgContentContext Statement

syn match vgAlias '[a-zA-Z0-9_\-\.$]\+\({\)\@!'
			\ contained
			\ contains=vgLoopContext,vgContentContext,vgIllegalRootAlias
hi def link vgAlias Type

syn match vgIllegalRootAlias /\$root/ contained
hi def link vgIllegalRootAlias SpellBad

syn match vgRootAlias /\$root/
			\ contained
hi def link vgRootAlias Statement

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

syn match vgTrimMod /|\s*trim\s*/ms=s+1
			\ contained
hi def link vgTrimMod Conditional

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

syn match vgReplaceMod /|\s*replace\s*/ms=s+1
			\ nextgroup=vgReplaceString
			\ contained
hi def link vgReplaceMod Conditional

syn match vgReplaceString /\s*".\{-}"\s*/
			\ nextgroup=vgReplaceString
			\ contained
hi def link vgReplaceString String

syn match vgUpperMod /|\s*upper\s*/ms=s+1
			\ contained
hi def link vgUpperMod Conditional

syn match vgSplitMod /|\s*split\s*/ms=s+1
			\ contained
			\ nextgroup=vgSplitNum
hi def link vgSplitMod Conditional

syn match vgSplitNum /\s*[0-9]\+\s*/
			\ contained
			\ nextgroup=vgSplitNum
hi def link vgSplitNum Constant

syn match vgLowerMod /|\s*lower\s*/ms=s+1
			\ contained
hi def link vgLowerMod Conditional

syn match vgPathMod /|\s*path\s*/ms=s+1
			\ contained
hi def link vgPathMod Conditional

syn match vgArrayMod /|\s*array\s*/ms=s+1
			\ contained
hi def link vgArrayMod Conditional

syn match vgPopMod /|\s*pop\s*/ms=s+1
			\ contained
hi def link vgPopMod Conditional

syn match vgChain /-/
			\ contained
			\ nextgroup=vgBlock
hi def link vgChain Macro

syn region vgIgnoreTag start='\(\\\)\@<!\!{' end='\(\\\)\@<!}\!'
hi def link vgIgnoreTag Constant

syn region vgSiphonTag start='\(\\\)\@<!<{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalRootAlias,vgIllegalPath
			\ contained
hi def link vgSiphonTag Macro

syn region vgExtendTag start='\(\\\)\@<!+{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias,vgIllegalRootAlias
hi def link vgExtendTag Macro

syn region vgCommentTag start='\(\\\)\@<!#{' end='\(\\\)\@<!}#'
hi def link vgCommentTag Comment

syn region vgIncludeFileTag start='\(\\\)\@<!&{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias,vgIllegalRootAlias,vgSealedMod,vgMdMod,vgRawMod
			\ nextgroup=vgBlock,vgChain
hi def link vgIncludeFileTag Macro

syn region vgIncludeContentTag start='\(\\\)\@<!\${' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalRootAlias,vgUpperMod,vgReplaceMod,vgReplaceString,vgLowerMod,
			\vgPathMod,vgTrimMod,vgNullableOperator,vgSplitMod,vgSplitNum
hi def link vgIncludeContentTag Macro

syn region vgSourceTag start='\(\\\)\@<!\.{' end='\(\\\)\@<!}'
			\ contains=vgPath,vgAlias,vgIllegalRootAlias,vgAsMod
hi def link vgSourceTag Macro

syn region vgBlock start='\(\\\)\@<!{' end='\(\\\)\@<!}'
			\ contains=vgIgnoreTag,vgCommentTag,vgSourceTag,vgIfTag,
				\vgForFileTag,vgForItemTag,vgIncludeContentTag,vgIncludeFileTag,
				\vgSetItemTag,vgUnsetItemTag
			\ nextgroup=vgChain,vgBlock
			\ contained
			\ fold
hi def link vgBlock Text

syn region vgIfTag start='\(\\\)\@<!%{' end='\(\\\)\@<!}'
			\ contains=vgNotCondition,vgExistsKeyword,vgEmptyKeyword,vgAlias,vgIllegalRootAlias,vgIllegalPath
			\ nextgroup=vgBlock,vgChain
hi def link vgIfTag Macro

syn region vgForItemTag start='\(\\\)\@<!@{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalRootAlias,vgInKeyword,vgPathsMod,vgReverseMod,vgNullableOperator,vgIllegalPath
			\ nextgroup=vgBlock,vgChain
hi def link vgForItemTag Macro

syn region vgForFileTag start='\(\\\)\@<!\*{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalRootAlias,vgInKeyword,vgPath,vgReverseMod,vgExtensionMod
			\ nextgroup=vgBlock,vgChain
hi def link vgForFileTag Macro

syn region vgSetItemTag start='\(\\\)\@<!={' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgRootAlias,vgPathMod,vgArrayMod,vgIllegalPath
			\ nextgroup=vgBlock,vgChain,vgSiphonTag
hi def link vgSetItemTag Macro

syn region vgUnsetItemTag start='\(\\\)\@<!/{' end='\(\\\)\@<!}'
			\ contains=vgAlias,vgIllegalRootAlias,vgPopMod,vgIllegalPath
hi def link vgUnsetItemTag Macro
