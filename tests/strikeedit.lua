local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeEdit", "fixed", 320, 250)

local check = uiex.StrikeEdit(win, "Update uiextension documentation", 40, 40, 250, 40)

check.checked = true

ui.run(win):wait()
