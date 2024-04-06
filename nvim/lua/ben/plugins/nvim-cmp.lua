return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "https://codeberg.org/FelipeLema/cmp-async-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      version = "v2.*",
      config = true
    },
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  },
  event = "InsertEnter",
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- replace select_next_item() with confirm({select = true}) for VSCode style autocomplete
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert})

          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {"i", "s"}),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "async_path" },
        { name = "calc" },
        { name = "nvim_lsp_signature_help" },
      }, {
        { name = "buffer" }
      }),

      formatting = {
        format = function(_, item)
          local icons = {
            Array = ' ',
            Boolean = ' ',
            Class = ' ',
            Color = ' ',
            Constant = ' ',
            Constructor = ' ',
            Copilot = ' ',
            Enum = ' ',
            EnumMember = ' ',
            Event = ' ',
            Field = ' ',
            File = ' ',
            Folder = ' ',
            Function = ' ',
            Interface = ' ',
            Key = ' ',
            Keyword = ' ',
            Method = ' ',
            Module = ' ',
            Namespace = ' ',
            Null = ' ',
            Number = ' ',
            Object = ' ',
            Operator = ' ',
            Package = ' ',
            Property = ' ',
            Reference = ' ',
            Snippet = ' ',
            String = ' ',
            Struct = ' ',
            Text = ' ',
            TypeParameter = ' ',
            Unit = ' ',
            Value = ' ',
            Variable = ' ',
          }
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = { ghost_text = { hl_group = 'CmpGhostText' } },
      -- window = { completion = cmp.config.window.bordered(), documentation = cmp.config.window.bordered() },
      view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
    }
  end,

  config = function(_, opts)
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.setup(opts)
    ---@Diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } }
    })
    ---@Diagnostic disable-next-line: missing-fields
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" }
      }, {
        { name = "cmdline" }
      })
    })
    -- nvim-autopairs integration
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
}
