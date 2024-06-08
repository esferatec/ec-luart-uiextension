local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryEntry", "fixed", 320, 250)

local check = uiex.DirectoryEntry(win, "", 40, 80, 250, 22)
check.fontstyle = { bold = true }

ui.run(win):wait()
