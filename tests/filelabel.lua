local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileLabel", "fixed", 320, 250)

local check = uiex.FileLabel(win, "", 40, 80, 250, 15)
check.bgcolor = 0xFFFFFF
check.fontstyle = { bold = true }

ui.run(win):wait()
