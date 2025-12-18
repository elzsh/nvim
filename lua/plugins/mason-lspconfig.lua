return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls" },

        handlers = {
            function(server_name)
                local lspconfig = require("lspconfig")
                lspconfig[server_name].setup({})
            end,
        },
    },
}
