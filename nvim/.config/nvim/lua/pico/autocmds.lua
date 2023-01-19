local api = vim.api


api.nvim_create_augroup("pyautosave", {clear=True})
vim.api.nvim_create_autocmd("FileType", {
    pattern="python",
    group="pyautosave",
    callback = function(opts)
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer=opts.buffer,
            command=[[%s/\s\+$//e]]
        })
    end,
})
