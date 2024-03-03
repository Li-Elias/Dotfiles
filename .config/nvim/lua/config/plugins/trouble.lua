return {
    "folke/trouble.nvim",
    config = function()
        local trouble = require("trouble")

        trouble.setup({
            icons = false,
            indent_lines = false,
            signs = {
                error = "E",
                warning = "W",
                hint = "H",
                information = "I"
            },
            use_diagnostic_signs = false
        })

        vim.keymap.set("n", "<leader>tt", function()
            trouble.toggle()
        end)

        vim.keymap.set("n", "[t", function()
            trouble.next({ skip_groups = true, jump = true });
        end)

        vim.keymap.set("n", "]t", function()
            trouble.previous({ skip_groups = true, jump = true });
        end)
    end,
}
