local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("Filelink", "fixed", 320, 250)

local link = uiex.DirectoryLink(win, "C:\\LuaRT")
link:center()

win:show()

while win.visible do
  ui.update()
end