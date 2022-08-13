let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>
nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>
nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>ds <Plug>VimspectorStop
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
"""
" F5	<Plug>VimspectorContinue	When debugging, continue. Otherwise start debugging.
"Shift F5	<Plug>VimspectorStop	Stop debugging.
" Ctrl Shift F5	<Plug>VimspectorRestart	Restart debugging with the same configuration.
" F6	<Plug>VimspectorPause	Pause debuggee.
" F9	<Plug>VimspectorToggleBreakpoint	Toggle line breakpoint on the current line.
" Shift F9	<Plug>VimspectorAddFunctionBreakpoint	Add a function breakpoint for the expression under cursor
" F10	<Plug>VimspectorStepOver	Step Over
" F11	<Plug>VimspectorStepInto	Step Into
" Shift F11	<Plug>VimspectorStepOut	Step out of current function scope
"""
