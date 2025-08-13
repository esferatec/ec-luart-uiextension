# BorderPicture

Represents a picture control with a border.

![borderlabel](/docs/borderpicture/borderpicture01.png)

**Note:**
This documentation describes only the additional properties and methods.
The standard properties, methods and events can be found in the [LuaRT Picture](https://www.luart.org/doc/ui/Picture.html) documentation.

## Constructor

Initializes a new border picture instance.

```Lua
BorderPicture(parent, image, [x], [y], [width], [height])
```

## Example

```Lua
local ui = require("ui")
local sys = require("sys")
local uibd = require("ecluart.uiborder")

local win = ui.Window("BoderPicture", "fixed", 320, 250)

local picture = uibd.BorderPicture(win, sys.File(arg[0]).path.."\\LuaRT.png")
picture:center()

ui.run(win):wait()
```
