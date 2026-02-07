require("mason").setup({
	registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
	    },

	ui = {
		icons = {
			package_installed = "INSTALLED",
			package_pending = "PENDING",
			package_uninstalled = "UNINSTALLED"
		}
	}
})
