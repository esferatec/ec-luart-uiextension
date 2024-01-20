local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryLink", "fixed", 320, 250)

local link = uiex.DirectoryLink(win, "LuaRT")
link.link = "C:\\LuaRT"
link:center()

ui.run(win):wait()
