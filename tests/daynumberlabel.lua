local ui = require("ui")
local uidt = require("ecluart.uidatetime")

local win = ui.Window("DaynumberLabel", "fixed", 320, 250)

local number = uidt.DaynumberLabel(win, "", 10, 10)
number.datetime = sys.Datetime()
number:center()
number.fontstyle = { bold = true }

ui.run(win):wait()
