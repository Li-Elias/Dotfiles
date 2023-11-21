return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup {
                style = "warm",
                transparent = true,
            }
            require("onedark").load()
        end,
    },

    -- {
    --     "olimorris/onedarkpro.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("onedarkpro").setup({
    --             colors = {
    --                 onedark_vivid = { bg = "#262626" },
    --             }
    --         })
    --         vim.cmd("colorscheme onedark_vivid")
    --     end,
    -- },

    -- {
    --     'craftzdog/solarized-osaka.nvim',
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require('solarized-osaka').setup({
    --             transparent = true,
    --         })
    --         require('solarized-osaka').load()
    --     end,
    -- },
}
