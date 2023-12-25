# ColumnPanel

Represents a panel control containing a collection of children objects. The onClick event saves the current row.

![ColumnPanel](/docs/columnpanel/columnpanel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Panel](https://www.luart.org/doc/ui/Panel.html) documentation.

The border is not visible by default.

## Constructor

Initializes a new column panel instance.

```Lua
ColumnPanel(parent, [kind], [rows], [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
kind | object | Sets the type of children objects. The default is ui.Label.
rows | number | Sets the total amount of children objects. The default is 1.

## Property - GAP

Gets or sets the gap between the children objects.

```Lua
ColumnPanel.gap (number)
```

## Property - KIND

Gets or sets the type of children objects.

```Lua
ColumnPanel.kind (object)
```

## Property - ROWS

Gets or sets the total amount of children objects.

```Lua
ColumnPanel.rows (number)
```

## Methode - CHANGE

Changes a property of all children.

```Lua
ColumnPanel:change(key, value)
```

## Methode - REARRANGE

Rearranges the position all children.

```Lua
ColumnPanel:rearrange()
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local table = { "house", "car", "flat", "dog", "cat", "ship" }

local win = ui.Window("ColumnPanel", "fixed", 520, 350)

local column1 = uiex.ColumnPanel(win, Object(ui.Checkbox), 3, 10, 10, 200, 25)
column1.gap = 20

function column1:onCreate()
    super(self).onCreate(self)

    column1.children[1].text = "1/4 cup (28g) confectioners' sugar"
    column1.children[2].text = "6 tablespoons (85g) butter, melted"
    column1.children[3].text = "1/8 teaspoon table salt"
end

local column2 = uiex.ColumnPanel(win, Object(ui.Entry), 10, 250, 10, 200, 440)
column2.gap = 5

function column2:onCreate()
    super(self).onCreate(self)

    for i = 1, #table do
        column2.children[i].text = table[i]
    end
end

local button = ui.Button(win, "Get Current Text", 250, 300)

function button:onClick()
    ui.info(column2.currentrow .. ". " .. column2.children[column2.currentrow].text)
end

ui.run(win):wait()
```

![ColumnPanel](/docs/columnpanel/columnpanel01.png)
