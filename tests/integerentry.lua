local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("IntegerEntry", "fixed", 420, 250)

local entry = uiex.IntegerEntry(win, "5", 40, 80, 80, 22)
--entry.fontstyle = { bold = true }

ui.run(win):wait()
