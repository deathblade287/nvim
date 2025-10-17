-- =========================
-- LSP: 2025-style minimal
-- =========================

-- 1) Global LSP defaults (apply to all servers)
vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			completion = { completionItem = { snippetSupport = true } },
		},
	},
	root_markers = { ".git", "pyproject.toml", "package.json", "Cargo.toml", "compile_commands.json" },
})

-- 2) Server-specific configs
-- Python: pyright
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

-- Rust: rust-analyzer
vim.lsp.config("rust_analyzer", {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			check = { command = "clippy" },
		},
	},
})

-- Lua: lua-language-server (a.k.a. lua_ls)
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

-- C/C++: clangd
vim.lsp.config("clangd", {
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
})

-- 3) Enable only these servers
vim.lsp.enable({ "pyright", "rust_analyzer", "lua_ls", "clangd" })

-- 4) No auto completion popups: manual only
--    - Use built-in omni-completion and trigger it yourself with <C-Space>
vim.o.completeopt = "menu,menuone,noselect"
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { silent = true })

-- Optional: quieten messages from completion
vim.opt.shortmess:append("c")

-- Optional: disable signature-help popups (they can feel "auto")
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

-- 5) Diagnostics UI: no virtual text (less noisy), use signs/underline; float on demand
vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = true,
	update_in_insert = false,
	severity_sort = true,
})

-- On demand: show diagnostics for the line under cursor
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- 6) Buffer-local LSP keymaps when a server attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf

		-- use omni-completion for this buffer
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local function bufmap(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
		end

		bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
		bufmap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
		bufmap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		bufmap("n", "gr", vim.lsp.buf.references, "References")
		bufmap("n", "K", vim.lsp.buf.hover, "Hover")
		bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
		bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
		bufmap("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
	end,
})
