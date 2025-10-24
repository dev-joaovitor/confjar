if vim.uv.os_getenv("WSLENV") then -- see vim.uv.environ()
    vim.g.clipboard = {
        name = "wsl-clipboard",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
            ["*"] = "powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))",
        },
        cache_enabled = 0,
    }
end

vim.o.guicursor = ""

vim.o.nu = true
vim.o.relativenumber = true

-- tab size
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true
vim.o.cindent = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

-- vim.o.colorcolumn = "80"

-- <leader>
vim.g.mapleader = " "

-- <localleader>
vim.g.maplocalleader = "\\"
