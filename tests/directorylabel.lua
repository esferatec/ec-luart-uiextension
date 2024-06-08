local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryLabel", "fixed", 320, 250)

local label = uiex.DirectoryLabel(win, "", 40, 80, 250)
label.bgcolor = 0xFFFFFF

ui.run(win):wait()
