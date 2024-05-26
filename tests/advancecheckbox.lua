local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("AdvancedCheckbox", "fixed", 320, 250)

local check = uiex.AdvancedCheckbox(win, "123456789 123456789 123456789 123456789 123456789 123456789", 40, 80, 250, 22)
check.fontstyle = { bold = true }

ui.run(win):wait()
