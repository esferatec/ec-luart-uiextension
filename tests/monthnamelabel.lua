local ui = require("ui")
local uidt = require("ecluart.uidatetime")

local win = ui.Window("MonthnameLabel", "fixed", 320, 250)

local name = uidt.MonthnameLabel(win, "", 10, 10)
name.datetime = sys.Datetime()
name:center()
name.fontstyle = { bold = true }

ui.run(win):wait()
