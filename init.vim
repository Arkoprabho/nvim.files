:set number
:set autoread
:set encoding=utf-8
:set signcolumn=auto:1
:set clipboard=unnamedplus
:set noshowmode
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set completeopt-=preview " For No Previews

call plug#begin()

source $HOME/.config/nvim/plugins.vim

call plug#end()

colorscheme nightfox
let g:rainbow_active = 1
let g:pymode_python = 'python'
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
	  \	  'filename': 'LightlineFilename'
      \ },
      \ }
let g:terraform_fmt_on_save = 1
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \    'vimspectorBPCond':     2,
  \    'vimspectorBPLog':      2,
  \    'vimspectorBPDisabled': 1,
  \    'vimspectorPC':         999,
  \ }
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" COC Configuration
source $HOME/.config/nvim/coc-config.vim

" Vimspector Configuration
source $HOME/.config/nvim/vimspector.vim

" Navigation Configuration
source $HOME/.config/nvim/navigation.vim

" NERDTree Configuration
source $HOME/.config/nvim/nerdtree.vim

" Some extra helper mappings
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

map <F2> :mksession! .vim_session <cr> " Quick write session with F2
map <F3> :source .vim_session <cr>     " And load session with F3

