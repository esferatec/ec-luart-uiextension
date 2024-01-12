local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("StrikeCheckbox", "fixed", 320, 250)

local check = uiex.StrikeCheckbox(win, "Update uiextension documentation", 10, 10)
check:center()

check.checked = true

ui.run(win):wait()