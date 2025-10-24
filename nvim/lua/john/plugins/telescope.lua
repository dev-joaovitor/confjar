return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = "nvim-lua/plenary.nvim",
    init = function ()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope [S]earch [F]iles" })
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope [S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope [S]earch [D]iagnostics" })
        vim.keymap.set(
            "n",
            "<leader>sw",
            function()
                builtin.grep_string({
                    search = vim.fn.input("Grep > ")
                })
            end,
            { desc = "Telescope [S]earch [W]ord" }
        )
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope [P]roject files" })
    end
}
