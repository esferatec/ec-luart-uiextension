local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryLabel", "fixed", 320, 250)

local check = uiex.DirectoryLabel(win, "", 40, 80, 250)

ui.run(win):wait()
