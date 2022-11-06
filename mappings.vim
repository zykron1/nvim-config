"tabs made easy
nnoremap <TAB> :BufferNext<CR>
nnoremap <S-TAB> :BufferPrevious<CR>
nnoremap <C-x> :BufferClose<CR>

"coc
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

"dap config
nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-d> :lua require'dap'.continue()<CR>
nnoremap <C-s> :lua require'dapui'.open()<CR>
nnoremap <C-q> :lua require'dapui'.close()<CR>
