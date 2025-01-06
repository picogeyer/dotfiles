local api = vim.api

api.nvim_create_augroup("pyautosave", {clear=true})
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
api.nvim_create_augroup("fileopts", {clear=true})
api.nvim_create_autocmd("FileType", {
    pattern="nix",
    group="fileopts",
    command="set et sw=2 ts=2"
})
api.nvim_create_autocmd("FileType", {
    group="fileopts",
    command = "set et sw=4 ts=4"
})
api.nvim_create_autocmd("FileType", {
    pattern = { "c" },
    group="fileopts",
    command="set noet sw=4 ts=4"
})
api.nvim_create_autocmd("FileType", {
    pattern = { "yaml" },
    group="fileopts",
    command="set sw=2 ts=2"
})
api.nvim_create_autocmd({"BufEnter", "BufRead"}, {
    pattern = { "Kbuild" },
    group="fileopts",
    command="set filetype=make noet sw=2 ts=2"
})
api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit" },
    group="fileopts",
    command = "set spell"})
api.nvim_create_autocmd({"BufEnter", "BufRead"}, {
    pattern = { "SConstruct", "SConscript", "SConscript.*" },
    group="fileopts",
    command = "set filetype=python"})
