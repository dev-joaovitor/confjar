-- explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

-- line movement
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line down" })

-- navigate through
-- search matches
-- but the cursor
-- statys on the middle
vim.keymap.set("n", "n", "nzzzv", { desc = "Next (keep cursor in the middle)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous (keep cursor in the middle)" })

-- save current file
-- and format with prettier
vim.keymap.set(
    "n",
    "gp",
    ":w<CR>:silent %!prettier --stdin-filepath %<CR>",
    { desc = "[G]et [P]retty" }
)
