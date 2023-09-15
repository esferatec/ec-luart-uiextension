local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileLink", "fixed", 320, 250)

local link = uiex.FileLink(win, "C:\\LuaRT\\lua54.dll")
link:center()

win:show()

while win.visible do
  ui.update()
end