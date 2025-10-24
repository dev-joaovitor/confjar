return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    init = function ()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup({
            settings = {
                sync_on_ui_close = true,
                save_on_toggle = true
            }
        })
        -- REQUIRED

        vim.keymap.set(
            "n",
            "<leader>a",
            function() harpoon:list():add() end,
            { desc = "Harpoon: [A]dd to list" }
        )
        vim.keymap.set(
            "n",
            "<C-e>",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Harpoon: [E]xplore list" }
        )

        vim.keymap.set(
            "n",
            "<C-j>",
            function() harpoon:list():prev() end,
            { desc = "Harpoon: Go to previous buffer" }
        )

        vim.keymap.set(
            "n",
            "<C-k>",
            function() harpoon:list():next() end,
            { desc = "Harpoon: Go to next buffer" }
        )
    end
}
