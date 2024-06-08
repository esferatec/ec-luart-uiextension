local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileEntry", "fixed", 320, 250)

local entry = uiex.FileEntry(win, "", 40, 80, 250, 22)
entry.fontstyle = { bold = true }

ui.run(win):wait()
