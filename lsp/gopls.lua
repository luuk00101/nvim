return {
  settings = {
    gopls = {
      staticcheck = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
    },
  },

}
