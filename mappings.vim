"tabs made easy
nnoremap <TAB> :BufferLineCycleNext<CR>
nnoremap <S-TAB> :BufferLineCyclePrev<CR>
nnoremap <C-x> :BufferClose<CR>


"dap config
nnoremap <C-b> :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <C-d> :lua require'dap'.continue()<CR>
nnoremap <C-s> :lua require'dapui'.open()<CR>
nnoremap <C-q> :lua require'dapui'.close()<CR>
