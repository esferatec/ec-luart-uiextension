local ui = require("ui")
local uiex = require("ecluart.uiextension")

local table = { "house", "car", "flat", "dog", "cat", "ship" }

local win = ui.Window("ColumnPanel", "fixed", 520, 350)

local column1 = uiex.ColumnPanel(win, Object(ui.Checkbox), 3, 20, 10, 10, 200, 25)

function column1:onCreate()
  super(self).onCreate(self)

  column1.items[1].text = "1/4 cup (28g) confectioners' sugar"
  column1.items[2].text = "6 tablespoons (85g) butter, melted"
  column1.items[3].text = "1/8 teaspoon table salt"
end

local column2 = uiex.ColumnPanel(win, Object(ui.Entry), 10, 5, 250, 10, 200, 440)

function column2:onCreate()
  super(self).onCreate(self)

  for i = 1, #table do
    column2.items[i].text = table[i]
  end
end

local button = ui.Button(win, "Get Current Text", 250, 300)

function button:onClick()
  ui.info(column2.currentrow .. ". " .. column2.items[column2.currentrow].text)
end

ui.run(win):wait()
