local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("HyperLink", "fixed", 320, 250)

local link = uiex.HyperLink(win, "www.luart.org")
link:center()

ui.run(win):wait()
