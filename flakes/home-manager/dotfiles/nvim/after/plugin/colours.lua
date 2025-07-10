--This is a function that I stole from ThePrimagen
--It restores transparency after updates
function ColourMyPencils(colour)
	colour = colour or "tokyonight"
	vim.cmd.colorscheme(colour)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourMyPencils()










