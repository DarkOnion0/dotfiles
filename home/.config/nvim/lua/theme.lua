--vim.g.onedark_termcolors = 24
--vim.g.onedark_terminal_italics = 1
--
--vim.cmd([[
--  colorscheme onenord
--]])

--
-- Theme auto switcher
--
--vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
--vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

--vim.cmd.colorscheme("cyberdream")

local timer = vim.loop.new_timer()
vim.g.auto_switch = true

function switchDark()
	--vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
	vim.o.background = "dark"
end

function switchLight()
	--vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
	vim.o.background = "light"
end

timer:start(
	1,
	60,
	vim.schedule_wrap(function() -- run the timer every 1 minute
		local hour = tonumber(os.date("%H"))
		local bg = "dark"

		if hour >= 7 and hour < 17 then
			bg = "light"
		end

		if vim.o.bg ~= bg and vim.g.auto_switch then
			if bg == "dark" then
				switchDark()
			else
				switchLight()
			end
		end
	end)
)
