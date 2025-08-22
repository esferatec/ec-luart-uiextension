# ColumnPanel

Represents a panel control containing a collection of children widgets. The onClick event saves the current row.

![ColumnPanel](/docs/columnpanel/columnpanel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Panel](https://www.luart.org/doc/ui/Panel.html) documentation.

The border is not visible by default.

## Constructor

Initializes a new column panel instance.

```Lua
ColumnPanel(parent, [kind], [rows], [gap], [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
kind | object | Sets the type of children widget. The default is Object(ui.Label).
rows | number | Sets the total amount of children widgets. The default is 1.
gap | number | Sets the gap between the children widgets. The default ist 5.

## Property - ITEMS

Provides access to the column panel items.

```Lua
ColumnPanel.items (table)
```

## Method - CHANGE

Changes a property of all children.

```Lua
ColumnPanel:change(key, value)
```

## Example

```Lua
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
```
