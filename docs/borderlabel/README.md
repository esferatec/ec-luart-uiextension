# BorderLabel

Represents a label control with a border.

![borderlabel](/docs/borderlabel/borderlabel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

## Constructor

Initializes a new border label instance.

```Lua
BorderLabel(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uibd = require("ecluart.uiborder")

local win = ui.Window("BorderLabel", "fixed", 320, 250)

local label = uibd.BorderLabel(win, " Hello ")
label.fontsize = 16
label:autosize()
label:center()

ui.run(win):wait()
```
