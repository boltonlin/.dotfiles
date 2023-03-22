LIGHT_MODE = 0
DARK_MODE = 1

function ColorMyPencils(color, mode, transp)
	color = color or "gruvbox"

    if mode == DARK_MODE then
        mode = "dark"
    else
        mode = "light"
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
