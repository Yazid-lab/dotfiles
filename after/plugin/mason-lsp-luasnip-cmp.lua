require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

--LUA SNIP AND NVIM-CMP SETUP
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- luasnip setup
local luasnip = require("luasnip")
local lspkind = require("lspkind")
require("luasnip.loaders.from_vscode").lazy_load()
-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp", max_item_count = 15 },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[buff]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	},
	{ max_item_count = 10 },
	-- experimental = {
	-- 	native_menu = false,
	-- }
})
--LSP CONFIG WITH MASON
local lspconfig = require("lspconfig")
--ADD capabilities capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(client, bufnr)
	local function map(mode, l, r, desc)
		vim.keymap.set(mode, l, r, { noremap = true, silent = true, buffer = bufnr, desc = desc })
	end

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	--LSP Keymaps
	map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "K", vim.lsp.buf.hover, "Show help menu hover")
	map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
	map("n", "<leader>dk", vim.diagnostic.goto_prev, "diagnostic go to previous")
	map("n", "<leader>dj", vim.diagnostic.goto_next, "diagnostic go to next")
	map("n", "<leader>r", vim.lsp.buf.rename, "diagnostic rename")
	map("n", "<leader>ca", vim.lsp.buf.code_action, "Diagnostic code action")
	map("n", "<leader>e", vim.diagnostic.open_float, "Diagnostic open float")
	map("n", "<leader>fm", vim.lsp.buf.format, "Diagnostic format")
end
require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	-- Next, you can provide targeted overrides for specific servers.
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
	["tsserver"] = function()
		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["pyright"] = function()
		lspconfig.pyright.setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
