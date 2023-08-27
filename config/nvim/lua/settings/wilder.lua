local wilder = require("wilder")
wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option("pipeline", {
	wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline()),
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
		-- 'single', 'double', 'rounded' or 'solid'
		-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
		border = "rounded",
		highlighter = wilder.basic_highlighter(),

		highlights = {
			accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#7aa2f7" } }),
			border = "Normal",
		},
	}))
)
