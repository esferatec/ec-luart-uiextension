local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("LinkRadiobutton", "fixed", 320, 250)

local link = uiex.LinkRadiobutton(win, "About", 10, 10)
link:center()
link.fontstyle = { bold = true }

function link:onClick()
  ui.info("About")
end

ui.run(win):wait()
