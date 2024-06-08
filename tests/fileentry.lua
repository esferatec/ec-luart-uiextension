local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileEntry", "fixed", 320, 250)

local check = uiex.FileEntry(win, "", 40, 80, 250, 22)
check.fontstyle = { bold = true }

--check.width = 100

check.x = 0
check.y = 0
check.width = 80
check.height = 40

ui.info(check.width)

ui.run(win):wait()
