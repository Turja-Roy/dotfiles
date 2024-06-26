return {
    'nvim-tree/nvim-tree.lua',
    config = {
        filters = {
            dotfiles = true,
        },
        view = {
            width = 30,
        },
    },
    keys = {
        { '<leader>n', function()
            return require("nvim-tree.api").tree.toggle()
        end
        }
    },
}
-- vim.keymap.set
