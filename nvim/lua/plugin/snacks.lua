local status, snacks = pcall(require, "snacks")
if not status then
	vim.notify("no snacks")
	return
end

snacks.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	bigfile = { enabled = true },
	dashboard = {
		pane_gap = 20,
		preset = {
			header = [[
 __                               
/  |                              
$$ |       __   __   __   ______  
$$ |      /  | /  | /  | /      \ 
$$ |      $$ | $$ | $$ |/$$$$$$  |
$$ |      $$ | $$ | $$ |$$ |  $$ |
$$ |_____ $$ \_$$ \_$$ |$$ \__$$ |
$$       |$$   $$   $$/ $$    $$ |
$$$$$$$$/  $$$$$/$$$$/   $$$$$$$ |
                        /  \__$$ |
                        $$    $$/ 
                        $$$$$$/
			]],
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1 },
			{ section = "startup", padding = { 0, 2 } },
			{ pane = 2, section = "header" },
			{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
			{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
		},
	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
})
