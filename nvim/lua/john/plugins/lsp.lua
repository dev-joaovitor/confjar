return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "mason-org/mason-lspconfig.nvim",

        -- useful status updates for LSP
        { "j-hui/fidget.nvim", opts = {} },
    },
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            desc = "LSP Actions",

            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                map("K", vim.lsp.buf.hover, "Hover Docs")
                map("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
                map("gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
                map("gD", vim.lsp.buf.code_action, "[G]o to [D]eclaration")
                map("grn", vim.lsp.buf.rename, "[G]et to [R]e[n]ame")
                map(
                    "<leader>e",
                    function()
                        vim.diagnostic.open_float({ scope = "line" })
                    end,
                    "Show [E]rror"
                )
            end
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = true,
            },
        })

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        }

        local blink_capabilities = require("blink.cmp").get_lsp_capabilities()

        for server, config in pairs(servers) do
            config.capabilites = blink_capabilities
            vim.lsp.config(server, config)
        end

        local ensure_installed = vim.tbl_keys(servers or {})

        vim.list_extend(ensure_installed, {
            "jdtls",
            "intelephense",
            "html",
            "cssls",
            "ts_ls",
            "clangd",
            "eslint",
            "sqlls",
            -- "rust_analyzer",
            -- "gopls",
        })

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
        })
    end
}
