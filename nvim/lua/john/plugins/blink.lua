return {
    -- allows extra capabilities provided by blink.cmp
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
        "onsails/lspkind.nvim"
    },
    opts = {
        keymap = {
            preset = "default",

            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            --["<Tab>"] = { "snippet_forward", "fallback" },
            --["<S-Tab>"] = { "snippet_forward", "fallback" },
            ["<CR>"] = { "accept", "fallback" },

            ["<C-d>"] = {
                function(cmp)
                    cmp.scroll_documentation_down(4)
                end,
            },
            ["<C-u>"] = {
                function(cmp)
                    cmp.scroll_documentation_up(4)
                end,
            },
        },

        appearance = {
            nerd_font_variant = "mono",
            kind_icons = {              -- supply glyphs your font actually has
                Text = "ſ", Method = "->", Function = "->", Constructor = "->",
                Field = "µ", Variable = "->", Class = "->", Interface = "->",
                Module = "->", Property = "->", Unit = "->", Value = "->",
                Enum = "->", Keyword = "->", Snippet = "->", Color = "->",
                File = "->", Reference = "->", Folder = "->", EnumMember = "->",
                Constant = "->", Struct = "->", Event = "->", Operator = "->",
                TypeParameter = "->",
            },
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
            },

            menu = {
                draw = {}
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "lazydev" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },

        fuzzy = { implementation = "lua" },

        signature = { enabled = true },
    },
}

