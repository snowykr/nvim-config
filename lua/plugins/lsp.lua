local keyMapper = require('utils.keyMapper').mapKey

return {
    -- mason: LSP 서버 설치
    {
        "mason-org/mason.nvim",
        opts = {}
    },

    -- mason-lsconfig: mason 과 nvim-lspconfig 연결
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls", "ts_ls", "gopls", "rust_analyzer", "pyright", "clangd" }
        },
    },

    -- nvim-lspconfig: LSP 설정
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {},
                ts_ls = {},
                gopls = {},
                rust_analyzer = {},
                pyright = {},
                clangd = {},
            }
        },
        config = function(_, opts)
            keyMapper('K', vim.lsp.buf.hover)
            keyMapper('gd', vim.lsp.buf.definition)
            keyMapper('<leader>ca', vim.lsp.buf.code_action)
        end,
    }
}
