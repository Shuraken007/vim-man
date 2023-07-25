scriptencoding utf-8

if exists('b:current_syntax')
  finish
endif

" Get the CTRL-H syntax to handle backspaced text
runtime! syntax/ctrlh.vim

" syn case  ignore
syn match manReference		display '[^()[:space:]]\+([0-9nx][a-z]*)'
syn match manSectionHeading	display '^\S.*$'
syn match textline '\v^\t+\s+.*'
syn match headline '\v^[^\t]\s+.*'
syn match manTitle		display '^\%1l.*$'
syn match manSubHeading		display '^ \{3\}\S.*$'
" syn match manOptionDesc	display '^\s\+\%(+\|-\)\S\+'
syn match manOption		display '\v(\(|\s|\\)(\+|-)+[a-zA-Z0-9-]+' containedin=textline
syn match manHeadOption		display '\v(\(|\s|\\)(\+|-)+[a-zA-Z0-9-]+' containedin=headline
syn match manVariable		'\(=\)\@<=\S\+'
syn match manEquals		'='
syn match manCaps		'\v(\s|\()[A-Z_]{2,}(\s|\)|$)'
syn region manVariable		start='\[' end='\]' contains=manEquals,manOption
syn region manString		start=/\s"/ end=/"/
syn region manString		start=/\s`/ end=/'/
syn region manString		start=/\s'/ end=/'/
" syn region manString		start=/</ end=/>/

syn match manParens		contained "[()]" containedin=ALL

hi default link manTitle		Title
hi default link manParens		Normal
hi default link manSectionHeading	Statement
hi default link manHeadOption		Constant
hi default link manOptionDesc		Constant
hi default link manOption		Constant
hi default link manCaps			Constant
hi default link manEquals		Constant
hi default link manString		String
hi default link manVariable		Identifier
hi default link manReference		PreProc
hi default link manSubHeading		Function

let b:current_syntax = 'man'

" vim:filetype=vim:tabstop=8:noexpandtab: