local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeEntry", "fixed", 320, 250)

local check = uiex.StrikeEntry(win, "Update uiextension documentation", 40, 40, 250)
check.fontstyle = { bold = true }

check.checked = true

ui.run(win):wait()
