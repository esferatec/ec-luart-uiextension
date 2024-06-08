local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileLabel", "fixed", 320, 250)

local label = uiex.FileLabel(win, "", 40, 80, 250)
label.bgcolor = 0xFFFFFF
label.fontstyle = { bold = true }

ui.run(win):wait()
