-- Set up the look
vim.cmd("colorscheme chadracula_evondev")
vim.cmd("set relativenumber")
vim.cmd("NvimTreeOpen")
vim.opt.tabstop = 4		   -- Number of spaces that a <Tab> counts for (display width of a tab)
vim.opt.shiftwidth = 4	   -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 4    -- Insert/delete 4 spaces for a tab press (when in insert mode)
vim.opt.expandtab = false  -- Don't convert tabs to spaces
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.opt.softtabstop = 4
		vim.opt.expandtab = false
	end
})

local autocmd_id

autocmd_id = vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Move cursor to the window on the right (if available)
        vim.defer_fn(function()
            if #vim.api.nvim_list_wins() > 1 then
                vim.cmd("wincmd l")  -- Move to the right window
            end

            -- Disable this autocmd after it runs once
            if autocmd_id then
                vim.api.nvim_del_autocmd(autocmd_id)
            end
        end, 10)  -- Small delay to ensure windows are initialized
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		vim.cmd("retab")
	end
})
