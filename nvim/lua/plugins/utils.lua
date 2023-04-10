return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            disable_filetype = { "TelescopePrompt" },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        event = "BufReadPre",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        dependencies = "nvim-lua/plenary.nvim",
        opts = {
            show_help_hints = false,
        },
    },
    {
        "fatih/vim-go",
        build = ":GoUpdateBinaries",
        ft = "go",
    },
}
