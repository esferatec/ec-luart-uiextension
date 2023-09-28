# SelectList

Represents a list control containing a collection of selectable items. The onDoubleClick event selects or deselects the item.

![selectlist](/docs/selectlist/selectlist01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT List](https://www.luart.org/doc/ui/List.html) documentation.

The onDoubleClick event should not be overridden.

## Constructor

Initializes a new select list instance.

```Lua
SelectList(parent, items, [x], [y], [width], [height])
```

Parameter | Type | Description
---|---|---
-- | -- | --

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("SelectList", "fixed", 320, 250)
win:status()

local list = uiex.SelectList(win, {"Item 1", "Item 2", "Item 3"}, 120, 60)
list:center()

function list:onDoubleClick(item)
    super(self).onDoubleClick(self, item)

    local status = ""

    for _, text in pairs(self.selecteditems) do
        status = status .. text .. "; "
    end
    win:status(status)
end

ui.run(win):wait()
```

![selectlist](/docs/selectlist/selectlist01.png)
