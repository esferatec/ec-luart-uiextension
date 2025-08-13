local ui = require("ui")
local uibd = require("ecluart.uiborder")

local win = ui.Window("BorderLabel", "fixed", 320, 250)

local label = uibd.BorderLabel(win, " Hello ")
label.fontsize = 16
label:autosize()
label:center()

ui.run(win):wait()
