LIGHT_MODE = 0
DARK_MODE = 1

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {
                       -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = true, -- Force no italic
    no_bold = false,  -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        mason = true,
    },
})

function ColorMyPencils(color, mode, transp)
    color = color or "catppuccin-macchiato"

    if mode == DARK_MODE then
        mode = "light"
    else
        mode = "dark"
    end

    transp = transp or 1

    vim.cmd(string.format("set background=%s", mode))
    vim.cmd.colorscheme(color)

    if color == "gruvbox" then
        vim.cmd("let g:gruvbox_italic = '1'")
        vim.cmd("let g:gruvbox_contrast_light = 'soft'")
    end

    if transp == 1 then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

ColorMyPencils()
