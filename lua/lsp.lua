vim.opt.completeopt = "menu,menuone,noselect"
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true, desc = "Trigger LSP omni completion" })
vim.opt.shortmess:append("c") -- fewer completion msgs
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

local root_patterns = {
	"pyproject.toml", "poetry.lock", "setup.py", "requirements.txt",
	"Cargo.toml",
	"compile_commands.json", "compile_flags.txt", "CMakeLists.txt",
	".git",
}

vim.lsp.config("*", {
	root_markers = root_patterns,
	capabilities = {
		textDocument = {
			completion = { completionItem = { snippetSupport = true } },
		},
	},
})

vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
				buildScripts = { enable = true },
			},
			procMacro = { enable = true },
			completion = {
				autoimport = { enable = true },
				fullFunctionSignatures = { enable = true },
			},
			imports = {
				granularity = { group = "module" },
				prefix = "by_crate",
			},
			check = { command = "clippy" },
		},
	},
})

vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			telemetry = { enable = false },
			format = { enable = true },
		},
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.lsp.enable({ "pyright", "rust_analyzer", "lua_ls", "clangd" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local function bufmap(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		bufmap("n", "gr", vim.lsp.buf.references, "References")
		bufmap("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
		bufmap("n", "K", vim.lsp.buf.hover, "Hover")
		bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")

		bufmap("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, "Format buffer")
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		local clients = vim.lsp.get_clients({ bufnr = args.buf })
		for _, c in ipairs(clients) do
			if c.server_capabilities and c.server_capabilities.documentFormattingProvider then
				vim.lsp.buf.format({ bufnr = args.buf })
				return
			end
		end
		if vim.bo[args.buf].filetype == "python" then
			vim.fn.jobstart({ "black", vim.api.nvim_buf_get_name(args.buf) }, { detach = true })
		end
	end,
})
