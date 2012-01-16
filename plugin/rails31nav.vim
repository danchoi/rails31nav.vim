" Vim script that add ability to search and play iTunes tracks from Vim
" Maintainer:	Daniel Choi 
" http://github.com/danchoi/rails31_nav.vim
" License: MIT License (c) 2012 Daniel Choi 

" See http://github.com/danchoi/rails31_nav.vim for README

if exists("g:Rails31Nav") || &cp || version < 700
  finish
endif
let g:Rails31Nav = 1

let s:selection_list = []

func! s:trimString(string)
  let string = substitute(a:string, '\s\+$', '', '')
  return substitute(string, '^\s\+', '', '')
endfunc

func! s:prepare_autocomplete()
  let s:current_file = bufname('')
  leftabove split Rails31nav
  setlocal textwidth=0
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal modifiable
  setlocal nowrap
  noremap <buffer> <Esc> :close<cr>
  inoremap <buffer> <Tab> <C-x><C-u>
  " autocmd CursorMovedI <buffer> call feedkeys("a\<c-x>\<c-u>\<c-p>", 't')
endfunc

function! Rails31Nav_show_drop_down()
  " set basename of current file
  let s:match_basename = s:basename()
  call s:prepare_autocomplete()
  resize 1
  inoremap <buffer> <cr> <Esc>:call <SID>open_file()<cr>
  noremap <buffer> <cr> <Esc>:call <SID>open_file()<cr>
  let s:selection_list = Rails31Nav_related_files_list()
  setlocal omnifunc=Rails31Nav_show_related_completefunc
  call setline(1, "")
  normal G$
  call feedkeys("a\<c-x>\<c-o>\<c-p>", 't')
endfunction

function! Rails31Nav_show_related_completefunc(findstart, base)
  if a:findstart
    let start = 0
    return start
  else
    let res = [] 
    let i = 1
    for m in s:selection_list
      let abbr = split(m, '/')[-1]
      if m =~ a:base
        call add(res, {'word': m, 'icase': 1, 'abbr': abbr, 'menu': i . ''})
        let i = i+1
      endif
    endfor
    return res
  endif
endfun

func! Rails31Nav_related_files_list()
  let command = "find app test -type f | grep '".s:match_basename."' | grep -v '\/\\.'"
  let res = system(command)
  return split(res, "\n")
endfunc

func! s:basename()
  let this_file_or_dir = ''
  if bufname("%") =~ '/views/'
    let this_file_or_dir = split(expand('%:h'), '/')[-1]
  else 
    let this_file_or_dir = expand('%:t')
  endif
  let basename_possibly_pluralized = split(this_file_or_dir, '[_.]')[0]
  let basename = substitute(basename_possibly_pluralized, "s$", '', '')
  return basename
endfunc

func! s:open_file()
  if (getline(1) =~ '^\s*$') " no selection
    close
    return
  endif
  let selection = s:trimString(getline(1))
  if selection =~ '^\d' " choose by menu number
    let selection = s:selection_list[selection - 1]
  endif
  close
  if filereadable(selection)
    exec 'edit '.selection
    normal gg
  else
    echo "File ".selection." not found"
  endif
endfunc

nnoremap <Leader><Leader> :call Rails31Nav_show_drop_down()<cr>


