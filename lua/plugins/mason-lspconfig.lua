return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls", "bashls", "jsonls", "docker_language_server",
            "docker_compose_language_service", "marksman", "yamlls",
        },

        automatic_enable = true,
    },
}
