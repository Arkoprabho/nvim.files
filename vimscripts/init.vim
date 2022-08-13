set number
set termguicolors
set splitbelow splitright
set wildmode=longest,list,full
set splitbelow
set splitright
set autoread
set ignorecase
set encoding=utf-8
set signcolumn=auto:1
set clipboard=unnamedplus
set noshowmode
set relativenumber
set hidden
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set completeopt-=preview " For No Previews
set foldmethod=syntax

call plug#begin()

source $HOME/.config/nvim/plugins.vim

call plug#end()
" Disables automatic commenting on new line:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Themeing"
let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha
colorscheme catppuccin
let g:rainbow_active = 1
let g:pymode_python = 'python'
let g:lightline = {
	  \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
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
" For diff "
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

"Automatically delete all trailing whitespace on save"
autocmd BufWritePre * :%s/\s\+$//e

"Snippets for languages"
source $HOME/.config/nvim/snippets.vim

" Terraform related configs
let g:terraform_fmt_on_save = 1
let g:hcl_align = 1
let g:hcl_fold_sections = 1
let g:terraform_fold_sections = 1
" Run terragrunt hclfmt on save of terragrunt.hcl files
autocmd BufWritePost terragrunt.hcl  !terragrunt hclfmt pwd
autocmd FileType terraform,hcl nnoremap <buffer> <leader>c I#<esc>

" Neovide related settings
if exists("g:neovide")
	set guifont=JetBrains\ Mono:h15
	"let g:neovide_refresh_rate=60
	"let g:neovide_transparency=0.95
	let g:neovide_remember_window_size = v:true
	let g:neovide_cursor_animation_length=0.07
	let g:neovide_cursor_trail_length=0.8
	let g:neovide_profiler = v:false
	let g:neovide_cursor_antialiasing=v:true
	let g:neovide_input_macos_alt_is_meta=v:true
	let g:neovide_input_use_logo=v:true
	"let g:neovide_fullscreen=v:true
	"let g:neovide_floating_blur_amount_x = 9.0
	"let g:neovide_floating_blur_amount_y = 9.0
endi
