# FileLabel

Represents a label control with a button that allows the user to easily select a file.

![filelabel](/docs/filelabel/filelabel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

## Constructor

Initializes a new file label instance.

```Lua
FileLabel(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("FileLabel", "fixed", 320, 250)

local label = uiex.FileLabel(win, "", 40, 80, 250)
label.bgcolor = 0xFFFFFF
label.fontstyle = { bold = true }

ui.run(win):wait()
```
