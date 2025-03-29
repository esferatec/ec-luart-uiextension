# DirectoryLabel

Represents a label control with a button that allows the user to easily select a directory.

![directorylabel](/docs/directorylabel/directorylabel01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Label](https://www.luart.org/doc/ui/Label.html) documentation.

## Constructor

Initializes a new directory label instance.

```Lua
DirectoryLabel(parent, caption, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local uiex = require("ecluart.uiextension")

local win = ui.Window("DirectoryLabel", "fixed", 320, 250)

local label = uiex.DirectoryLabel(win, "", 40, 80, 250)
label.bgcolor = 0xFFFFFF

ui.run(win):wait()
```

![directorylabel](/docs/directorylabel/directorylabel01.png)
