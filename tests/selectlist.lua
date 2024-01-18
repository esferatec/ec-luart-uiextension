local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("SelectList", "fixed", 320, 250)
win:status()

local list1 = uiex.SelectList(win, { "Item 1", "Item 2", "Item 3" }, 10, 60)
local list2 = uiex.SelectList(win, { "Item 1", "Item 2", "Item 3" }, 150, 60)

function list1:onDoubleClick(item)
  super(self).onDoubleClick(self, item)

  local status = ""

  for _, text in pairs(self.selecteditems) do
    status = status .. text .. "; "
  end
  win:status(status)
end

ui.run(win):wait()
