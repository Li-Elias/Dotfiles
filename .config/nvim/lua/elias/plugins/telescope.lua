return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                    }
                }
            }
        })

        telescope.load_extension("fzf");

        vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd"})
        vim.keymap.set("n", "<leader>f", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd"})
        vim.keymap.set("n", "<leader>g", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd"})
    end
}
